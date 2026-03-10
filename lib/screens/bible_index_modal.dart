import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BibleIndexModal extends StatelessWidget {
  final List<Map<String, dynamic>> books;
  final Function(int bookId) onBookSelected;

  const BibleIndexModal({
    Key? key,
    required this.books,
    required this.onBookSelected,
  }) : super(key: key);

  static const Color bgColor = Color(0xFFF9F6EE); 
  static const Color textColor = Color(0xFF2E2E2E);
  static const Color greenAccent = Color(0xFF8CC193);

  @override
  Widget build(BuildContext context) {
    // Dividir en Antiguo (1-39) y Nuevo Testamento (40-66)
    final oldTestament = books.where((b) => b['testament_id'] == 1).toList();
    final newTestament = books.where((b) => b['testament_id'] == 2).toList();

    return DefaultTabController(
      length: 2,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
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
              unselectedLabelColor: textColor.withOpacity(0.5),
              indicatorColor: greenAccent,
              tabs: const [
                Tab(text: 'Antiguo Testamento'),
                Tab(text: 'Nuevo Testamento'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildBookList(oldTestament, context),
                  _buildBookList(newTestament, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(List<Map<String, dynamic>> bookList, BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: bookList.length,
      separatorBuilder: (context, index) => Divider(color: Colors.grey.withOpacity(0.2), height: 1),
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
