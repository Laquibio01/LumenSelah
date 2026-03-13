import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonsPathScreen extends StatelessWidget {
  const LessonsPathScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bgColor = theme.scaffoldBackgroundColor;
    final textColor = colorScheme.onBackground;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: textColor, size: 20),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Center(
          child: _buildPathMap(context, theme, colorScheme, textColor),
        ),
      ),
    );
  }

  Widget _buildPathMap(BuildContext context, ThemeData theme, ColorScheme colorScheme, Color textColor) {
    Color lineColor = colorScheme.secondary.withOpacity(0.5);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNode('Genesis 1', isCompleted: true, colorScheme: colorScheme, textColor: textColor, theme: theme),
            Container(width: 50, height: 4, color: lineColor),
            _buildNode('Genesis 2', isCompleted: true, colorScheme: colorScheme, textColor: textColor, theme: theme),
          ],
        ),
        Transform.translate(
          offset: const Offset(70, 0),
          child: Container(width: 4, height: 40, color: lineColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNode('Genesis 4', isCompleted: false, colorScheme: colorScheme, textColor: textColor, theme: theme),
            Container(width: 50, height: 4, color: lineColor),
            _buildNode('Genesis 3', isCurrent: true, colorScheme: colorScheme, textColor: textColor, theme: theme),
          ],
        ),
        Transform.translate(
          offset: const Offset(-70, 0),
          child: Container(width: 4, height: 40, color: lineColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNode('Genesis 5', isCompleted: false, colorScheme: colorScheme, textColor: textColor, theme: theme),
            Container(width: 50, height: 4, color: lineColor),
            _buildNode('Genesis 6', isCompleted: false, colorScheme: colorScheme, textColor: textColor, theme: theme),
          ],
        ),
        const SizedBox(height: 48),
        // Puedes agregar aquí un botón de acción si lo deseas
      ],
    );
  }

  Widget _buildNode(String title, {bool isCompleted = false, bool isCurrent = false, required ColorScheme colorScheme, required Color textColor, required ThemeData theme}) {
    // Usar cardColor para nodos no completados, secondary para completados
    Color bgColor = isCompleted ? colorScheme.secondary : theme.cardColor;
    Color borderColor = isCompleted ? colorScheme.secondary : colorScheme.secondary.withOpacity(0.5);
    Color textColorItem = isCurrent ? Colors.white : (isCompleted ? Colors.white : colorScheme.onSurface);

    BoxDecoration decor = BoxDecoration(
      color: isCurrent ? null : bgColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: borderColor, width: 2),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 4)),
      ]
    );

    if (isCurrent) {
      decor = BoxDecoration(
        gradient: LinearGradient(
          colors: theme.brightness == Brightness.dark
              ? [colorScheme.primary.withOpacity(0.85), colorScheme.surface]
              : [colorScheme.primary.withOpacity(0.85), colorScheme.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: colorScheme.primary.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4)),
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
}
