import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';
import 'lesson_quiz_screen.dart';

class LessonsTabScreen extends StatefulWidget {
  const LessonsTabScreen({Key? key}) : super(key: key);

  @override
  State<LessonsTabScreen> createState() => _LessonsTabScreenState();
}

class _LessonsTabScreenState extends State<LessonsTabScreen> {
  int _globalLives = 3;
  int _unlockedLesson = 1;
  bool _isLoading = true;

  // Dificultades: 1-3 Sencilla, 4-6 Normal, 7-8 Difícil, 9-10 Teólogo
  final List<Map<String, dynamic>> _lessons = [
    {'id': 1, 'title': 'Génesis', 'difficulty': 'Sencilla', 'color': Colors.blue},
    {'id': 2, 'title': 'Éxodo', 'difficulty': 'Sencilla', 'color': Colors.blue},
    {'id': 3, 'title': 'Levítico', 'difficulty': 'Sencilla', 'color': Colors.blue},
    {'id': 4, 'title': 'Números', 'difficulty': 'Normal', 'color': Colors.green},
    {'id': 5, 'title': 'Deuteronomio', 'difficulty': 'Normal', 'color': Colors.green},
    {'id': 6, 'title': 'Josué', 'difficulty': 'Normal', 'color': Colors.green},
    {'id': 7, 'title': 'Jueces', 'difficulty': 'Difícil', 'color': Colors.orange},
    {'id': 8, 'title': 'Rut', 'difficulty': 'Difícil', 'color': Colors.orange},
    {'id': 9, 'title': 'Samuel I', 'difficulty': 'Teólogo', 'color': Colors.purple},
    {'id': 10, 'title': 'Samuel II', 'difficulty': 'Teólogo', 'color': Colors.purple},
  ];

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final lives = await PrefsHelper.getGlobalLives();
    final unlocked = await PrefsHelper.getUnlockedLesson();
    setState(() {
      _globalLives = lives;
      _unlockedLesson = unlocked;
      _isLoading = false;
    });
  }

  void _openQuiz(int lessonId, Color difficultyColor) async {
    if (_globalLives <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No tienes vidas (❤️). Espera a que se recarguen.', style: GoogleFonts.montserrat()),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final bool? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LessonQuizScreen(
          lessonId: lessonId,
          accentColor: difficultyColor,
        ),
      ),
    );

    // Al regresar del quiz recargamos progreso
    if (result != null) {
      _loadProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? theme.scaffoldBackgroundColor : const Color(0xFFFDFCF8), // Reflexivo solo en claro
      appBar: AppBar(
        title: Text(
          'Sabiduría Diaria',
          style: GoogleFonts.montserrat(
            color: isDarkMode ? Colors.white : const Color(0xFF2F4F4F),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.redAccent, size: 24),
                const SizedBox(width: 4),
                Text(
                  '$_globalLives',
                  style: GoogleFonts.montserrat(
                    color: isDarkMode ? Colors.white : const Color(0xFF2F4F4F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 24.0, bottom: 120.0), // Padding inferior extenso para la botonera flotante
        itemCount: _lessons.length,
        itemBuilder: (context, index) {
          final lesson = _lessons[index];
          final bool isUnlocked = lesson['id'] <= _unlockedLesson;
          final bool isCurrent = lesson['id'] == _unlockedLesson;
          
          return _buildLessonNode(lesson, isUnlocked, isCurrent, isDarkMode);
        },
      ),
    );
  }

  Widget _buildLessonNode(Map<String, dynamic> lesson, bool isUnlocked, bool isCurrent, bool isDark) {
    final Color nodeColor = isUnlocked ? lesson['color'] : (isDark ? Colors.grey[700]! : Colors.grey.withOpacity(0.3));
    final String title = lesson['title'];

    return GestureDetector(
      onTap: isUnlocked ? () => _openQuiz(lesson['id'], lesson['color']) : null,
      child: Column(
        children: [
          // Item de la lección
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isUnlocked ? nodeColor.withOpacity(0.15) : Colors.grey.withOpacity(0.1),
                  border: Border.all(
                    color: isCurrent ? nodeColor : Colors.transparent,
                    width: isCurrent ? 4 : 0,
                  ),
                  boxShadow: isCurrent ? [
                     BoxShadow(color: nodeColor.withOpacity(0.4), blurRadius: 10, spreadRadius: 2)
                  ] : [],
                ),
                child: Center(
                  child: Icon(
                    isUnlocked ? Icons.menu_book_rounded : Icons.lock_outline,
                    color: isUnlocked ? nodeColor : Colors.grey,
                    size: 40,
                  ),
                ),
              ),
              if (isCurrent)
                Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: nodeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'ACTUAL',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          
          // Título de la lección
          Text(
             "Nivel ${lesson['id']}: $title",
            style: GoogleFonts.montserrat(
              color: isDark ? Colors.white : const Color(0xFF2F4F4F),
              fontWeight: isUnlocked ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
          
          // Dificultad
          const SizedBox(height: 4),
          if (isUnlocked)
            Text(
              lesson['difficulty'],
              style: GoogleFonts.montserrat(
                color: nodeColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            
          // Conector (Excepto el último)
          if (lesson['id'] < 10)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 4,
              height: 40,
              color: isUnlocked && lesson['id'] < _unlockedLesson 
                  ? nodeColor.withOpacity(0.5) 
                  : Colors.grey.withOpacity(0.2),
            )
          else
             const SizedBox(height: 40),
        ],
      ),
    );
  }
}
