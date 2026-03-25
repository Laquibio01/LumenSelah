import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';
import '../services/streak_service.dart';
import '../data/lessons_data.dart';

class LessonQuizScreen extends StatefulWidget {
  final int lessonId;
  final Color accentColor;

  const LessonQuizScreen({
    super.key,
    required this.lessonId,
    required this.accentColor,
  });

  @override
  State<LessonQuizScreen> createState() => _LessonQuizScreenState();
}

class _LessonQuizScreenState extends State<LessonQuizScreen> {
  int _currentQuestionIndex = 0;
  int _localAttempts = 3;
  bool _showReadingArea = true;
  LessonData? _lessonData;
  
  // State for answer highlighting
  bool _isAnswered = false;
  int? _selectedIdx;

  @override
  void initState() {
    super.initState();
    _lessonData = lessonsDatabase[widget.lessonId];
    if (_lessonData == null || _lessonData!.questions.isEmpty) {
      _showReadingArea = false;
    }
  }

  int get _totalQuestions => _lessonData?.questions.length ?? 10;

  Future<void> _handleAnswer(int selectedIndex, int correctIndex, String hint) async {
    if (_isAnswered) return; // Prevent multiple clicks
    
    setState(() {
      _isAnswered = true;
      _selectedIdx = selectedIndex;
    });

    if (selectedIndex == correctIndex) {
      // Respuesta Correcta: esperar un poco y avanzar
      await Future.delayed(const Duration(milliseconds: 1000));
      if (!mounted) return;
      await _advanceQuestion();
    } else {
      // Respuesta Incorrecta
      setState(() {
        _localAttempts--;
      });

      if (_localAttempts <= 0) {
        // Pierde la lección
        await _handleLessonFailure();
      } else {
        // Muestra la pista (hint)
        final isDark = Theme.of(context).brightness == Brightness.dark;
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            backgroundColor: isDark ? const Color(0xFF2C2C2C) : Colors.white,
            title: Row(
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                const SizedBox(width: 8),
                Text('Incorrecto', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Te quedan $_localAttempts intentos (⚡).', style: GoogleFonts.montserrat(color: isDark ? Colors.white : Colors.black87)),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb_outline, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Pista: $hint',
                          style: GoogleFonts.montserrat(
                            fontStyle: FontStyle.italic, 
                            color: isDark ? Colors.orange[200] : Colors.brown[800],
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Entendido', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: widget.accentColor)),
              ),
            ],
          ),
        );
        
        // Al cerrar el diálogo (con Entendido), avanzamos independientemente si fue fallida
        if (mounted) {
          await _advanceQuestion();
        }
      }
    }
  }
  
  Future<void> _advanceQuestion() async {
    if (_currentQuestionIndex < _totalQuestions - 1) {
      setState(() {
        _isAnswered = false;
        _selectedIdx = null;
        _currentQuestionIndex++;
      });
    } else {
      // Terminó la lección con éxito o habiendo completado todo
      await _handleLessonSuccess();
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
    
    if (widget.lessonId == currentUnlocked && currentUnlocked < 10) {
      await PrefsHelper.saveUnlockedLesson(currentUnlocked + 1);
    }

    await StreakService().checkAndUpdateStreak();

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            const Icon(Icons.menu_book, color: Colors.amber, size: 56),
            const SizedBox(height: 16),
            Text('¡Felicidades!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: widget.accentColor)),
          ],
        ),
        content: Text('Has completado la lección:\n"${_lessonData?.title ?? ''}"\ncon éxito.', style: GoogleFonts.montserrat(), textAlign: TextAlign.center),
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

  Widget _buildReadingArea(Color bgColor, Color textColor) {
    if (_lessonData == null) return const SizedBox.shrink();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _lessonData!.title,
                  style: GoogleFonts.merriweather(
                    color: widget.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Biblical Text Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: widget.accentColor.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.menu_book, color: widget.accentColor, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            _lessonData!.biblicalReference,
                            style: GoogleFonts.montserrat(
                              color: widget.accentColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _lessonData!.biblicalText,
                        style: GoogleFonts.merriweather(
                          color: textColor,
                          fontSize: 18,
                          height: 1.6,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Explanation Section
                Text(
                  'Explicación Breve',
                  style: GoogleFonts.montserrat(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _lessonData!.explanation,
                  style: GoogleFonts.montserrat(
                    color: textColor.withValues(alpha: 0.9),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Begin Quiz Button pinned to the bottom
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                offset: const Offset(0, -4),
                blurRadius: 10,
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.accentColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
            ),
            onPressed: () {
              setState(() {
                _showReadingArea = false;
              });
            },
            child: Text(
              'Comenzar Examen',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuizArea(Color bgColor, Color textColor) {
    if (_lessonData == null) {
      return Center(
        child: Text('No hay datos para esta lección.', style: GoogleFonts.montserrat(color: textColor)),
      );
    }

    final currentQ = _lessonData!.questions[_currentQuestionIndex];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
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
            currentQ.question,
            style: GoogleFonts.merriweather(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 48),
          
          ...List.generate(currentQ.options.length, (index) {
            final String optionText = currentQ.options[index];
            
            // Dynamic styling based on answer state
            Color optBgColor = isDark ? Theme.of(context).cardColor : Colors.white;
            Color optOutlineColor = Colors.grey.withValues(alpha: 0.2);
            Color optTextColor = textColor;
            double elevation = 2;
            
            if (_isAnswered) {
              if (index == _selectedIdx && index == currentQ.correctIndex) {
                // Correct selected answer is Green
                optBgColor = Colors.green;
                optOutlineColor = Colors.green;
                optTextColor = Colors.white;
                elevation = 4;
              } else if (index == _selectedIdx && index != currentQ.correctIndex) {
                // Wrong selected answer is Red
                optBgColor = Colors.redAccent;
                optOutlineColor = Colors.redAccent;
                optTextColor = Colors.white;
                elevation = 4;
              } else {
                // Other options greyed out slightly
                optTextColor = textColor.withValues(alpha: 0.5);
              }
            }

            final bool isSelected = _isAnswered && index == _selectedIdx;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AnimatedScale(
                scale: isSelected ? 1.02 : 1.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: optBgColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: optOutlineColor, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(0, 2),
                        blurRadius: elevation * 2,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => _handleAnswer(index, currentQ.correctIndex, currentQ.hint),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                optionText, 
                                style: GoogleFonts.montserrat(
                                  color: optTextColor,
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            if (isSelected && index == currentQ.correctIndex)
                              const Icon(Icons.check_circle, color: Colors.white),
                            if (isSelected && index != currentQ.correctIndex)
                              const Icon(Icons.cancel, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _showReadingArea 
        ? 0.0 
        : (_currentQuestionIndex) / _totalQuestions;
        
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
                  backgroundColor: Colors.grey.withValues(alpha: 0.2),
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
        child: _showReadingArea 
          ? _buildReadingArea(bgColor, textColor)
          : _buildQuizArea(bgColor, textColor),
      ),
    );
  }
}
