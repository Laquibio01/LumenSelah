import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static const String _lastLessonDateKey = 'lastLessonDate';
  static const String _streakCountKey = 'streakCount';

  static const String _lastBookIdKey = 'lastBookId';
  static const String _lastChapterKey = 'lastChapterKey';
  static const String _highlightedVersesKey = 'highlightedVerses';
  static const String _favoriteVersesKey = 'favoriteVerses';
  static const String _verseNotesKey = 'verseNotes';

  static const String _fontSizeKey = 'readerFontSize';
  static const String _lineHeightKey = 'readerLineHeight';

  // Lecciones y Vidas
  static const String _globalLivesKey = 'globalLives';
  static const String _unlockedLessonKey = 'unlockedLesson';

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

  static Future<Map<String, int>> getHighlightedVerses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_highlightedVersesKey);
    if (jsonString != null) {
      try {
        final Map<String, dynamic> decoded = jsonDecode(jsonString);
        return decoded.map((key, value) => MapEntry(key, value as int));
      } catch (e) {
        return {};
      }
    }
    return {};
  }

  static Future<void> saveHighlightedVerses(Map<String, int> verses) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(verses);
    await prefs.setString(_highlightedVersesKey, jsonString);
  }

  static Future<List<String>> getFavoriteVerses() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteVersesKey) ?? [];
  }

  static Future<void> saveFavoriteVerses(List<String> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoriteVersesKey, favorites);
  }

  static Future<Map<String, String>> getVerseNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_verseNotesKey);
    if (jsonString != null) {
      try {
        final Map<String, dynamic> decoded = jsonDecode(jsonString);
        return decoded.map((key, value) => MapEntry(key, value.toString()));
      } catch (e) {
        return {};
      }
    }
    return {};
  }

  static Future<void> saveVerseNotes(Map<String, String> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(notes);
    await prefs.setString(_verseNotesKey, jsonString);
  }

  static Future<double> getReaderFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fontSizeKey) ?? 18.0;
  }

  static Future<void> saveReaderFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, size);
  }

  static Future<double> getReaderLineHeight() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_lineHeightKey) ?? 1.6;
  }

  static Future<void> saveReaderLineHeight(double height) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_lineHeightKey, height);
  }

  static const String _lastLifeRegenTimeKey = 'lastLifeRegenTime';
  static const int maxLives = 5;
  static const int minutesPerLife = 5;

  // == LECCIONES Y VIDAS ==

  // Calcula y restaura vidas según el tiempo
  static Future<Map<String, dynamic>> checkAndRegenLives() async {
    final prefs = await SharedPreferences.getInstance();
    int currentLives = prefs.getInt(_globalLivesKey) ?? maxLives;
    String? lastRegenStr = prefs.getString(_lastLifeRegenTimeKey);

    if (currentLives >= maxLives) {
      if (lastRegenStr != null) {
        await prefs.remove(_lastLifeRegenTimeKey);
      }
      return {'lives': maxLives, 'remainingSeconds': 0};
    }

    if (lastRegenStr == null) {
      lastRegenStr = DateTime.now().toIso8601String();
      await prefs.setString(_lastLifeRegenTimeKey, lastRegenStr);
    }

    DateTime lastRegen = DateTime.parse(lastRegenStr);
    DateTime now = DateTime.now();
    Duration difference = now.difference(lastRegen);

    int secondsPassed = difference.inSeconds;
    int secondsPerLife = minutesPerLife * 60;

    if (secondsPassed >= secondsPerLife) {
      int livesToRecover = secondsPassed ~/ secondsPerLife;
      currentLives += livesToRecover;
      
      if (currentLives >= maxLives) {
        currentLives = maxLives;
        await prefs.remove(_lastLifeRegenTimeKey);
        await prefs.setInt(_globalLivesKey, currentLives);
        return {'lives': currentLives, 'remainingSeconds': 0};
      } else {
        int remainderSeconds = secondsPassed % secondsPerLife;
        // Avanzamos el reloj de regeneración
        DateTime newRegenTime = now.subtract(Duration(seconds: remainderSeconds));
        await prefs.setString(_lastLifeRegenTimeKey, newRegenTime.toIso8601String());
        await prefs.setInt(_globalLivesKey, currentLives);
        return {'lives': currentLives, 'remainingSeconds': secondsPerLife - remainderSeconds};
      }
    } else {
      return {'lives': currentLives, 'remainingSeconds': secondsPerLife - secondsPassed};
    }
  }

  static Future<int> getGlobalLives() async {
    final res = await checkAndRegenLives();
    return res['lives'] as int;
  }

  static Future<void> saveGlobalLives(int lives) async {
    final prefs = await SharedPreferences.getInstance();
    int current = prefs.getInt(_globalLivesKey) ?? maxLives;
    
    // Asegurarse de no pasar el máximo
    if (lives > maxLives) lives = maxLives;
    
    // Si gastamos una vida estando al máximo, iniciamos el cronómetro
    if (lives < current && current == maxLives) {
       await prefs.setString(_lastLifeRegenTimeKey, DateTime.now().toIso8601String());
    }
    
    await prefs.setInt(_globalLivesKey, lives);
  }

  static Future<int> getUnlockedLesson() async {
    final prefs = await SharedPreferences.getInstance();
    // Lección 1 por defecto
    return prefs.getInt(_unlockedLessonKey) ?? 1;
  }

  static Future<void> saveUnlockedLesson(int lessonIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_unlockedLessonKey, lessonIndex);
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

  // Reinicia por completo el nivel de las lecciones (a 1) y recarga las vidas (a 3).
  static Future<void> debugResetLessonsProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_unlockedLessonKey, 1);
    await prefs.setInt(_globalLivesKey, 3);
  }
}
