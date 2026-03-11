import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';
import 'bible_reader_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode?> onThemeModeChanged;
  const MainNavigation({Key? key, required this.themeMode, required this.onThemeModeChanged}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  bool _isBottomBarVisible = true;

  List<Widget> get _pages => [
    const HomeScreen(),
    BibleReaderScreen(
      onScrollVisibilityChanged: (isVisible) {
        if (_isBottomBarVisible != isVisible) {
          setState(() { _isBottomBarVisible = isVisible; });
        }
      },
    ),
    const SearchScreenPlaceholder(),
    ProfileScreen(
      themeMode: widget.themeMode,
      onThemeModeChanged: widget.onThemeModeChanged,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = colorScheme.onBackground;
    final accentColor = colorScheme.primary;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.themeMode == ThemeMode.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              bottom: _isBottomBarVisible ? 0 : -100,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? const Color(0xFF20232A)
                      : bgColor,
                  border: Border(
                    top: BorderSide(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.10)
                          : Colors.black.withOpacity(0.08),
                      width: 1.5,
                    ),
                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index, bool isAccent = false}) {
    final bool isSelected = _selectedIndex == index;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textColor = colorScheme.onBackground;
    final accentColor = colorScheme.primary;
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

// Pantalla Placeholder para Buscador
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
