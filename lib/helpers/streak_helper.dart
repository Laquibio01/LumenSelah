import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static const String _lastLessonDateKey = 'lastLessonDate';
  static const String _streakCountKey = 'streakCount';

  static const String _lastBookIdKey = 'lastBookId';
  static const String _lastChapterKey = 'lastChapterKey';

  // Verifica la racha actual (si pasó 1 día, se añade 1; si pasaron >1 días, regresa a 0; si es en el mismo día, se queda igual)
  // Devuelve la cantidad de días de racha vigente
  static Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    int currentStreak = prefs.getInt(_streakCountKey) ?? 0;
    String? lastDateStr = prefs.getString(_lastLessonDateKey);

    if (lastDateStr != null) {
      DateTime lastDate = DateTime.parse(lastDateStr);
      DateTime today = DateTime.now();

      // Comparar solo años, meses y días (ignorar tiempo exacto)
      DateTime lastDayOnly = DateTime(lastDate.year, lastDate.month, lastDate.day);
      DateTime todayOnly = DateTime(today.year, today.month, today.day);

      int differenceInDays = todayOnly.difference(lastDayOnly).inDays;

      if (differenceInDays > 1) {
        // La racha se rompió al no entrar en un día
        currentStreak = 0;
        await prefs.setInt(_streakCountKey, 0); 
      }
    }

    return currentStreak;
  }

  // Marca una lección como completada "hoy"
  static Future<void> completeLesson() async {
    final prefs = await SharedPreferences.getInstance();
    int currentStreak = prefs.getInt(_streakCountKey) ?? 0;
    String? lastDateStr = prefs.getString(_lastLessonDateKey);

    DateTime today = DateTime.now();

    if (lastDateStr != null) {
      DateTime lastDate = DateTime.parse(lastDateStr);
      
      DateTime lastDayOnly = DateTime(lastDate.year, lastDate.month, lastDate.day);
      DateTime todayOnly = DateTime(today.year, today.month, today.day);

      int differenceInDays = todayOnly.difference(lastDayOnly).inDays;

      if (differenceInDays == 1) {
        // Entró al día siguiente, la racha aumenta en 1
        currentStreak++;
      } else if (differenceInDays > 1) {
        // Perdió la racha, pero acaba de completar una hoy, entonces empieza en 1.
        currentStreak = 1;
      }
      // Si la diferencia es 0 (mismo día), la racha se mantiene igual (no suma otra vez)
    } else {
      // Primera vez que entra
      currentStreak = 1;
    }

    await prefs.setInt(_streakCountKey, currentStreak);
    await prefs.setString(_lastLessonDateKey, today.toIso8601String());
  }

  // == LECTOR BÍBLICO (PERSISTENCIA) ==
  
  static Future<Map<String, int>> getLastBiblePosition() async {
    final prefs = await SharedPreferences.getInstance();
    int bookId = prefs.getInt(_lastBookIdKey) ?? 1; // Por defecto Genesis
    int chapter = prefs.getInt(_lastChapterKey) ?? 1; // Por defecto 1
    return {'bookId': bookId, 'chapter': chapter};
  }

  static Future<void> saveLastBiblePosition(int bookId, int chapter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastBookIdKey, bookId);
    await prefs.setInt(_lastChapterKey, chapter);
  }

  // == MÉTODOS DE PRUEBA (DEBUG) ==
  
  // Simula que la última lección fue "ayer" para poder ganar racha "hoy" de nuevo.
  static Future<void> debugSetLastLessonToYesterday() async {
    final prefs = await SharedPreferences.getInstance();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    await prefs.setString(_lastLessonDateKey, yesterday.toIso8601String());
  }

  // Reinicia por completo la racha y la fecha
  static Future<void> debugResetStreak() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_streakCountKey);
    await prefs.remove(_lastLessonDateKey);
  }
}
