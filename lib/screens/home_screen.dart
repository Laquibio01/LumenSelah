import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/database_helper.dart';
import '../services/streak_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Colores extraídos del mockup
  static const Color bgColor = Color(0xFFF9F6EE); // Fondo crema
  static const Color textColor = Color(0xFF2E2E2E); // Gris muy oscuro
  static const Color orangeAccent = Color(0xFFECA646); // Naranja
  static const Color greenAccent = Color(0xFF8CC193); // Verde
  static const Color cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
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
                  _buildDailyStreakCard(),
                  const SizedBox(height: 24),
                  _buildDailyVerseCard(),
                  const SizedBox(height: 32),
                  _buildPathMap(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildDailyStreakCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
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
                  GestureDetector(
                    onTap: () async {
                      // Debugging - Tap the flame to simulate "Yesterday" (modified to reset for compatibility)
                      await StreakService().resetStreak();
                      setState(() {});
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Simulado: Racha reiniciada')));
                      }
                    },
                    onLongPress: () async {
                      // Debugging - Long press to reset streak entirely
                      await StreakService().resetStreak();
                      setState(() {});
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Racha reiniciada a 0')));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.local_fire_department, color: streak > 0 ? orangeAccent : Colors.grey, size: 28),
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
                  ),
                  Text(
                    '$streak días',
                    style: GoogleFonts.montserrat(
                      color: streak > 0 ? orangeAccent : Colors.grey,
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
                  _buildDayIndicator('L', weeklyProgress[0], isToday: todayWeekday == 1), // Monday
                  _buildDayIndicator('M', weeklyProgress[1], isToday: todayWeekday == 2), // Tuesday
                  _buildDayIndicator('M', weeklyProgress[2], isToday: todayWeekday == 3), // Wednesday
                  _buildDayIndicator('J', weeklyProgress[3], isToday: todayWeekday == 4), // Thursday
                  _buildDayIndicator('V', weeklyProgress[4], isToday: todayWeekday == 5), // Friday
                  _buildDayIndicator('S', weeklyProgress[5], isToday: todayWeekday == 6), // Saturday
                  _buildDayIndicator('D', weeklyProgress[6], isToday: todayWeekday == 7), // Sunday
                ],
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _buildDayIndicator(String day, bool isChecked, {bool isToday = false}) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isChecked 
                ? orangeAccent.withOpacity(0.15) 
                : (isToday ? Colors.grey.withOpacity(0.25) : Colors.grey.withOpacity(0.1)),
            shape: BoxShape.circle,
            border: Border.all(
              color: isChecked 
                  ? orangeAccent 
                  : (isToday ? Colors.grey.shade400 : Colors.transparent),
              width: isToday ? 2.0 : 1.5,
            ),
          ),
          child: Center(
            child: isChecked
                ? const Icon(Icons.local_fire_department, color: orangeAccent, size: 20)
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
            color: isChecked ? orangeAccent : (isToday ? textColor : Colors.grey),
            fontSize: 12,
            fontWeight: isChecked || isToday ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDailyVerseCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      // Mismo diseño pero ahora envuelve un FutureBuilder
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: greenAccent.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
              color: greenAccent,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // Aquí buscamos Salmos (19), Cap 119, Ver 105
          FutureBuilder<Verse?>(
            future: DatabaseHelper.getVerse(19, 119, 105),
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
                      color: textColor.withOpacity(0.6),
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

  Widget _buildPathMap(BuildContext context) {
    Color lineColor = const Color(0xFF9ED3A5).withOpacity(0.5);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNode('Genesis 1', isCompleted: true),
            Container(width: 50, height: 4, color: lineColor),
            _buildNode('Genesis 2', isCompleted: true),
          ],
        ),
        Transform.translate(
          offset: const Offset(70, 0), // Centro del nodo derecho (25 espacio medio + 45 mitigad del nodo)
          child: Container(width: 4, height: 40, color: lineColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNode('Genesis 4', isCompleted: false),
            Container(width: 50, height: 4, color: lineColor),
            _buildNode('Genesis 3', isCurrent: true), // Zig-zag
          ],
        ),
        Transform.translate(
          offset: const Offset(-70, 0), // Centro del nodo izquierdo
          child: Container(width: 4, height: 40, color: lineColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNode('Genesis 5', isCompleted: false),
            Container(width: 50, height: 4, color: lineColor),
            _buildNode('Genesis 6', isCompleted: false),
          ],
        ),
        const SizedBox(height: 48),
        _buildStartLessonButton(context),
      ],
    );
  }

  Widget _buildNode(String title, {bool isCompleted = false, bool isCurrent = false}) {
    Color bgColor = isCompleted ? const Color(0xFF9ED3A5) : Colors.white;
    Color borderColor = isCompleted ? const Color(0xFF9ED3A5) : const Color(0xFF8FBF9F);
    Color textColorItem = isCurrent ? Colors.white : (isCompleted ? Colors.white : const Color(0xFF2E2E2E));

    BoxDecoration decor = BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: borderColor, width: 2),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 4)),
      ]
    );

    if (isCurrent) {
      decor = BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF4A261), Color(0xFFECA646)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: const Color(0xFFF4A261).withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4)),
        ]
      );
    }

    return Container(
      width: 90,
      height: 90,
      decoration: decor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isCompleted || isCurrent)
            Icon(
              isCompleted ? Icons.check : Icons.local_fire_department,
              color: Colors.white,
              size: 28,
            )
          else
            const SizedBox(height: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.montserrat(
              color: textColorItem,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartLessonButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await StreakService().checkAndUpdateStreak(); 
        setState(() {}); // Recarga la interfaz entera incluyendo el FutureBuilder de racha
        
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lección completada', style: GoogleFonts.montserrat()),
              backgroundColor: const Color(0xFF8CC193),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF4A261),
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
