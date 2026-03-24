import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import '../helpers/streak_helper.dart';
import 'bible_index_screen.dart';
import 'bible_search_screen.dart';

class BibleReaderScreen extends StatefulWidget {
  final Function(bool isVisible)? onScrollVisibilityChanged;
  final int? initialScrollToVerse;

  const BibleReaderScreen({Key? key, this.onScrollVisibilityChanged, this.initialScrollToVerse}) : super(key: key);

  @override
  State<BibleReaderScreen> createState() => _BibleReaderScreenState();
}

class _BibleReaderScreenState extends State<BibleReaderScreen> {
  // Los colores ahora se obtienen del tema

  int _currentBookId = 1;
  int _currentChapter = 1;
  int _maxChapters = 1;
  String _currentBookName = 'Cargando...';
  
  bool _isLoading = true;
  bool _isBottomBarVisible = true;

  List<Verse> _verses = [];
  int? _highlightVerse;
  Map<String, int> _highlightedVerses = {};
  List<String> _favoriteVerses = [];
  Map<String, String> _verseNotes = {};
  List<GlobalKey> _verseKeys = [];
  
  double _fontSize = 18.0;
  double _lineHeight = 1.6;
  
  String _searchQuery = ''; // Usada solo para mantener resaltada la palabra tras venir de la búsqueda global
  
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _allBooks = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialScrollToVerse != null) {
      _highlightVerse = widget.initialScrollToVerse;
    }
    _loadInitialData();
    
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isBottomBarVisible) {
          setState(() { _isBottomBarVisible = false; });
          widget.onScrollVisibilityChanged?.call(false);
        }
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isBottomBarVisible) {
          setState(() { _isBottomBarVisible = true; });
          widget.onScrollVisibilityChanged?.call(true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    final pos = await PrefsHelper.getLastBiblePosition();
    _allBooks = await DatabaseHelper.getBooks();
    final hVerses = await PrefsHelper.getHighlightedVerses();
    final fVerses = await PrefsHelper.getFavoriteVerses();
    final vNotes = await PrefsHelper.getVerseNotes();
    final savedFontSize = await PrefsHelper.getReaderFontSize();
    final savedLineHeight = await PrefsHelper.getReaderLineHeight();
    
    setState(() {
      _currentBookId = pos['bookId']!;
      _currentChapter = pos['chapter']!;
      _highlightedVerses = hVerses;
      _favoriteVerses = fVerses;
      _verseNotes = vNotes;
      _fontSize = savedFontSize;
      _lineHeight = savedLineHeight;
    });
    
    await _loadChapterData();
  }

  Future<void> _loadChapterData() async {
    setState(() { _isLoading = true; });
    
    _maxChapters = await DatabaseHelper.getMaxChapters(_currentBookId);
    
    final book = _allBooks.firstWhere((b) => b['id'] == _currentBookId, orElse: () => {'name': 'Genesis'});
    _currentBookName = book['name'];

    final verses = await DatabaseHelper.getChapter(_currentBookId, _currentChapter);

    // Guardar dónde nos quedamos
    await PrefsHelper.saveLastBiblePosition(_currentBookId, _currentChapter);

    setState(() { 
      _verses = verses;
      _verseKeys = List.generate(verses.length, (index) => GlobalKey());
      _isLoading = false; 
    });

    // Validar auto-scroll si venimos de la pantalla de Índice
    _scrollToHighlight();
  }

  void _scrollToHighlight() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      if (_highlightVerse != null && _verseKeys.isNotEmpty) {
        final verseIndex = _verses.indexWhere((v) => v.verse == _highlightVerse);
        if (verseIndex >= 0 && verseIndex < _verseKeys.length && _verseKeys[verseIndex].currentContext != null) {
          Scrollable.ensureVisible(
            _verseKeys[verseIndex].currentContext!,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
          
          // Esperar a que termine el scroll fluido (600ms) + darle un poco de tiempo para que el usuario note el color
          Future.delayed(const Duration(milliseconds: 1200), () {
            if (mounted) {
              setState(() { _highlightVerse = null; });
            }
          });
        }
      }
    });
  }

  void _openBibleIndex() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BibleIndexBooksScreen(
          books: _allBooks,
          onVerseSelected: (bookId, chapter, verse) {
            Navigator.popUntil(context, (route) => route.isFirst);
            
            // Si es el mismo libro y mismo capítulo solo iluminamos y scrolleamos, no re-cargamos la DB.
            if (bookId == _currentBookId && chapter == _currentChapter) {
              setState(() {
                _highlightVerse = verse; 
              });
              // Forzamos el post-frame que hace el scroll:
              _scrollToHighlight();
            } else {
              setState(() {
                _currentBookId = bookId;
                _currentChapter = chapter;
                _highlightVerse = verse; 
              });
              _loadChapterData();
            }
          },
        ),
      ),
    );
  }

  void _openBibleSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BibleSearchScreen(
          onVerseSelected: (bookId, chapter, verse) {
            Navigator.popUntil(context, (route) => route.isFirst);
            
            // Si es el mismo libro y mismo capítulo solo iluminamos y scrolleamos, no re-cargamos la DB.
            if (bookId == _currentBookId && chapter == _currentChapter) {
              setState(() {
                _highlightVerse = verse; 
              });
              // Forzamos el post-frame que hace el scroll:
              _scrollToHighlight();
            } else {
              setState(() {
                _currentBookId = bookId;
                _currentChapter = chapter;
                _highlightVerse = verse; 
              });
              _loadChapterData();
            }
          },
        ),
      ),
    );
  }

  void _navigateChapter(int direction) {
    if (direction < 0 && _currentChapter > 1) {
      setState(() { _currentChapter--; });
      _loadChapterData();
    } else if (direction > 0 && _currentChapter < _maxChapters) {
      setState(() { _currentChapter++; });
      _loadChapterData();
    }
  }

  void _showReadingSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final theme = Theme.of(context);
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ajustes de Lectura',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tamaño de letra', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
                      Text('${_fontSize.toInt()}', style: GoogleFonts.montserrat(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Slider(
                    value: _fontSize,
                    min: 12.0,
                    max: 32.0,
                    divisions: 20,
                    activeColor: theme.colorScheme.primary,
                    onChanged: (val) {
                      setModalState(() { _fontSize = val; });
                      setState(() { _fontSize = val; });
                      PrefsHelper.saveReaderFontSize(val);
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Espaciado', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
                      Text(_lineHeight.toStringAsFixed(1), style: GoogleFonts.montserrat(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Slider(
                    value: _lineHeight,
                    min: 1.0,
                    max: 3.0,
                    divisions: 20,
                    activeColor: theme.colorScheme.primary,
                    onChanged: (val) {
                      setModalState(() { _lineHeight = val; });
                      setState(() { _lineHeight = val; });
                      PrefsHelper.saveReaderLineHeight(val);
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        setModalState(() {
                          _fontSize = 18.0;
                          _lineHeight = 1.6;
                        });
                        setState(() {
                          _fontSize = 18.0;
                          _lineHeight = 1.6;
                        });
                        PrefsHelper.saveReaderFontSize(18.0);
                        PrefsHelper.saveReaderLineHeight(1.6);
                      },
                      icon: const Icon(Icons.restore),
                      label: Text('Valores por defecto', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showColorPicker(int verseNum) {
    final colors = [
      {'color': const Color(0xFFFFF59D), 'name': 'Amarillo'},
      {'color': const Color(0xFFA5D6A7), 'name': 'Verde'},
      {'color': const Color(0xFF90CAF9), 'name': 'Azul'},
      {'color': const Color(0xFFF48FB1), 'name': 'Rosa'},
      {'color': const Color(0xFFCE93D8), 'name': 'Morado'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final theme = Theme.of(context);
        final key = '${_currentBookId}_${_currentChapter}_$verseNum';
        final isFav = _favoriteVerses.contains(key);
        final hasNote = _verseNotes.containsKey(key);

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Versículo $verseNum',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: colors.map((c) {
                  final color = c['color'] as Color;
                  return GestureDetector(
                    onTap: () {
                      _setHighlight(verseNum, color.value);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12, width: 2),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _toggleFavorite(verseNum),
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.redAccent : Colors.grey,
                          size: 32,
                        ),
                      ),
                      Text("Favorito", style: GoogleFonts.montserrat(fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _showNoteDialog(verseNum),
                        icon: Icon(
                          hasNote ? Icons.sticky_note_2 : Icons.note_add_outlined,
                          color: hasNote ? Colors.amber : Colors.grey,
                          size: 32,
                        ),
                      ),
                      Text("Nota", style: GoogleFonts.montserrat(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              TextButton.icon(
                onPressed: () {
                  _setHighlight(verseNum, null);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.format_color_reset, color: Colors.grey),
                label: Text(
                  'Quitar subrayado',
                  style: GoogleFonts.montserrat(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleFavorite(int verseNum) {
    final key = '${_currentBookId}_${_currentChapter}_$verseNum';
    setState(() {
      if (_favoriteVerses.contains(key)) {
        _favoriteVerses.remove(key);
      } else {
        _favoriteVerses.add(key);
      }
    });
    PrefsHelper.saveFavoriteVerses(_favoriteVerses);
    Navigator.pop(context);
  }

  void _showNoteDialog(int verseNum) {
    Navigator.pop(context); // Cerrar el modal bottom sheet primero
    final key = '${_currentBookId}_${_currentChapter}_$verseNum';
    final existingNote = _verseNotes[key] ?? '';
    final TextEditingController controller = TextEditingController(text: existingNote);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Nota - Versículo $verseNum', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
          content: TextField(
            controller: controller,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Escribe tu reflexión o nota aquí...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          actions: [
            if (existingNote.isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    _verseNotes.remove(key);
                  });
                  PrefsHelper.saveVerseNotes(_verseNotes);
                  Navigator.pop(context);
                },
                child: Text('Borrar', style: GoogleFonts.montserrat(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar', style: GoogleFonts.montserrat(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (controller.text.trim().isEmpty) {
                    _verseNotes.remove(key);
                  } else {
                    _verseNotes[key] = controller.text.trim();
                  }
                });
                PrefsHelper.saveVerseNotes(_verseNotes);
                Navigator.pop(context);
              },
              child: Text('Guardar', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _setHighlight(int verseNum, int? colorValue) {
    final key = '${_currentBookId}_${_currentChapter}_$verseNum';
    setState(() {
      if (colorValue == null) {
        _highlightedVerses.remove(key);
      } else {
        _highlightedVerses[key] = colorValue;
      }
    });
    PrefsHelper.saveHighlightedVerses(_highlightedVerses);
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = colorScheme.onBackground;
    final accentColor = colorScheme.primary;
    final secondaryColor = colorScheme.secondary;
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          _buildReaderBody(textColor, accentColor),
          
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      color: textColor.withOpacity(0.7),
                      onPressed: _openBibleSearch,
                    ),
                    IconButton(
                      icon: const Icon(Icons.text_format),
                      color: textColor.withOpacity(0.7),
                      onPressed: _showReadingSettings,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Barra de navegación estilo píldora que toma el lugar de la principal
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isBottomBarVisible ? 100 : 32, // Si es visible global, va arriba. Si no, baja al fondo.
            left: 20,
            right: 20,
            child: _buildChapterNavigation(textColor, accentColor, secondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildReaderBody(Color textColor, Color accentColor) {
    if (_isLoading || _verses.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0, bottom: 150.0), // Padding inferior extenso y top margin extra
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                '$_currentBookName $_currentChapter',
                style: GoogleFonts.montserrat(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            ..._verses.asMap().entries.map((entry) {
              final index = entry.key;
              final v = entry.value;
              final bool isTemporaryHighlighted = _highlightVerse == v.verse;
              
              final String hKey = '${_currentBookId}_${_currentChapter}_${v.verse}';
              final bool isPermanentlyHighlighted = _highlightedVerses.containsKey(hKey);
              final double opacity = Theme.of(context).brightness == Brightness.dark ? 0.35 : 0.6;
              final Color permanentColor = isPermanentlyHighlighted 
                  ? Color(_highlightedVerses[hKey]!).withOpacity(opacity) 
                  : Colors.transparent;

              final bool isFavorite = _favoriteVerses.contains(hKey);
              final bool hasNote = _verseNotes.containsKey(hKey);

              return GestureDetector(
                onTap: () => _showColorPicker(v.verse),
                child: TweenAnimationBuilder<Color?>(
                  key: _verseKeys[index], // Key para auto-scroll
                  duration: const Duration(seconds: 3), // Fade out duration más largo y notorio
                  curve: Curves.easeOut,
                  tween: ColorTween(
                    begin: isTemporaryHighlighted ? accentColor.withOpacity(0.5) : permanentColor,
                    end: permanentColor,
                  ),
                  builder: (context, color, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 14.0),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: child, // El texto renderizado que se pasa abajo
                    );
                  },
                  child: _buildParagraph('${v.verse} ${v.text}', textColor, isFavorite: isFavorite, hasNote: hasNote, searchQuery: _searchQuery),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterNavigation(Color textColor, Color accentColor, Color secondaryColor) {
    final theme = Theme.of(context);
    return Material(
      color: theme.brightness == Brightness.dark ? const Color(0xFF23262E) : Colors.white,
      borderRadius: BorderRadius.circular(28),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.3),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28), // Bordes súper redondeados
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _currentChapter > 1 ? () => _navigateChapter(-1) : null,
                icon: const Icon(Icons.chevron_left, size: 28),
                color: _currentChapter > 1 ? secondaryColor : Colors.grey.withOpacity(0.3),
              ),
              Expanded(
                child: InkWell(
                  onTap: _openBibleIndex,
                  borderRadius: BorderRadius.circular(16),
                  highlightColor: accentColor.withOpacity(0.1),
                  splashColor: accentColor.withOpacity(0.2),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '${_currentBookName.toUpperCase()} $_currentChapter',
                        style: GoogleFonts.montserrat(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _currentChapter < _maxChapters ? () => _navigateChapter(1) : null,
                icon: const Icon(Icons.chevron_right, size: 28),
                color: _currentChapter < _maxChapters ? secondaryColor : Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text, Color textColor, {bool isFavorite = false, bool hasNote = false, String searchQuery = ''}) {
    // Limpieza agresiva de saltos de línea provenientes de la base de datos (Ej: Versículo 31 de Génesis 1)
    String cleanText = text.replaceAll(RegExp(r'[\r\n]+'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();

    // Implementación para destacar el número del versículo inline (el primer carácter numérico)
    final match = RegExp(r'^(\d+)\s+(.*)$').firstMatch(cleanText);

    List<InlineSpan> getBadges() {
      List<InlineSpan> badges = [];
      if (isFavorite) {
        badges.add(const WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 2.0),
            child: Icon(Icons.favorite, color: Colors.redAccent, size: 16),
          ),
        ));
      }
      if (hasNote) {
        badges.add(const WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 2.0),
            child: Icon(Icons.sticky_note_2, color: Colors.amber, size: 16),
          ),
        ));
      }
      return badges;
    }

    List<InlineSpan> _highlightKeyword(String rawText, String keyword, Color textColor) {
      if (keyword.isEmpty) {
        return [
          TextSpan(
            text: rawText,
            style: GoogleFonts.merriweather(
              fontSize: _fontSize,
              color: textColor,
              height: _lineHeight,
              letterSpacing: 0.2,
            ),
          )
        ];
      }

      final String lowercaseText = rawText.toLowerCase();
      final String lowercaseQuery = keyword.toLowerCase();
      List<InlineSpan> spans = [];
      int start = 0;

      while (true) {
        final int index = lowercaseText.indexOf(lowercaseQuery, start);
        if (index == -1) {
          spans.add(TextSpan(
            text: rawText.substring(start),
            style: GoogleFonts.merriweather(
              fontSize: _fontSize,
              color: textColor,
              height: _lineHeight,
              letterSpacing: 0.2,
            ),
          ));
          break;
        }

        if (index > start) {
          spans.add(TextSpan(
            text: rawText.substring(start, index),
            style: GoogleFonts.merriweather(
              fontSize: _fontSize,
              color: textColor,
              height: _lineHeight,
              letterSpacing: 0.2,
            ),
          ));
        }

        spans.add(TextSpan(
          text: rawText.substring(index, index + keyword.length),
          style: GoogleFonts.merriweather(
            fontSize: _fontSize,
            color: Colors.black87, 
            backgroundColor: Colors.yellowAccent.withOpacity(0.8), 
            fontWeight: FontWeight.bold,
            height: _lineHeight,
            letterSpacing: 0.2,
          ),
        ));

        start = index + keyword.length;
      }
      return spans;
    }

    if (match != null) {
      final number = match.group(1)!;
      final rest = match.group(2)!;

      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number + ' ',
              style: GoogleFonts.montserrat(
                fontSize: _fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
                height: _lineHeight,
              ),
            ),
            ..._highlightKeyword(rest, searchQuery, textColor),
            ...getBadges(),
          ],
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: [
          ..._highlightKeyword(cleanText, searchQuery, textColor),
          ...getBadges(),
        ]
      )
    );
  }
}
