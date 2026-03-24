import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../helpers/database_helper.dart';

import 'home_screen.dart';
import 'bible_reader_screen.dart';
import 'profile_screen.dart';
import 'lessons_tab_screen.dart';


class MainNavigation extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode?> onThemeModeChanged;
  final VoidCallback onLogout;
  final String? sessionUser;
  const MainNavigation({Key? key, required this.themeMode, required this.onThemeModeChanged, required this.onLogout, required this.sessionUser}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  bool _isBottomBarVisible = true;
  Key _lessonsTabKey = UniqueKey();
  Key _profileTabKey = UniqueKey();

  Timer? _appTimer;
  bool _isForeground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _appTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _isForeground = true;
      _startTimer();
    } else if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _isForeground = false;
      _appTimer?.cancel();
    }
  }

  void _startTimer() {
    _appTimer?.cancel();
    _appTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_isForeground && widget.sessionUser != null && widget.sessionUser != 'Usuario') {
        DatabaseHelper.incrementAppTime(widget.sessionUser!, 1);
      }
    });
  }

  List<Widget> get _pages => [
    const HomeScreen(),
    BibleReaderScreen(
      onScrollVisibilityChanged: (isVisible) {
        if (_isBottomBarVisible != isVisible) {
          setState(() { _isBottomBarVisible = isVisible; });
        }
      },
    ),
    LessonsTabScreen(key: _lessonsTabKey),
    ProfileScreen(
      key: _profileTabKey,
      themeMode: widget.themeMode,
      onThemeModeChanged: widget.onThemeModeChanged,
      onLogout: widget.onLogout,
      sessionUser: widget.sessionUser,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2 && _selectedIndex != 2) {
        // Regenerate key to force reload when switching to the lessons tab
        _lessonsTabKey = UniqueKey();
      } else if (index == 3 && _selectedIndex != 3) {
        // Regenerate key to force reload when switching to the profile tab
        _profileTabKey = UniqueKey();
      }
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
                        _buildNavItem(icon: Icons.timeline, index: 2),
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

