import 'package:debutapp/ui/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:debutapp/ui/screens/auth/auth.dart';
import 'package:debutapp/ui/screens/home/home.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    onboarding: (BuildContext context) => const OnboardingScreen(),
    home: (BuildContext context) => const HomeScreen(),
    login: (BuildContext context) => const AuthScreen(),
  };
}
