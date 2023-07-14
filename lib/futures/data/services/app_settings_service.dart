import 'package:flutter_training/futures/data/keys/prefs_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsService {
  static Future<bool> changeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(PrefsKeys.isDark);
    if (isDark == null) {
      await prefs.setBool(PrefsKeys.isDark, true);
    } else {
      await prefs.setBool(PrefsKeys.isDark, !isDark);
    }
    final result = prefs.getBool(PrefsKeys.isDark);
    return result!;
  }

  static Future<bool> getMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(PrefsKeys.isDark);
    if (isDark == null) return false;
    return isDark;
  }
}
