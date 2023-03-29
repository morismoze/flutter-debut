import 'dart:async';
import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:debutapp/services/firestore_database.dart';
import 'package:debutapp/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  /// This is needed in a case when Flutter needs to call
  /// native code before calling runApp or in simpler words
  /// if the main function is async
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesHelper.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runZonedGuarded(
    () async => runApp(
      App(
        databaseBuilder: (_, uid) => FirestoreDatabase(uid: uid),
      ),
    ),
    (error, stack) {},
  );
}
