import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';
import '../data/lessons_data.dart';
import 'lesson_quiz_screen.dart';

class LessonsTabScreen extends StatefulWidget {
  const LessonsTabScreen({super.key});

  @override
  State<LessonsTabScreen> createState() => _LessonsTabScreenState();
}

class _LessonsTabScreenState extends State<LessonsTabScreen> {
  int _globalLives = 5;
  int _unlockedLesson = 1;
  int _remainingSeconds = 0;
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadProgress();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadProgress() async {
    final res = await PrefsHelper.checkAndRegenLives();
    final unlocked = await PrefsHelper.getUnlockedLesson();
    if (!mounted) return;
    setState(() {
      _globalLives = res['lives'];
      _remainingSeconds = res['remainingSeconds'];
      _unlockedLesson = unlocked;
      _isLoading = false;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
        if (_remainingSeconds <= 0 && _globalLives < PrefsHelper.maxLives) {
          _loadProgress();
        }
      } else if (_globalLives < PrefsHelper.maxLives) {
          _loadProgress();
      }
    });
  }

  String get _formattedTimer {
    if (_remainingSeconds <= 0) return "";
    int m = _remainingSeconds ~/ 60;
    int s = _remainingSeconds % 60;
    return "(${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')})";
  }

  void _openQuiz(int lessonId, Color difficultyColor) async {
    if (_globalLives <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No tienes vidas (❤️). Espera $_formattedTimer o descansa.', style: GoogleFonts.montserrat()),
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

    if (result != null) {
      _loadProgress();
    }
  }

  int _getInitialTabIndex() {
    if (_unlockedLesson <= 10) return 0;
    if (_unlockedLesson <= 20) return 1;
    if (_unlockedLesson <= 30) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return DefaultTabController(
      length: 4,
      initialIndex: _getInitialTabIndex(),
      child: Scaffold(
        backgroundColor: isDarkMode ? theme.scaffoldBackgroundColor : const Color(0xFFFDFCF8), 
        appBar: AppBar(
          title: Text(
            'Sabiduría Diaria',
            style: GoogleFonts.montserrat(
              color: isDarkMode ? Colors.white : const Color(0xFF2F4F4F),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: isDarkMode ? theme.scaffoldBackgroundColor : const Color(0xFFFDFCF8),
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
                  if (_globalLives < PrefsHelper.maxLives && _remainingSeconds > 0) ...[
                    const SizedBox(width: 6),
                    Text(
                      _formattedTimer,
                      style: GoogleFonts.montserrat(
                        color: isDarkMode ? Colors.orange[200] : Colors.orange[800],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
                ],
              ),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            labelColor: isDarkMode ? Colors.white : const Color(0xFF2F4F4F),
            unselectedLabelColor: Colors.grey,
            indicatorColor: theme.colorScheme.primary,
            labelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
            unselectedLabelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
            tabs: const [
              Tab(text: 'Fácil'),
              Tab(text: 'Normal'),
              Tab(text: 'Difícil'),
              Tab(text: 'Teológico'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCategoryBody('Fácil', 1, 10, Colors.blue, isDarkMode),
            _buildCategoryBody('Normal', 11, 20, Colors.green, isDarkMode),
            _buildCategoryBody('Difícil', 21, 30, Colors.orange, isDarkMode),
            _buildCategoryBody('Teológico', 31, 40, Colors.purple, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBody(String categoryName, int startId, int endId, Color nodeColor, bool isDark) {
    if (_unlockedLesson < startId) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Colors.grey),
              const SizedBox(height: 24),
              Text(
                'Categoría $categoryName',
                style: GoogleFonts.montserrat(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF2F4F4F),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Sigue aprendiendo. Completa la lección ${startId - 1} para desbloquear esta sección.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.5,
                ),
              )
            ],
          ),
        ),
      );
    }

    final bool isCategoryCompleted = _unlockedLesson > endId;
    final int itemCount = (endId - startId) + 1 + (isCategoryCompleted ? 1 : 0);

    return ListView.builder(
      padding: const EdgeInsets.only(top: 24.0, bottom: 120.0),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (isCategoryCompleted && index == (endId - startId) + 1) {
          return Column(
            children: [
              const SizedBox(height: 16),
              const Icon(Icons.menu_book, color: Colors.amber, size: 64),
              const SizedBox(height: 8),
              Text(
                '¡Categoría Completada!',
                style: GoogleFonts.montserrat(
                  color: isDark ? Colors.amber[400] : Colors.amber[700],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
            ],
          );
        }

        final int lessonId = startId + index;
        final bool isUnlocked = lessonId <= _unlockedLesson;
        final bool isCurrent = lessonId == _unlockedLesson;
        final bool isLast = lessonId == endId && !isCategoryCompleted;

        return _buildLessonNode(lessonId, nodeColor, isUnlocked, isCurrent, isDark, isLast);
      },
    );
  }

  Widget _buildLessonNode(int lessonId, Color nodeColor, bool isUnlocked, bool isCurrent, bool isDark, bool isLast) {
    // Obtenemos el nombre real de la lección
    final String title = lessonsDatabase[lessonId]?.title ?? 'Lección $lessonId (Próximamente)';
    final Color currentColor = isUnlocked ? nodeColor : (isDark ? Colors.grey[700]! : Colors.grey.withValues(alpha: 0.3));

    return GestureDetector(
      onTap: isUnlocked ? () => _openQuiz(lessonId, nodeColor) : null,
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
                  color: isUnlocked ? currentColor.withValues(alpha: 0.15) : Colors.grey.withValues(alpha: 0.1),
                  border: Border.all(
                    color: isCurrent ? currentColor : Colors.transparent,
                    width: isCurrent ? 4 : 0,
                  ),
                  boxShadow: isCurrent ? [
                     BoxShadow(color: currentColor.withValues(alpha: 0.4), blurRadius: 10, spreadRadius: 2)
                  ] : [],
                ),
                child: Center(
                  child: Icon(
                    isUnlocked ? Icons.menu_book_rounded : Icons.lock_outline,
                    color: isUnlocked ? currentColor : Colors.grey,
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
                      color: currentColor,
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
          
          // Título de la lección real
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
            child: Text(
               title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: isDark ? Colors.white : const Color(0xFF2F4F4F),
                fontWeight: isUnlocked ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          
          // Conector (Excepto el último)
          if (!isLast)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 4,
              height: 40,
              color: isUnlocked && lessonId < _unlockedLesson 
                  ? currentColor.withValues(alpha: 0.5) 
                  : Colors.grey.withValues(alpha: 0.2),
            )
          else
             const SizedBox(height: 20),
        ],
      ),
    );
  }
}
