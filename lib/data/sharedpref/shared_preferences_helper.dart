import 'dart:async';

import 'package:debutapp/data/sharedpref/shared_preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // shared pref instance
  static late SharedPreferences _sharedPreferences;

  static Future<SharedPreferences> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  static bool? get isOnboarded {
    return _sharedPreferences.getBool(Preferences.isOnboarded);
  }

  static Future<bool> setIsOnboarded(bool isOnboarded) async {
    return _sharedPreferences.setBool(Preferences.isOnboarded, isOnboarded);
  }
}
