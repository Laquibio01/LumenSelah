import 'package:flutter/material.dart';
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
  const MainNavigation({super.key, required this.themeMode, required this.onThemeModeChanged, required this.onLogout, required this.sessionUser});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  bool _isBottomBarVisible = true;
  late final PageController _pageController = PageController(initialPage: _selectedIndex);
  final GlobalKey<HomeScreenState> _homeKey = GlobalKey<HomeScreenState>();
  final GlobalKey<LessonsTabScreenState> _lessonsKey = GlobalKey<LessonsTabScreenState>();
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
    _pageController.dispose();
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
    _KeepAlivePage(
      child: HomeScreen(
        key: _homeKey,
        onStartLesson: () {
          _onItemTapped(2);
          Future.delayed(const Duration(milliseconds: 400), () {
            _lessonsKey.currentState?.startCurrentLesson();
          });
        },
      ),
    ),
    _KeepAlivePage(
      child: BibleReaderScreen(
        onScrollVisibilityChanged: (isVisible) {
          if (_isBottomBarVisible != isVisible) {
            setState(() { _isBottomBarVisible = isVisible; });
          }
        },
      ),
    ),
    _KeepAlivePage(child: LessonsTabScreen(key: _lessonsKey)),
    _KeepAlivePage(
      key: _profileTabKey,
      child: ProfileScreen(
        themeMode: widget.themeMode,
        onThemeModeChanged: widget.onThemeModeChanged,
        onLogout: widget.onLogout,
        sessionUser: widget.sessionUser,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      if (index == 0) {
        _homeKey.currentState?.reloadData();
      } else if (index == 2) {
        _lessonsKey.currentState?.reloadProgress();
      } else if (index == 3) {
        _profileTabKey = UniqueKey();
      }
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.scaffoldBackgroundColor;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.themeMode == ThemeMode.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
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
                          ? Colors.white.withValues(alpha: 0.10)
                          : Colors.black.withValues(alpha: 0.08),
                      width: 1.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
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
                        _buildNavItem(icon: Icons.home_outlined, label: 'Inicio', index: 0),
                        _buildNavItem(icon: Icons.menu_book_outlined, label: 'Biblia', index: 1, isAccent: true),
                        _buildNavItem(icon: Icons.timeline, label: 'Lecciones', index: 2),
                        _buildNavItem(icon: Icons.person_outline, label: 'Tu', index: 3),
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

  Widget _buildNavItem({required IconData icon, required String label, required int index, bool isAccent = false}) {
    final bool isSelected = _selectedIndex == index;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textColor = colorScheme.onSurface;
    final accentColor = colorScheme.primary;
    
    final color = isSelected ? accentColor : textColor.withValues(alpha: 0.6);

    Widget iconWidget;
    if (isAccent && isSelected) {
      iconWidget = Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      );
    } else {
      iconWidget = Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: color, size: 26),
      );
    }

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _KeepAlivePage extends StatefulWidget {
  final Widget child;
  const _KeepAlivePage({required this.child, super.key});
  @override
  State<_KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<_KeepAlivePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

