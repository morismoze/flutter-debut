import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:debutapp/ui/constants/theme/app_theme.dart';
import 'package:debutapp/ui/screens/home/home.dart';
import 'package:debutapp/ui/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:debutapp/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('en', 'US'), Locale('hr', 'HRV')],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppThemeData.lightThemeData,
      routes: Routes.routes,
      home: SharedPreferencesHelper.isOnboarded != true
          ? const OnboardingScreen()
          : const HomeScreen(),
    );
  }
}
