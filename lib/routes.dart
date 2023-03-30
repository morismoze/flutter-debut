import 'package:debutapp/ui/screens/challenge_builder/challenge_builder.dart';
import 'package:debutapp/ui/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:debutapp/ui/screens/auth/auth.dart';
import 'package:debutapp/ui/screens/home/home.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String challengeBuilder = '/challenge-build';

  static final routes = <String, WidgetBuilder>{
    onboarding: (BuildContext context) => const OnboardingScreen(),
    auth: (BuildContext context) => const AuthScreen(),
    home: (BuildContext context) => const HomeScreen(),
    challengeBuilder: (BuildContext context) => const ChallengeBuilderScreen(),
  };
}
