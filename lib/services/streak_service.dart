import 'package:shared_preferences/shared_preferences.dart';

class StreakService {
  static const String _keyStreakCount = 'streak_count';
  static const String _keyLastCheckIn = 'last_check_in';
  static const String _keyWeeklyProgress = 'weekly_progress'; // List of ISO strings of days checked in this week

  /// Gets the current streak count.
  Future<int> getStreakCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyStreakCount) ?? 0;
  }

  /// Checks and updates the daily streak.
  ///
  /// Returns `true` if the streak was increased or reset (first check of the day).
  /// Returns `false` if the user already checked in today.
  Future<bool> checkAndUpdateStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastCheckInStr = prefs.getString(_keyLastCheckIn);
    int currentStreak = prefs.getInt(_keyStreakCount) ?? 0;

    if (lastCheckInStr == null) {
      // First time ever
      await prefs.setInt(_keyStreakCount, 1);
      await prefs.setString(_keyLastCheckIn, today.toIso8601String());
      await _updateWeeklyProgress(prefs, today);
      return true;
    }

    final lastCheckIn = DateTime.parse(lastCheckInStr);
    final difference = today.difference(lastCheckIn).inDays;

    if (difference == 0) {
      // Already checked in today
      return false;
    } else if (difference == 1) {
      // Consecutive day!
      currentStreak++;
      await prefs.setInt(_keyStreakCount, currentStreak);
      await prefs.setString(_keyLastCheckIn, today.toIso8601String());
      await _updateWeeklyProgress(prefs, today);
      return true;
    } else {
      // Missed one or more days, reset to 1 (since they checked in today)
      await prefs.setInt(_keyStreakCount, 1);
      await prefs.setString(_keyLastCheckIn, today.toIso8601String());
      await _updateWeeklyProgress(prefs, today);
      return true;
    }
  }

  Future<void> _updateWeeklyProgress(SharedPreferences prefs, DateTime today) async {
    List<String> progress = prefs.getStringList(_keyWeeklyProgress) ?? [];
    
    // Remove dates that are not from the current week (Monday-Sunday)
    progress.removeWhere((dateStr) {
      DateTime date = DateTime.parse(dateStr);
      // If difference is greater than 7, it's definitely a past week
      // Or if the weekday is later in the week than today, it's from a previous week
      return today.difference(date).inDays >= 7 || date.weekday > today.weekday;
    });

    String todayStr = today.toIso8601String();
    if (!progress.contains(todayStr)) {
      progress.add(todayStr);
    }
    
    await prefs.setStringList(_keyWeeklyProgress, progress);
  }

  /// Returns a list of booleans representing Mon-Sun, true if checked in that day.
  Future<List<bool>> getWeeklyProgress() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> progressStr = prefs.getStringList(_keyWeeklyProgress) ?? [];
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);

    List<bool> weeklyStatus = List.generate(7, (index) => false);

    for (String dateStr in progressStr) {
      DateTime date = DateTime.parse(dateStr);
      // Validates that it's in the same week
      if (today.difference(date).inDays < 7 && date.weekday <= today.weekday) {
        weeklyStatus[date.weekday - 1] = true; // weekday is 1-7 (Mon-Sun)
      }
    }

    return weeklyStatus;
  }

  /// Explicitly resets the streak (optional utility).
  Future<void> resetStreak() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyStreakCount, 0);
    await prefs.remove(_keyLastCheckIn);
    await prefs.remove(_keyWeeklyProgress);
  }

  /// Checks if the user has already checked in today.
  Future<bool> isTodayChecked() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCheckInStr = prefs.getString(_keyLastCheckIn);
    if (lastCheckInStr == null) return false;
    final lastCheckIn = DateTime.parse(lastCheckInStr);
    final now = DateTime.now();
    return lastCheckIn.year == now.year &&
        lastCheckIn.month == now.month &&
        lastCheckIn.day == now.day;
  }
}
