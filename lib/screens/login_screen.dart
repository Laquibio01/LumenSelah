import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/database_helper.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  final void Function(String username) onLoginSuccess;
  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  
  bool _isUsernameFocused = false;
  bool _isPasswordFocused = false;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _usernameFocus.addListener(() => setState(() => _isUsernameFocused = _usernameFocus.hasFocus));
    _passwordFocus.addListener(() => setState(() => _isPasswordFocused = _passwordFocus.hasFocus));
  }
  
  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() { _isLoading = true; _error = null; });
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      setState(() { _error = 'Completa todos los campos.'; _isLoading = false; });
      return;
    }
    await DatabaseHelper.initUserTable();
    final db = await DatabaseHelper.getDatabase();
    final res = await db.query('users', where: 'username = ? AND password = ?', whereArgs: [username, password]);
    if (res.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('session_user', username);
      widget.onLoginSuccess(username);
    } else {
      setState(() { _error = 'Usuario o contraseña incorrectos.'; _isLoading = false; });
    }
  }

  void _goToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => RegisterScreen(
          onRegisterSuccess: (username) {
            widget.onLoginSuccess(username);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget _buildGlassTextField({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isFocused,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final fieldGlassColor = isDark ? Colors.black.withValues(alpha: 0.25) : Colors.white.withValues(alpha: 0.4);
    final fieldBorderColor = isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05);
    final focusColor = theme.colorScheme.primary;
    final textColor = theme.textTheme.bodyLarge?.color ?? (isDark ? Colors.white : Colors.black87);

    return Container(
      decoration: BoxDecoration(
        color: fieldGlassColor, // inset well
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFocused 
              ? focusColor.withValues(alpha: 0.5) // primary glow on focus
              : fieldBorderColor,
          width: 1.5,
        ),
        boxShadow: [
          if (isFocused)
            BoxShadow(
              color: focusColor.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        style: TextStyle(color: textColor, fontSize: 16),
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: TextStyle(color: textColor.withValues(alpha: 0.5)),
          prefixIcon: Icon(icon, color: textColor.withValues(alpha: 0.5)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bgColor1 = theme.scaffoldBackgroundColor;
    final bgColor2 = isDark ? const Color(0xFF1E232B) : const Color(0xFFEBE7DB);
    
    final streakColor1 = theme.colorScheme.primary.withValues(alpha: 0.15); // primary streaks
    final streakColor2 = theme.colorScheme.secondary.withValues(alpha: 0.2); // secondary streaks

    final glassColor = isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white.withValues(alpha: 0.5);
    final glassBorder = isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white.withValues(alpha: 0.6);
    final glassShadow = isDark ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.05);

    final iconBgColor = isDark ? Colors.black.withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.4);
    final iconBorder = isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white;
    final iconColor = theme.colorScheme.primary;

    final titleColor = theme.textTheme.bodyLarge?.color ?? (isDark ? Colors.white : Colors.black87);
    final subtitleColor = titleColor.withValues(alpha: 0.6);

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Gradient 
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [bgColor1, bgColor2],
              ),
            ),
          ),
          
          // 2. Soft, diffuse light streaks via blurred circles using theme colors
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: streakColor1,
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: streakColor2,
              ),
            ),
          ),
          
          Positioned.fill(
             child: BackdropFilter(
               filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
               child: Container(color: Colors.transparent),
             ),
          ),

          // 3. Main Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Glassmorphism Modal
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(32.0),
                          decoration: BoxDecoration(
                            color: glassColor, // frosted glass
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: glassBorder,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: glassShadow,
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Top Lock Icon 
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: iconBgColor,
                                  border: Border.all(color: iconBorder),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      isDark ? Colors.white.withValues(alpha: 0.08) : Colors.white.withValues(alpha: 0.8),
                                      Colors.transparent,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isDark ? Colors.black.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 10,
                                      offset: const Offset(4, 4),
                                    ),
                                    BoxShadow(
                                      color: isDark ? Colors.white.withValues(alpha: 0.03) : Colors.white,
                                      blurRadius: 10,
                                      offset: const Offset(-2, -2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.lock_rounded,
                                  size: 48,
                                  color: iconColor, // theme primary
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Titles
                              Text(
                                'Bienvenido',
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: titleColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Inicia sesión para continuar',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: subtitleColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 36),
                              
                              // Inputs
                              _buildGlassTextField(
                                context: context,
                                controller: _usernameController,
                                focusNode: _usernameFocus,
                                isFocused: _isUsernameFocused,
                                labelText: 'Nombre de usuario',
                                icon: Icons.person_outline_rounded,
                              ),
                              const SizedBox(height: 20),
                              _buildGlassTextField(
                                context: context,
                                controller: _passwordController,
                                focusNode: _passwordFocus,
                                isFocused: _isPasswordFocused,
                                labelText: 'Contraseña',
                                icon: Icons.lock_outline_rounded,
                                obscureText: true,
                              ),
                              
                              if (_error != null) ...[
                                const SizedBox(height: 16),
                                Text(
                                  _error!,
                                  style: TextStyle(
                                    color: theme.colorScheme.error,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                              
                              const SizedBox(height: 36),
                              
                              // 'Entrar' Button
                              Container(
                                width: double.infinity,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: theme.colorScheme.primary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.colorScheme.primary.withValues(alpha: 0.4),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withValues(alpha: 0.4),
                                      blurRadius: 4,
                                      offset: const Offset(-1, -1),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : _login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                  ),
                                  child: _isLoading
                                      ? const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
                                          ),
                                        )
                                      : Text(
                                          'Entrar',
                                          style: GoogleFonts.inter(
                                            color: theme.colorScheme.onPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                ),
                              ),
                              
                              const SizedBox(height: 32),
                              
                              // Bottom link
                              TextButton(
                                onPressed: _goToRegister,
                                style: TextButton.styleFrom(
                                  foregroundColor: titleColor,
                                ),
                                child: Text(
                                  '¿No tienes cuenta? Regístrate',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
