import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BibleIndexModal extends StatelessWidget {
  final List<Map<String, dynamic>> books;
  final Function(int bookId) onBookSelected;

  const BibleIndexModal({
    super.key,
    required this.books,
    required this.onBookSelected,
  });

  // Los colores ahora se obtienen del tema

  @override
  Widget build(BuildContext context) {
    // Dividir en Antiguo (1-39) y Nuevo Testamento (40-66)
    final oldTestament = books.where((b) => b['testament_id'] == 1).toList();
    final newTestament = books.where((b) => b['testament_id'] == 2).toList();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = colorScheme.onSurface;
    final greenAccent = colorScheme.secondary;
    return DefaultTabController(
      length: 2,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.dividerColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Libros de la Biblia',
              style: GoogleFonts.montserrat(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TabBar(
              labelColor: greenAccent,
              unselectedLabelColor: textColor.withValues(alpha: 0.5),
              indicatorColor: greenAccent,
              tabs: const [
                Tab(text: 'Antiguo Testamento'),
                Tab(text: 'Nuevo Testamento'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildBookList(oldTestament, context, textColor),
                  _buildBookList(newTestament, context, textColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(List<Map<String, dynamic>> bookList, BuildContext context, Color textColor) {
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
            style: GoogleFonts.montserrat(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            onBookSelected(book['id']);
            Navigator.pop(context); // Cerrar el modal
          },
        );
      },
    );
  }
}
