import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import '../helpers/streak_helper.dart';
import 'bible_index_screen.dart';

class BibleReaderScreen extends StatefulWidget {
  final Function(bool isVisible)? onScrollVisibilityChanged;

  const BibleReaderScreen({Key? key, this.onScrollVisibilityChanged}) : super(key: key);

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
  List<GlobalKey> _verseKeys = [];
  
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _allBooks = [];

  @override
  void initState() {
    super.initState();
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
    
    setState(() {
      _currentBookId = pos['bookId']!;
      _currentChapter = pos['chapter']!;
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
          
          // Desactivar el highlight tras un tiempo para que el TweenAnimation haga su fade-out natural
          Future.delayed(const Duration(milliseconds: 100), () {
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

  void _navigateChapter(int direction) {
    if (direction < 0 && _currentChapter > 1) {
      setState(() { _currentChapter--; });
      _loadChapterData();
    } else if (direction > 0 && _currentChapter < _maxChapters) {
      setState(() { _currentChapter++; });
      _loadChapterData();
    }
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
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 150.0), // Padding inferior extenso
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
              final bool isHighlighted = _highlightVerse == v.verse;

              return TweenAnimationBuilder<Color?>(
                key: _verseKeys[index], // Key para auto-scroll
                duration: const Duration(seconds: 2), // Fade out duration
                curve: Curves.easeOut,
                tween: ColorTween(
                  begin: isHighlighted ? accentColor.withOpacity(0.3) : Colors.transparent, // Color acento
                  end: Colors.transparent,
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
                child: _buildParagraph('${v.verse} ${v.text}', textColor),
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

  Widget _buildParagraph(String text, Color textColor) {
    // Limpieza agresiva de saltos de línea provenientes de la base de datos (Ej: Versículo 31 de Génesis 1)
    String cleanText = text.replaceAll(RegExp(r'[\r\n]+'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();

    // Implementación para destacar el número del versículo inline (el primer carácter numérico)
    final match = RegExp(r'^(\d+)\s+(.*)$').firstMatch(cleanText);

    if (match != null) {
      final number = match.group(1)!;
      final rest = match.group(2)!;

      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number + ' ',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
                height: 1.6,
              ),
            ),
            TextSpan(
              text: rest,
              style: GoogleFonts.merriweather(
                fontSize: 18,
                color: textColor,
                height: 1.6,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      cleanText,
      style: GoogleFonts.merriweather(
        fontSize: 18,
        color: textColor,
        height: 1.6,
        letterSpacing: 0.2,
      ),
    );
  }
}
