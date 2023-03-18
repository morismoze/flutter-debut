import 'dart:async';
import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:debutapp/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  /// This is needed in a case when Flutter needs to call
  /// native code before calling runApp or in simpler words
  /// if the main function is async
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await setPreferredOrientations();
  return runZonedGuarded(() async => runApp(App()), (error, stack) {});
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
