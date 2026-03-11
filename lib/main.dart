import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'helpers/app_themes.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _showSplash = true;

  void _setThemeMode(ThemeMode? mode) {
    setState(() {
      _themeMode = mode ?? ThemeMode.system;
    });
  }

  void _finishSplash() {
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _themeMode,
      home: _showSplash
          ? SplashScreen(onFinish: _finishSplash)
          : MainNavigation(
              themeMode: _themeMode,
              onThemeModeChanged: _setThemeMode,
            ),
    );
  }
}
