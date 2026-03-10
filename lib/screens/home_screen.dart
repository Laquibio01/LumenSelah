import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  const SizedBox(height: 24),
                  _buildPathLessons(),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.local_fire_department, color: orangeAccent, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    'Daily Streak',
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                '4h',
                style: GoogleFonts.montserrat(
                  color: orangeAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Barra de progreso
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.6, // 60%
              minHeight: 8,
              backgroundColor: orangeAccent.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(orangeAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyVerseCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
          Text(
            '"Lámpara es a mis pies tu palabra, y lumbrera a mi camino."',
            style: GoogleFonts.merriweather(
              color: textColor,
              fontSize: 16,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Salmos 119:105',
            style: GoogleFonts.montserrat(
              color: textColor.withOpacity(0.6),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathLessons() {
    // Dibujo de ruta simplificado
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNode(title: 'Genesis 1', isCompleted: true),
            _buildHLine(),
            _buildNode(title: 'Genesis 2', isCompleted: true),
          ],
        ),
        _buildVLine(alignRight: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNode(title: 'Genesis 3', isCompleted: true),
            _buildHLine(),
            _buildNode(title: 'Genesis 4', isActive: true), // El naranja
          ],
        ),
        _buildVLine(alignLeft: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNode(title: 'Genesis 5', isLocked: true),
            _buildHLine(),
            _buildNode(title: 'Genesis 6', isLocked: true),
          ],
        ),
      ],
    );
  }

  Widget _buildNode({required String title, bool isCompleted = false, bool isActive = false, bool isLocked = false}) {
    Color bg = Colors.white;
    Color border = greenAccent;
    Color iconColor = Colors.white;
    IconData icon = Icons.check;

    if (isCompleted) {
      bg = greenAccent;
      border = greenAccent;
    } else if (isActive) {
      bg = orangeAccent;
      border = orangeAccent;
      icon = Icons.local_fire_department;
    } else {
      bg = Colors.white;
      border = greenAccent;
      iconColor = greenAccent;
    }

    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: border, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isCompleted || isActive ? Colors.transparent : Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: isCompleted || isActive ? Colors.white : textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHLine() {
    return Container(
      width: 40,
      height: 4,
      color: greenAccent.withOpacity(0.5),
    );
  }

  Widget _buildVLine({bool alignRight = false, bool alignLeft = false}) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(
        left: alignLeft ? 45 : 0, 
        right: alignRight ? 45 : 0
      ),
      alignment: alignRight ? Alignment.centerRight : alignLeft ? Alignment.centerLeft : Alignment.center,
      child: Container(
        width: 4,
        color: greenAccent.withOpacity(0.5),
      ),
    );
  }
}
