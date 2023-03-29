import 'package:debutapp/auth_widget_builder.dart';
import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:debutapp/constants/theme/app_theme.dart';
import 'package:debutapp/models/user_model.dart';
import 'package:debutapp/services/firestore_database.dart';
import 'package:debutapp/ui/screens/auth/auth.dart';
import 'package:debutapp/ui/screens/home/home.dart';
import 'package:debutapp/ui/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:debutapp/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.databaseBuilder}) : super(key: key);

  // Expose builders for 3rd party services at the root of the widget tree
  // This is useful when mocking services while testing
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: AuthWidgetBuilder(
        databaseBuilder: databaseBuilder,
        builder: (BuildContext context, AsyncSnapshot<UserModel> userSnapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: const [Locale('en', 'US')],
            // These delegates make sure that the localization data for the proper language is loaded
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppThemeData.lightThemeData,
            routes: Routes.routes,
            home: Consumer<AuthProvider>(
              builder: (_, authProviderRef, __) {
                if (SharedPreferencesHelper.isOnboarded != true) {
                  return const OnboardingScreen();
                }

                if (userSnapshot.connectionState == ConnectionState.active) {
                  return userSnapshot.hasData
                      ? const HomeScreen()
                      : const AuthScreen();
                }

                return const Material(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
