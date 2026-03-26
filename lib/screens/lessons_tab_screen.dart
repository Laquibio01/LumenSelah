import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/streak_helper.dart';
import '../data/lessons_data.dart';
import 'lesson_quiz_screen.dart';
import '../helpers/audio_helper.dart';

class LessonsTabScreen extends StatefulWidget {
  const LessonsTabScreen({super.key});

  @override
  State<LessonsTabScreen> createState() => LessonsTabScreenState();
}

class LessonsTabScreenState extends State<LessonsTabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _globalLives = 5;
  int _unlockedLesson = 1;
  int _remainingSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadProgress();
    _startTimer();
    _tabController = TabController(length: 4, vsync: this, initialIndex: _getInitialTabIndex());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> reloadProgress() async {
    await _loadProgress();
  }

  void startCurrentLesson() {
    final title = lessonsDatabase[_unlockedLesson]?.title ?? 'Lección $_unlockedLesson';
    _showLessonStartDialog(_unlockedLesson, _getCategoryColor(_unlockedLesson), title, false);
  }

  Color _getCategoryColor(int id) {
    if (id <= 10) {
      return Colors.blue;
    }
    if (id <= 20) {
      return Colors.green;
    }
    if (id <= 30) {
      return Colors.orange;
    }
    return Colors.purple;
  }

  Future<void> _loadProgress() async {
    final res = await PrefsHelper.checkAndRegenLives();
    final unlocked = await PrefsHelper.getUnlockedLesson();
    if (!mounted) return;
    setState(() {
      _globalLives = res['lives'];
      _remainingSeconds = res['remainingSeconds'];
      _unlockedLesson = unlocked;
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
    // Las vidas ya fueron verificadas en _showLessonStartDialog
    int oldUnlocked = _unlockedLesson;

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
      await _loadProgress();
      
      if (oldUnlocked == 10 && _unlockedLesson == 11) {
         _showCategoryCompleteModal(10);
      } else if (oldUnlocked == 20 && _unlockedLesson == 21) {
         _showCategoryCompleteModal(20);
      } else if (oldUnlocked == 30 && _unlockedLesson == 31) {
         _showCategoryCompleteModal(30);
      } else if (oldUnlocked == 40 && _unlockedLesson == 41) {
         _showJourneyCompleteModal();
      }
    }
  }

  void _showJourneyCompleteModal() {
    AudioHelper.playCategoryComplete(); // Utilizamos este mismo sonido triunfal
    
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.wb_sunny_rounded, color: Colors.amber, size: 48),
              ),
              const SizedBox(height: 24),
              Text(
                '¡Un Viaje Extraordinario!',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, 
                  fontSize: 22,
                  color: isDark ? Colors.amber[400] : Colors.amber[700],
                ), 
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Has completado todas las lecciones de LumenSelah.\n\nQue la luz de la Palabra siga guiando tus pasos y que tu crecimiento espiritual nunca se detenga. Este es solo el principio de tu caminar de fe. ✨',
                style: GoogleFonts.merriweather(
                  height: 1.6,
                  fontSize: 15,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: Text('¡Amén!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryCompleteModal(int categoryEndLessonId) {
    AudioHelper.playCategoryComplete();

    String categoryName = "";
    Color catColor = Colors.blue;
    if (categoryEndLessonId == 10) { categoryName = "Fácil"; catColor = Colors.blue; }
    else if (categoryEndLessonId == 20) { categoryName = "Normal"; catColor = Colors.green; }
    else if (categoryEndLessonId == 30) { categoryName = "Difícil"; catColor = Colors.orange; }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Column(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 60),
              const SizedBox(height: 16),
              Text('¡Categoría Completada!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: catColor), textAlign: TextAlign.center),
            ],
          ),
          content: Text(
            '¡Felicidades! Has superado todas las lecciones de la dificultad $categoryName.\n\nPrepárate para la siguiente etapa de tu viaje.',
            style: GoogleFonts.montserrat(),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: catColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                Navigator.pop(dialogContext); // Cierra dialog
                int nextTab = 0;
                if (categoryEndLessonId == 10) {
                  nextTab = 1;
                } else if (categoryEndLessonId == 20) {
                  nextTab = 2;
                } else if (categoryEndLessonId == 30) {
                  nextTab = 3;
                }
                
                _tabController.animateTo(nextTab);
              },
              child: Text('¡Vamos a la siguiente!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  int _getInitialTabIndex() {
    if (_unlockedLesson <= 10) {
      return 0;
    }
    if (_unlockedLesson <= 20) {
      return 1;
    }
    if (_unlockedLesson <= 30) {
      return 2;
    }
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
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
            controller: _tabController,
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
          controller: _tabController,
          children: [
            _buildCategoryBody('Fácil', 1, 10, Colors.blue, isDarkMode),
            _buildCategoryBody('Normal', 11, 20, Colors.green, isDarkMode),
            _buildCategoryBody('Difícil', 21, 30, Colors.orange, isDarkMode),
            _buildCategoryBody('Teológico', 31, 40, Colors.purple, isDarkMode),
          ],
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
    final bool isCompleted = lessonId < _unlockedLesson;
    
    // Determinar colores y estilos según el estado de la lección
    Color currentColor = isUnlocked ? nodeColor : (isDark ? Colors.grey[700]! : Colors.grey.withValues(alpha: 0.3));
    if (isCompleted) currentColor = Colors.green; // Lección completada se pinta verde
    
    IconData nodeIcon = Icons.lock_outline;
    if (isCompleted) {
      nodeIcon = Icons.check_circle_rounded;
    } else if (isUnlocked) {
      nodeIcon = Icons.menu_book_rounded;
    }

    return GestureDetector(
      onTap: isUnlocked ? () => _showLessonStartDialog(lessonId, nodeColor, title, isCompleted) : null,
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
                    color: isCurrent || isCompleted ? currentColor : Colors.transparent,
                    width: isCurrent || isCompleted ? 4 : 0,
                  ),
                  boxShadow: isCurrent ? [
                     BoxShadow(color: currentColor.withValues(alpha: 0.4), blurRadius: 10, spreadRadius: 2)
                  ] : [],
                ),
                child: Center(
                  child: Icon(
                    nodeIcon,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
              color: isCompleted 
                  ? Colors.green.withValues(alpha: 0.5) 
                  : (isUnlocked ? currentColor.withValues(alpha: 0.5) : Colors.grey.withValues(alpha: 0.2)),
            )
          else
             const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showLessonStartDialog(int lessonId, Color difficultyColor, String title, bool isCompleted) {
    if (_globalLives <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No tienes vidas (❤️). Espera $_formattedTimer o descansa.', style: GoogleFonts.montserrat()),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isCompleted ? Icons.check_circle_rounded : Icons.menu_book_rounded, 
                 color: isCompleted ? Colors.green : difficultyColor, size: 60),
            const SizedBox(height: 16),
            Text(
              isCompleted ? 'Lección Completada' : 'Lección Actual',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: isDark ? Colors.white : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isCompleted ? Colors.green : difficultyColor,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                Navigator.pop(context); // Cierra modal
                _showInvestigationReminder(lessonId, difficultyColor);
              },
              child: Text(
                isCompleted ? 'Volver a practicar' : 'Iniciar lección',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: GoogleFonts.montserrat(
                  color: isDark ? Colors.white70 : Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInvestigationReminder(int lessonId, Color difficultyColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.auto_awesome_rounded, color: Colors.amber, size: 48),
            ),
            const SizedBox(height: 24),
            Text(
              '¡Un pequeño consejo!',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: isDark ? Colors.white : const Color(0xFF2F4F4F),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'La app es solo el comienzo. Te animamos a abrir tu Biblia, investigar por tu cuenta y profundizar en la Palabra para hacer crecer tu espíritu cada día. ✨',
              style: GoogleFonts.merriweather(
                height: 1.6,
                fontSize: 15,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: difficultyColor, 
                   foregroundColor: Colors.white,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   elevation: 0,
                 ),
                 onPressed: () {
                    Navigator.pop(context);
                    _openQuiz(lessonId, difficultyColor);
                 },
                 child: Text('¡Vamos allá!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
               onPressed: () => Navigator.pop(context),
               child: Text(
                 'Regresar', 
                 style: GoogleFonts.montserrat(
                   color: isDark ? Colors.white54 : Colors.grey[600], 
                   fontWeight: FontWeight.w600,
                 )
               ),
            ),
          ],
        ),
      ),
    );
  }
}
