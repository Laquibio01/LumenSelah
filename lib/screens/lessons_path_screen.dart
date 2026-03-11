import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonsPathScreen extends StatelessWidget {
  const LessonsPathScreen({Key? key}) : super(key: key);

  static const Color bgColor = Color(0xFFF9F6EE); 
  static const Color textColor = Color(0xFF2E2E2E); 
  static const Color orangeAccent = Color(0xFFECA646); 
  static const Color greenAccent = Color(0xFF8CC193); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Ruta de Aprendizaje',
          style: GoogleFonts.montserrat(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.route, size: 80, color: greenAccent.withOpacity(0.5)),
              const SizedBox(height: 24),
              Text(
                'Aquí se diseñará el camino completo de lecciones',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Al completar una lección de este camino principal, la racha diaria en el inicio aumentará automáticamente.',
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  color: textColor.withOpacity(0.7),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
