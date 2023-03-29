import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:debutapp/ui/screens/home/home.dart';
import 'package:debutapp/ui/widgets/styled_button.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 200),
                      animationDuration: const Duration(milliseconds: 500),
                      child: Text(
                        AppLocalizations.of(context).authHeadline,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ShowUpAnimation(
                        delayStart: const Duration(milliseconds: 400),
                        animationDuration: const Duration(milliseconds: 500),
                        child: Text(
                          AppLocalizations.of(context).authBody,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 700),
                      animationDuration: const Duration(milliseconds: 500),
                      child: StyledButton(
                        onPressed: () => _handleGoogleSignIn(authProvider),
                        disabled: authProvider.status == Status.Authenticating,
                        text: AppLocalizations.of(context).authGoogle,
                        prefixIconData: FontAwesomeIcons.google,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 900),
                      animationDuration: const Duration(milliseconds: 500),
                      child: StyledButton(
                        onPressed: () {},
                        disabled: authProvider.status == Status.Authenticating,
                        text: AppLocalizations.of(context).authFacebook,
                        prefixIconData: FontAwesomeIcons.facebook,
                      ),
                    ),
                    const SizedBox(height: 50),
                    if (authProvider.status == Status.Authenticating) ...[
                      const CircularProgressIndicator()
                    ],
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleGoogleSignIn(AuthProvider authProvider) async {
    bool status = await authProvider.signInWithGoogle();
    if (mounted) {
      if (!status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 10),
            content: Text(AppLocalizations.of(context).authError),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            child: const HomeScreen(),
          ),
        );
      }
    }
  }
}
