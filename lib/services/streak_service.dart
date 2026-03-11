import 'package:shared_preferences/shared_preferences.dart';

class StreakService {
  static const String _keyStreakCount = 'streak_count';
  static const String _keyLastCheckIn = 'last_check_in';

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
      await prefs.setInt(_keyStreakCount, 0);
      await prefs.setString(_keyLastCheckIn, today.toIso8601String());
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
      return true;
    } else {
      // Missed one or more days, reset to 0
      await prefs.setInt(_keyStreakCount, 0);
      await prefs.setString(_keyLastCheckIn, today.toIso8601String());
      return true;
    }
  }

  /// Explicitly resets the streak (optional utility).
  Future<void> resetStreak() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyStreakCount, 0);
    await prefs.remove(_keyLastCheckIn);
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
