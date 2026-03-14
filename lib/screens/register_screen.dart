import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class RegisterScreen extends StatefulWidget {
    final void Function(String username)? onRegisterSuccess;
    RegisterScreen({Key? key, this.onRegisterSuccess}) : super(key: key);

    @override
    State<RegisterScreen> createState() => _RegisterScreenState();
  }


class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;
  String? _success;

  Future<void> _register() async {
    setState(() { _isLoading = true; _error = null; _success = null; });
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      setState(() { _error = 'Completa todos los campos.'; _isLoading = false; });
      return;
    }
    final ok = await DatabaseHelper.registerUser(username, password);
    if (ok) {
      // Guardar sesión y llamar callback
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('session_user', username);
      if (widget.onRegisterSuccess != null) {
        widget.onRegisterSuccess!(username);
      } else {
        setState(() { _success = '¡Usuario registrado!'; _isLoading = false; });
      }
    } else {
      setState(() { _error = 'El usuario ya existe.'; _isLoading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onBackground;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_add, size: 64, color: theme.colorScheme.primary),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Nombre de usuario'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  if (_error != null)
                    Text(_error!, style: const TextStyle(color: Colors.red)),
                  if (_success != null)
                    Text(_success!, style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _register,
                      child: _isLoading
                          ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
