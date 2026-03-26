import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';
import '../services/streak_service.dart';
import '../data/lessons_data.dart';
import '../helpers/audio_helper.dart';

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

  // Seguimiento de calificación y pistas
  int _score = 0;
  bool _failedCurrentQuestion = false;
  String? _currentHint;

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
      AudioHelper.playCorrect();

      if (!_failedCurrentQuestion) {
        _score++;
      }
      
      // Respuesta Correcta: esperar un poco y avanzar
      await Future.delayed(const Duration(milliseconds: 1000));
      if (!mounted) return;
      await _advanceQuestion();
    } else {
      AudioHelper.playIncorrect();

      // Respuesta Incorrecta
      setState(() {
        _localAttempts--;
        _failedCurrentQuestion = true;
        _currentHint = hint;
      });

      if (_localAttempts <= 0) {
        // Pierde la lección (esperamos 5s para que vea el color rojo y lea la pista)
        await Future.delayed(const Duration(milliseconds: 5000));
        if (mounted) await _handleLessonFailure();
      } else {
        // En lugar de permitir otro intento, mostramos la pista 5s y avanzamos a la siguiente
        await Future.delayed(const Duration(milliseconds: 5000));
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
        _failedCurrentQuestion = false;
        _currentHint = null;
        _currentQuestionIndex++;
      });
    } else {
      // Terminó la lección con éxito o habiendo completado todo
      await _handleLessonSuccess();
    }
  }

  Future<void> _handleLessonFailure() async {
    AudioHelper.playLessonFailed();

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
    AudioHelper.playLessonComplete();

    final int currentUnlocked = await PrefsHelper.getUnlockedLesson();
    
    // Desbloquear siguiente lógica (hasta lección 40 en base de datos)
    if (widget.lessonId == currentUnlocked && currentUnlocked < 40) {
      await PrefsHelper.saveUnlockedLesson(currentUnlocked + 1);
    }

    await StreakService().checkAndUpdateStreak();

    if (!mounted) return;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 80),
              const SizedBox(height: 16),
              Text(
                '¡Lección Completada!',
                style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: widget.accentColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _lessonData?.title ?? "",
                style: GoogleFonts.merriweather(fontSize: 18, color: isDark ? Colors.grey[300] : Colors.grey[700], fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: widget.accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: widget.accentColor.withValues(alpha: 0.3)),
                ),
                child: Column(
                  children: [
                    Text('Tu Calificación', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: widget.accentColor)),
                    const SizedBox(height: 8),
                    Text(
                      '$_score / $_totalQuestions',
                      style: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.bold, color: widget.accentColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: widget.accentColor,
                        side: BorderSide(color: widget.accentColor, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      icon: const Icon(Icons.refresh),
                      label: Text('Reintentar', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pop(context); // Cierra modal
                        setState(() {
                          _currentQuestionIndex = 0;
                          _localAttempts = 3;
                          _score = 0;
                          _isAnswered = false;
                          _selectedIdx = null;
                          _failedCurrentQuestion = false;
                          _currentHint = null;
                          _showReadingArea = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.accentColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.check),
                      label: Text('Continuar', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pop(context); // Cierra modal
                        Navigator.pop(context, true); // Cierra pantalla
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
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

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.05, 0), end: Offset.zero).animate(animation),
            child: child,
          ),
        );
      },
      child: _buildQuestionContent(bgColor, textColor, key: ValueKey<int>(_currentQuestionIndex)),
    );
  }

  Widget _buildQuestionContent(Color bgColor, Color textColor, {Key? key}) {
    final currentQ = _lessonData!.questions[_currentQuestionIndex];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      key: key,
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
          
          if (_currentHint != null)
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb_outline, color: Colors.orange, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Pista: $_currentHint',
                        style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.italic,
                          color: isDark ? Colors.orange[200] : Colors.brown[800],
                          height: 1.4,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
