import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';

import '../helpers/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bible_reader_screen.dart';

class ProfileScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode?> onThemeModeChanged;
  final VoidCallback onLogout;
  final String? sessionUser;
  final ValueChanged<int>? onNavigateToVerse;

  const ProfileScreen({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.onLogout,
    required this.sessionUser,
    this.onNavigateToVerse,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _currentUsername;
  int _streakDays = 0;
  int _appTimeMinutes = 0;

  @override
  void initState() {
    super.initState();
    _currentUsername = widget.sessionUser ?? 'Usuario';
    _loadUserStats();
  }

  Future<void> _loadUserStats() async {
    if (_currentUsername == 'Usuario') return;
    final user = await DatabaseHelper.getUser(_currentUsername);
    if (user != null) {
      final stats = await DatabaseHelper.getUserStats(user['id'] as int);
      setState(() {
        _streakDays = stats['streak_days'] as int? ?? 0;
        _appTimeMinutes = stats['app_time_minutes'] as int? ?? 0;
      });
    }
  }

  // --- NUEVAS VARIABLES DE ESTADO PARA VERSÍCULOS ---
  List<Verse> _favoriteVerses = [];
  Map<Verse, String> _notedVerses = {};
  Map<Verse, int> _highlightedVerses = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadVersesData(); // Recarga si se navega de regreso a este tab
  }

  Future<void> _loadVersesData() async {
    // 1. Favoritos
    List<String> favKeys = await PrefsHelper.getFavoriteVerses();
    List<Verse> fetchedFavs = [];
    for (String key in favKeys) {
      Verse? v = await _fetchVerseByKey(key);
      if (v != null) fetchedFavs.add(v);
    }

    // 2. Notas
    Map<String, String> noteKeys = await PrefsHelper.getVerseNotes();
    Map<Verse, String> fetchedNotes = {};
    for (var entry in noteKeys.entries) {
      if (entry.value.trim().isNotEmpty) {
        Verse? v = await _fetchVerseByKey(entry.key);
        if (v != null) fetchedNotes[v] = entry.value;
      }
    }

    // 3. Subrayados
    Map<String, int> hlKeys = await PrefsHelper.getHighlightedVerses();
    Map<Verse, int> fetchedHl = {};
    for (var entry in hlKeys.entries) {
      Verse? v = await _fetchVerseByKey(entry.key);
      if (v != null) fetchedHl[v] = entry.value;
    }

    if (mounted) {
      setState(() {
        _favoriteVerses = fetchedFavs;
        _notedVerses = fetchedNotes;
        _highlightedVerses = fetchedHl;
      });
    }
  }

  Future<Verse?> _fetchVerseByKey(String key) async {
    // el key es "bookId_chapter_verse"
    final parts = key.split('_');
    if (parts.length == 3) {
      int? b = int.tryParse(parts[0]);
      int? c = int.tryParse(parts[1]);
      int? v = int.tryParse(parts[2]);
      if (b != null && c != null && v != null) {
        return await DatabaseHelper.getVerse(b, c, v);
      }
    }
    return null;
  }

  void _navigateToVerse(Verse verse) async {
    // Guarda la posición actual para que el Reader abra ahí
    await PrefsHelper.saveLastBiblePosition(verse.bookId, verse.chapter);
    if (!mounted) return;
    
    if (widget.onNavigateToVerse != null) {
      widget.onNavigateToVerse!(verse.verse);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BibleReaderScreen(
            initialScrollToVerse: verse.verse,
          ),
        ),
      ).then((_) {
        // Al volver, refrescamos los datos por si quitó algún favorito o subrayado
        _loadVersesData();
      });
    }
  }

  String _formatAppTime(int minutes) {
    if (minutes < 60) return '${minutes}m';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return '${h}h ${m}m';
  }

  void _showEditProfileDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController(text: _currentUsername);
    final _passwordController = TextEditingController();
    bool _isLoading = false;
    String? _errorMessage;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Editar Perfil', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(labelText: 'Nuevo Usuario', prefixIcon: Icon(Icons.person)),
                        validator: (value) => value == null || value.trim().isEmpty ? 'El nombre no puede estar vacío' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(labelText: 'Nueva Contraseña (Opcional)', prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                      ),
                      if (_errorMessage != null) ...[
                        const SizedBox(height: 16),
                        Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
                      ],
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setStateDialog(() {
                              _isLoading = true;
                              _errorMessage = null;
                            });

                            final newUsername = _usernameController.text.trim();
                            // Si la contraseña está en blanco, mantenemos la anterior (requerirá lógica en el Helper o simplemente aquí)
                            // Para simplificar, asumiremos que obligamos a meter una contraseña, o buscaremos la actual.
                            
                            // Buscar usuario actual para sacar la contraseña si la dejan en blanco
                            String newPassword = _passwordController.text;
                            if (newPassword.isEmpty) {
                               final currentUserData = await DatabaseHelper.getUser(_currentUsername);
                               if (currentUserData != null) {
                                 newPassword = currentUserData['password'];
                               }
                            }

                            final success = await DatabaseHelper.updateUser(_currentUsername, newUsername, newPassword);

                            if (success) {
                              // Actualizar sesión en SharedPreferences
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setString('session_user', newUsername);
                              
                              setState(() {
                                _currentUsername = newUsername;
                              });
                              
                              if (context.mounted) {
                                Navigator.of(dialogContext).pop();
                                _loadUserStats(); // Recargar si cambió de usuario de alguna manera extraña localmente, aunque es poco probable
                              }
                            } else {
                              setStateDialog(() {
                                _isLoading = false;
                                _errorMessage = 'El nombre de usuario ya existe o hubo un error al actualizar.';
                              });
                            }
                          }
                        },
                  child: _isLoading 
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                      : const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onBackground;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Perfil', style: GoogleFonts.montserrat(color: textColor, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0, bottom: 120.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Perfil de usuario
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
                        child: Text(
                          _currentUsername.isNotEmpty ? _currentUsername[0].toUpperCase() : 'U',
                          style: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.bold, color: theme.colorScheme.primary)
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: theme.scaffoldBackgroundColor, width: 3),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit, size: 20, color: Colors.white),
                          onPressed: () => _showEditProfileDialog(context),
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(_currentUsername,
                    style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Cerrar sesión', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                          content: const Text('¿Seguro que quieres cerrar sesión?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancelar')),
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(true),
                              child: Text('Sí, salir', style: TextStyle(color: theme.colorScheme.error)),
                            ),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        widget.onLogout();
                      }
                    },
                    icon: const Icon(Icons.logout, size: 18),
                    label: const Text('Cerrar sesión'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                      side: BorderSide(color: theme.colorScheme.error.withOpacity(0.5)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Sección de estadísticas
            Text('Estadísticas', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildStatCard(context, Icons.local_fire_department, 'Días de racha', '$_streakDays', Colors.orange)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard(context, Icons.timer, 'Tiempo en la app', _formatAppTime(_appTimeMinutes), Colors.green)),
              ],
            ),
            const SizedBox(height: 16),
            _buildStatCard(context, Icons.collections_bookmark, 'Favs., Notas y Subrayados', '${_favoriteVerses.length + _highlightedVerses.length + _notedVerses.length}', Colors.blue, fullWidth: true),

            const SizedBox(height: 32),

            // Mis Versículos
            Text('Mis Versículos', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Theme(
                    data: theme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: const Icon(Icons.favorite, color: Colors.redAccent),
                      title: Text('Favoritos (${_favoriteVerses.length})', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
                      children: _favoriteVerses.map((v) => _buildVerseListTile(v, null, null)).toList(),
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  Theme(
                    data: theme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: Icon(Icons.border_color, color: theme.colorScheme.primary),
                      title: Text('Subrayados (${_highlightedVerses.length})', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
                      children: _highlightedVerses.entries.map((e) => _buildVerseListTile(e.key, e.value, null)).toList(),
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  Theme(
                    data: theme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: const Icon(Icons.sticky_note_2, color: Colors.orange),
                      title: Text('Mis Notas (${_notedVerses.length})', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
                      children: _notedVerses.entries.map((e) => _buildVerseListTile(e.key, null, e.value)).toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            
            // Apariencia
            Text('Apariencia', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: const Text('Claro'),
                    value: ThemeMode.light,
                    groupValue: widget.themeMode,
                    onChanged: widget.onThemeModeChanged,
                    secondary: const Icon(Icons.light_mode_outlined),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  RadioListTile<ThemeMode>(
                    title: const Text('Oscuro'),
                    value: ThemeMode.dark,
                    groupValue: widget.themeMode,
                    onChanged: widget.onThemeModeChanged,
                    secondary: const Icon(Icons.dark_mode_outlined),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  RadioListTile<ThemeMode>(
                    title: const Text('Automático (Sistema)'),
                    value: ThemeMode.system,
                    groupValue: widget.themeMode,
                    onChanged: widget.onThemeModeChanged,
                    secondary: const Icon(Icons.settings_system_daydream_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.bug_report, color: Colors.red),
              title: Text('Debug: Reiniciar Lecciones', style: GoogleFonts.montserrat(color: Colors.red, fontWeight: FontWeight.bold)),
              subtitle: Text('Restaura las vidas a 3 y el nivel a 1', style: GoogleFonts.montserrat(color: textColor.withOpacity(0.5))),
              onTap: () async {
                await PrefsHelper.debugResetLessonsProgress();
                if (context.mounted) {
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Progreso reiniciado correctamente', style: GoogleFonts.montserrat()),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, IconData icon, String title, String value, Color color, {bool fullWidth = false}) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: fullWidth 
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: color.withOpacity(0.2), shape: BoxShape.circle),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground)),
                    Text(title, style: TextStyle(color: theme.colorScheme.onBackground.withOpacity(0.7), fontSize: 14)),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(height: 12),
                Text(value, style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground)),
                const SizedBox(height: 4),
                Text(title, style: TextStyle(color: theme.colorScheme.onBackground.withOpacity(0.7), fontSize: 14)),
              ],
            ),
      ),
    );
  }

  Widget _buildVerseListTile(Verse verse, int? highlightColorValue, String? note) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      title: Text(
        '${verse.bookName} ${verse.chapter}:${verse.verse}',
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            verse.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.merriweather(
              fontStyle: FontStyle.italic,
              color: highlightColorValue != null ? Color(highlightColorValue) : theme.colorScheme.onBackground.withOpacity(0.8),
            ),
          ),
          if (note != null && note.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.format_quote, size: 16, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      note,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(fontSize: 12, color: theme.colorScheme.onBackground.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
            )
          ]
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _navigateToVerse(verse),
    );
  }
}
