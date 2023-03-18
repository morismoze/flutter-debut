import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:debutapp/ui/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:debutapp/routes.dart';
import 'package:debutapp/ui/screens/home/home.dart';

class App extends StatelessWidget {
  App({super.key});

  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      theme: AppThemeData.lightThemeData,
      routes: Routes.routes,
      initialRoute:
          SharedPreferencesHelper.isOnboarded != true ? "home" : "onboarding",
      home: const HomeScreen(),
    );
  }
}
