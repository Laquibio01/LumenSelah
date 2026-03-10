import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';
import 'bible_reader_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Colores principales de LumenSelah
  static const Color bgColor = Color(0xFFF9F6EE);
  static const Color textColor = Color(0xFF2E2E2E);
  static const Color accentColor = Color(0xFFECA646);

  // Las pantallas para cada pestaña
  final List<Widget> _pages = [
    const HomeScreen(),
    const BibleReaderScreen(),
    const SearchScreenPlaceholder(),
    const ProfileScreenPlaceholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -2),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.home_outlined, index: 0),
                _buildNavItem(icon: Icons.menu_book_outlined, index: 1, isAccent: true),
                _buildNavItem(icon: Icons.search, index: 2),
                _buildNavItem(icon: Icons.menu, index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index, bool isAccent = false}) {
    final bool isSelected = _selectedIndex == index;
    
    // Si es la pestaña actual y está marcada como 'accent' (como el libro en el mockup)
    // o simplemente para resaltar el ítem seleccionado.
    if (isAccent && isSelected) {
      return Container(
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: 26,
          onPressed: () => _onItemTapped(index),
        ),
      );
    }

    return IconButton(
      icon: Icon(icon),
      color: isSelected ? accentColor : textColor.withOpacity(0.6),
      iconSize: 28,
      onPressed: () => _onItemTapped(index),
    );
  }
}

// Pantallas Placeholder para Buscador y Perfil
class SearchScreenPlaceholder extends StatelessWidget {
  const SearchScreenPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Buscador',
        style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileScreenPlaceholder extends StatelessWidget {
  const ProfileScreenPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Perfil',
        style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
