import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';
import '../services/streak_service.dart';

class LessonQuizScreen extends StatefulWidget {
  final int lessonId;
  final Color accentColor;

  const LessonQuizScreen({
    Key? key,
    required this.lessonId,
    required this.accentColor,
  }) : super(key: key);

  @override
  State<LessonQuizScreen> createState() => _LessonQuizScreenState();
}

class _LessonQuizScreenState extends State<LessonQuizScreen> {
  final int _totalQuestions = 10;
  int _currentQuestionIndex = 0;
  int _localAttempts = 3;

  // Datos simulados del cuestionario (Placeholders)
  final List<Map<String, dynamic>> _questions = List.generate(10, (index) => {
    'question': 'Pregunta de prueba #${index + 1} para la lección',
    'options': ['Opción Correcta', 'Opción Incorrecta A', 'Opción Incorrecta B'],
    'correctIndex': 0, // Siempre la A por ahora para testing
  });

  @override
  void initState() {
    super.initState();
    // En un escenario real aquí mezclaríamos las opciones
  }

  void _handleAnswer(int selectedIndex, int correctIndex) async {
    if (selectedIndex == correctIndex) {
      // Respuesta Correcta
      if (_currentQuestionIndex < _totalQuestions - 1) {
        setState(() {
          _currentQuestionIndex++;
        });
      } else {
        // Terminó la lección con éxito!
        await _handleLessonSuccess();
      }
    } else {
      // Respuesta Incorrecta
      setState(() {
        _localAttempts--;
      });

      if (_localAttempts <= 0) {
        // Pierde la lección y resta una vida global
        await _handleLessonFailure();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Respuesta incorrecta. Te quedan $_localAttempts intentos (⚡).', style: GoogleFonts.montserrat()),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _handleLessonFailure() async {
    int currentLives = await PrefsHelper.getGlobalLives();
    if (currentLives > 0) {
      await PrefsHelper.saveGlobalLives(currentLives - 1);
    }
    
    if (!mounted) return;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('¡Oh no!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        content: Text('Te has quedado sin intentos en esta lección. Pierdes una vida (❤️).', style: GoogleFonts.montserrat()),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.accentColor,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Cierra diálogo
              Navigator.pop(context, true); // Cierra pantalla quiz indicando cambio
            },
            child: Text('Regresar al Mapa', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLessonSuccess() async {
    final int currentUnlocked = await PrefsHelper.getUnlockedLesson();
    
    // Si acaba de pasar la lección más alta que tenía, desbloquea la siguiente (max 10)
    if (widget.lessonId == currentUnlocked && currentUnlocked < 10) {
      await PrefsHelper.saveUnlockedLesson(currentUnlocked + 1);
    }

    // Actualiza la racha si es completada
    await StreakService().checkAndUpdateStreak();

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('¡Felicidades!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: widget.accentColor)),
        content: Text('Has completado la lección ${widget.lessonId} con éxito.', style: GoogleFonts.montserrat()),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.accentColor,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Cierra diálogo
              Navigator.pop(context, true); // Cierra pantalla
            },
            child: Text('Continuar', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress = (_currentQuestionIndex) / _totalQuestions;
    final currentQ = _questions[_currentQuestionIndex];
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color bgColor = isDark ? theme.scaffoldBackgroundColor : const Color(0xFFFDFCF8);
    final Color textColor = isDark ? Colors.white : const Color(0xFF2F4F4F);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: textColor),
          onPressed: () => Navigator.pop(context), 
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 12,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(widget.accentColor),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                const Icon(Icons.flash_on, color: Colors.orange, size: 24),
                Text(
                  '$_localAttempts',
                  style: GoogleFonts.montserrat(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                'Pregunta ${_currentQuestionIndex + 1} de $_totalQuestions',
                style: GoogleFonts.montserrat(
                  color: widget.accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                currentQ['question'],
                style: GoogleFonts.merriweather(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 48),
              
              ...List.generate(currentQ['options'].length, (index) {
                final String optionText = currentQ['options'][index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: textColor,
                      backgroundColor: isDark ? theme.cardColor : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
                      elevation: 2,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.5),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () => _handleAnswer(index, currentQ['correctIndex']),
                    child: Text(optionText),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
