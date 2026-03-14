import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'helpers/app_themes.dart';
import 'screens/main_navigation.dart';

import 'screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool _isLoggedIn = false;
  String? _sessionUser;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('session_user');
    setState(() {
      _isLoggedIn = user != null;
      _sessionUser = user;
    });
  }

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

  void _onLoginSuccess(String username) {
    setState(() {
      _sessionUser = username;
      _isLoggedIn = true;
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_user');
    setState(() {
      _isLoggedIn = false;
      _sessionUser = null;
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
          : (!_isLoggedIn
              ? LoginScreen(onLoginSuccess: _onLoginSuccess)
              : MainNavigation(
                  themeMode: _themeMode,
                  onThemeModeChanged: _setThemeMode,
                  onLogout: _logout,
                  sessionUser: _sessionUser,
                )
            ),
    );
  }
}
