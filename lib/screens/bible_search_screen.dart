import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import '../helpers/streak_helper.dart';

class BibleSearchScreen extends StatefulWidget {
  final Function(int bookId, int chapter, int verse) onVerseSelected;

  const BibleSearchScreen({super.key, required this.onVerseSelected});

  @override
  State<BibleSearchScreen> createState() => _BibleSearchScreenState();
}

class _BibleSearchScreenState extends State<BibleSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Verse> _results = [];
  bool _isSearching = false;

  double _fontSize = 18.0;
  double _lineHeight = 1.6;

  List<String> _favoriteVerses = [];
  Map<String, int> _highlightedVerses = {};

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final savedFontSize = await PrefsHelper.getReaderFontSize();
    final savedLineHeight = await PrefsHelper.getReaderLineHeight();
    final fVerses = await PrefsHelper.getFavoriteVerses();
    final hVerses = await PrefsHelper.getHighlightedVerses();
    setState(() {
      _fontSize = savedFontSize;
      _lineHeight = savedLineHeight;
      _favoriteVerses = fVerses;
      _highlightedVerses = hVerses;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _results = [];
        _searchQuery = '';
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _searchQuery = query;
    });

    final results = await DatabaseHelper.searchBible(query);

    // Ordenar resultados: dar prioridad a favoritos y subrayados
    results.sort((a, b) {
      final aKey = '${a.bookId}_${a.chapter}_${a.verse}';
      final bKey = '${b.bookId}_${b.chapter}_${b.verse}';
      
      final aHasPriority = _favoriteVerses.contains(aKey) || _highlightedVerses.containsKey(aKey);
      final bHasPriority = _favoriteVerses.contains(bKey) || _highlightedVerses.containsKey(bKey);
      
      if (aHasPriority && !bHasPriority) return -1;
      if (!aHasPriority && bHasPriority) return 1;
      
      // Si ambos tienen o no tienen prioridad, mantenemos el orden original ascendente (id de libro, capítulo, versículo)
      return 0;
    });

    setState(() {
      _results = results;
      _isSearching = false;
    });
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
          backgroundColor: Colors.yellowAccent.withValues(alpha: 0.8),
          fontWeight: FontWeight.bold,
          height: _lineHeight,
          letterSpacing: 0.2,
        ),
      ));

      start = index + keyword.length;
    }
    return spans;
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
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: 'Buscar en toda la Biblia...',
            hintStyle: TextStyle(color: textColor.withValues(alpha: 0.5)),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search, color: textColor),
              onPressed: _performSearch,
            ),
          ),
          onSubmitted: (_) => _performSearch(),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isSearching
          ? const Center(child: CircularProgressIndicator())
          : _results.isEmpty && _searchQuery.isNotEmpty
              ? Center(child: Text("No se encontraron resultados para '$_searchQuery'.", style: TextStyle(color: textColor)))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  itemCount: _results.length,
                  itemBuilder: (context, index) {
                    final verse = _results[index];
                    final String hKey = '${verse.bookId}_${verse.chapter}_${verse.verse}';
                    final bool isFavorite = _favoriteVerses.contains(hKey);
                    final bool isHighlighted = _highlightedVerses.containsKey(hKey);

                    return InkWell(
                      onTap: () {
                        widget.onVerseSelected(verse.bookId, verse.chapter, verse.verse);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: textColor.withValues(alpha: 0.1))),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${verse.bookName} ${verse.chapter}:${verse.verse}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                if (isFavorite || isHighlighted) ...[
                                  const SizedBox(width: 8),
                                  if (isFavorite)
                                    const Icon(Icons.favorite, color: Colors.redAccent, size: 14),
                                  if (isFavorite && isHighlighted)
                                    const SizedBox(width: 4),
                                  if (isHighlighted)
                                    Icon(Icons.brush, color: Color(_highlightedVerses[hKey]!), size: 14),
                                ],
                              ],
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                children: _highlightKeyword(verse.text, _searchQuery, textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
