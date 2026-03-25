import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';

// === PANTALLA 2: SELECCIÓN DE CAPÍTULO ===
class BibleIndexChaptersScreen extends StatefulWidget {
  final int bookId;
  final String bookName;
  final Function(int bookId, int chapter, int verse) onVerseSelected;

  const BibleIndexChaptersScreen({
    super.key,
    required this.bookId,
    required this.bookName,
    required this.onVerseSelected,
  });

  @override
  State<BibleIndexChaptersScreen> createState() => _BibleIndexChaptersScreenState();
}

// === PANTALLA 1: SELECCIÓN DE LIBRO ===
class BibleIndexBooksScreen extends StatefulWidget {
  final List<Map<String, dynamic>> books;
  final Function(int bookId, int chapter, int verse) onVerseSelected;

  const BibleIndexBooksScreen({
    super.key,
    required this.books,
    required this.onVerseSelected,
  });

  @override
  State<BibleIndexBooksScreen> createState() => _BibleIndexBooksScreenState();
}

class _BibleIndexBooksScreenState extends State<BibleIndexBooksScreen> {
  // Los colores ahora se obtienen del tema

  @override
  Widget build(BuildContext context) {
    final oldTestament = widget.books.where((b) => b['testament_id'] == 1).toList();
    final newTestament = widget.books.where((b) => b['testament_id'] == 2).toList();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = colorScheme.onSurface;
    final greenAccent = colorScheme.secondary;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: BackButton(color: textColor),
          title: Text(
            'Libros de la Biblia',
            style: GoogleFonts.montserrat(color: textColor, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: greenAccent,
            unselectedLabelColor: textColor.withValues(alpha: 0.5),
            indicatorColor: greenAccent,
            tabs: const [
              Tab(text: 'Antiguo Test. (AT)'),
              Tab(text: 'Nuevo Test. (NT)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookList(oldTestament, textColor),
            _buildBookList(newTestament, textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(List<Map<String, dynamic>> bookList, Color textColor) {
    final theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: bookList.length,
      separatorBuilder: (context, index) => Divider(color: theme.dividerColor.withValues(alpha: 0.2), height: 1),
      itemBuilder: (context, index) {
        final book = bookList[index];
        return ListTile(
          title: Text(
            book['name'],
            style: GoogleFonts.montserrat(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: Icon(Icons.chevron_right, color: theme.iconTheme.color?.withValues(alpha: 0.7) ?? Colors.grey),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BibleIndexChaptersScreen(
                  bookId: book['id'],
                  bookName: book['name'],
                  onVerseSelected: widget.onVerseSelected,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// === PANTALLA 2: SELECCIÓN DE CAPÍTULO ===
class _BibleIndexChaptersScreenState extends State<BibleIndexChaptersScreen> {
  int _maxChapters = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadChapters();
  }

  Future<void> _loadChapters() async {
    final count = await DatabaseHelper.getMaxChapters(widget.bookId);
    setState(() {
      _maxChapters = count;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = colorScheme.onSurface;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: BackButton(color: textColor),
        title: Text(
          widget.bookName,
          style: GoogleFonts.montserrat(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: _maxChapters,
              itemBuilder: (context, index) {
                final chapter = index + 1;
                final theme = Theme.of(context);
                final colorScheme = theme.colorScheme;
                final textColor = colorScheme.onSurface;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BibleIndexVersesScreen(
                          bookId: widget.bookId,
                          bookName: widget.bookName,
                          chapter: chapter,
                          onVerseSelected: widget.onVerseSelected,
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark ? colorScheme.surface : Colors.white,
                      border: Border.all(color: theme.dividerColor.withValues(alpha: 0.3)),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '$chapter',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: textColor),
                    ),
                  ),
                );
              },
            ),
    );
  }
// (Bloque duplicado eliminado)
}

// === PANTALLA 3: SELECCIÓN DE VERSÍCULO ===
class BibleIndexVersesScreen extends StatefulWidget {
  final int bookId;
  final String bookName;
  final int chapter;
  final Function(int bookId, int chapter, int verse) onVerseSelected;

  const BibleIndexVersesScreen({
    super.key,
    required this.bookId,
    required this.bookName,
    required this.chapter,
    required this.onVerseSelected,
  });

  @override
  State<BibleIndexVersesScreen> createState() => _BibleIndexVersesScreenState();
}

class _BibleIndexVersesScreenState extends State<BibleIndexVersesScreen> {
  // Remove hardcoded colors, use theme instead
  
  int _maxVerses = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVerses();
  }

  Future<void> _loadVerses() async {
    // Solo obtenemos los versículos del capítulo para saber cuántos hay
    final verses = await DatabaseHelper.getChapter(widget.bookId, widget.chapter);
    setState(() {
      _maxVerses = verses.length;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final cardColor = theme.cardColor;
    final borderColor = theme.dividerColor.withValues(alpha: 0.3);
    final textColor = colorScheme.onSurface;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: BackButton(color: textColor),
        title: Text(
          '${widget.bookName} ${widget.chapter}',
          style: GoogleFonts.montserrat(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: _maxVerses,
              itemBuilder: (context, index) {
                final verse = index + 1;
                return InkWell(
                  onTap: () {
                    // Acción final: Notificamos a la ventana Lector
                    widget.onVerseSelected(widget.bookId, widget.chapter, verse);
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: cardColor,
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$verse',
                      style: GoogleFonts.montserrat(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
