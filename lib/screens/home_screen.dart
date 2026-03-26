import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import '../services/streak_service.dart';
import '../helpers/streak_helper.dart';
import '../data/lessons_data.dart';
import '../data/daily_verses_data.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onStartLesson;
  const HomeScreen({super.key, this.onStartLesson});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Colores ahora se obtienen del tema
  int _unlockedLesson = 1;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> reloadData() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    final unlocked = await PrefsHelper.getUnlockedLesson();
    if (mounted) {
      setState(() {
        _unlockedLesson = unlocked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textColor = colorScheme.onSurface;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'LumenSelah',
          style: GoogleFonts.montserrat(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  _buildDailyStreakCard(theme, colorScheme, textColor),
                  const SizedBox(height: 24),
                  _buildDailyVerseCard(theme, colorScheme, textColor),
                  const SizedBox(height: 32),
                  _buildPathMap(context, theme, colorScheme, textColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildDailyStreakCard(ThemeData theme, ColorScheme colorScheme, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FutureBuilder(
        future: Future.wait([
          StreakService().getStreakCount(),
          StreakService().getWeeklyProgress()
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          int streak = snapshot.hasData ? (snapshot.data![0] as int) : 0;
          List<bool> weeklyProgress = snapshot.hasData ? (snapshot.data![1] as List<bool>) : List.filled(7, false);
          int todayWeekday = DateTime.now().weekday;
          
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, color: streak > 0 ? colorScheme.primary : Colors.grey, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Racha Diaria',
                        style: GoogleFonts.montserrat(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$streak días',
                    style: GoogleFonts.montserrat(
                      color: streak > 0 ? colorScheme.primary : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Días de la semana
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDayIndicator('L', weeklyProgress[0], colorScheme, textColor, isToday: todayWeekday == 1), // Monday
                  _buildDayIndicator('M', weeklyProgress[1], colorScheme, textColor, isToday: todayWeekday == 2), // Tuesday
                  _buildDayIndicator('M', weeklyProgress[2], colorScheme, textColor, isToday: todayWeekday == 3), // Wednesday
                  _buildDayIndicator('J', weeklyProgress[3], colorScheme, textColor, isToday: todayWeekday == 4), // Thursday
                  _buildDayIndicator('V', weeklyProgress[4], colorScheme, textColor, isToday: todayWeekday == 5), // Friday
                  _buildDayIndicator('S', weeklyProgress[5], colorScheme, textColor, isToday: todayWeekday == 6), // Saturday
                  _buildDayIndicator('D', weeklyProgress[6], colorScheme, textColor, isToday: todayWeekday == 7), // Sunday
                ],
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _buildDayIndicator(String day, bool isChecked, ColorScheme colorScheme, Color textColor, {bool isToday = false}) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isChecked 
                ? colorScheme.primary.withValues(alpha: 0.15) 
                : (isToday ? Colors.grey.withValues(alpha: 0.25) : Colors.grey.withValues(alpha: 0.1)),
            shape: BoxShape.circle,
            border: Border.all(
              color: isChecked 
                  ? colorScheme.primary 
                  : (isToday ? Colors.grey.shade400 : Colors.transparent),
              width: isToday ? 2.0 : 1.5,
            ),
          ),
          child: Center(
            child: isChecked
                ? Icon(Icons.local_fire_department, color: colorScheme.primary, size: 20)
                : Text(
                    day,
                    style: GoogleFonts.montserrat(
                      color: isToday ? textColor : Colors.grey,
                      fontWeight: isToday ? FontWeight.w900 : FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: GoogleFonts.montserrat(
            color: isChecked ? colorScheme.primary : (isToday ? textColor : Colors.grey),
            fontSize: 12,
            fontWeight: isChecked || isToday ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDailyVerseCard(ThemeData theme, ColorScheme colorScheme, Color textColor) {
    // Calculamos el índice basado en la fecha actual para rotar diariamente
    final int dayIndex = DateTime.now().difference(DateTime(2024, 1, 1)).inDays;
    final Map<String, int> todayVerse = curatedDailyVerses[dayIndex % curatedDailyVerses.length];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.secondary.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Versículo Diario',
            style: GoogleFonts.montserrat(
              color: colorScheme.secondary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          FutureBuilder<Verse?>(
            future: DatabaseHelper.getVerse(todayVerse['bookId']!, todayVerse['chapter']!, todayVerse['verse']!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
                return Text('Lámpara es a mis pies tu palabra, ... (Error cargando BD)');
              }

              final verse = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"${verse.text}"',
                    style: GoogleFonts.merriweather(
                      color: textColor,
                      fontSize: 16,
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${verse.bookName} ${verse.chapter}:${verse.verse}',
                    style: GoogleFonts.montserrat(
                      color: textColor.withValues(alpha: 0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(int id) {
    if (id <= 10) return Colors.blue;
    if (id <= 20) return Colors.green;
    if (id <= 30) return Colors.orange;
    return Colors.purple;
  }

  Widget _buildDynamicNode(int id, ThemeData theme, ColorScheme colorScheme, Color textColor) {
    bool isCompleted = id < _unlockedLesson;
    bool isCurrent = id == _unlockedLesson;
    String title = lessonsDatabase[id]?.title ?? 'Lección $id';
    Color catColor = _getCategoryColor(id);
    return _buildNode(title, isCompleted: isCompleted, isCurrent: isCurrent, theme: theme, catColor: catColor, textColor: textColor);
  }

  Widget _buildPathMap(BuildContext context, ThemeData theme, ColorScheme colorScheme, Color textColor) {
    Color lineColor = colorScheme.secondary.withValues(alpha: 0.5);
    int startId = _unlockedLesson <= 4 ? 1 : _unlockedLesson - 1;
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDynamicNode(startId, theme, colorScheme, textColor),
            Container(width: 50, height: 4, color: lineColor),
            _buildDynamicNode(startId + 1, theme, colorScheme, textColor),
          ],
        ),
        Transform.translate(
          offset: const Offset(70, 0), // Centro del nodo derecho
          child: Container(width: 4, height: 40, color: lineColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDynamicNode(startId + 3, theme, colorScheme, textColor),
            Container(width: 50, height: 4, color: lineColor),
            _buildDynamicNode(startId + 2, theme, colorScheme, textColor), // Zig-zag
          ],
        ),
        Transform.translate(
          offset: const Offset(-70, 0), // Centro del nodo izquierdo
          child: Container(width: 4, height: 40, color: lineColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDynamicNode(startId + 4, theme, colorScheme, textColor),
            Container(width: 50, height: 4, color: lineColor),
            _buildDynamicNode(startId + 5, theme, colorScheme, textColor),
          ],
        ),
        const SizedBox(height: 48),
        _buildStartLessonButton(context),
      ],
    );
  }

  Widget _buildNode(String title, {bool isCompleted = false, bool isCurrent = false, required ThemeData theme, required Color catColor, required Color textColor}) {
    bool isDark = theme.brightness == Brightness.dark;
    Color bgColor = isCompleted ? catColor : (isDark ? theme.cardColor : Colors.white);
    Color borderColor = isCompleted ? catColor : catColor.withValues(alpha: 0.5);
    Color textColorItem = isCurrent ? Colors.white : (isCompleted ? Colors.white : textColor);

    BoxDecoration decor = BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: borderColor, width: 2),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 4)),
      ]
    );

    if (isCurrent) {
      decor = BoxDecoration(
        color: catColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: catColor, width: 2),
        boxShadow: [
          BoxShadow(color: catColor.withValues(alpha: 0.4), blurRadius: 8, offset: const Offset(0, 4)),
        ]
      );
    }

    // Determine the icon based on node state to match LessonsTabScreen
    IconData nodeIcon;
    if (isCurrent) {
      nodeIcon = Icons.local_fire_department;
    } else if (isCompleted) {
      nodeIcon = Icons.menu_book_rounded;
    } else {
      nodeIcon = Icons.lock_outline;
    }

    return Container(
      width: 90,
      height: 90,
      decoration: decor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            nodeIcon,
            color: (isCompleted || isCurrent) ? Colors.white : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                color: textColorItem,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartLessonButton(BuildContext context) {
    Color buttonColor = _getCategoryColor(_unlockedLesson);
    
    return ElevatedButton(
      onPressed: () {
        if (widget.onStartLesson != null) {
          widget.onStartLesson!();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        elevation: 3,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        'Empezar Lección',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
