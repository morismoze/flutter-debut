import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:debutapp/ui/widgets/styled_button.dart';
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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
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
                        )),
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
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 50),
                Column(children: [
                  ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 700),
                      animationDuration: const Duration(milliseconds: 500),
                      child: StyledButton(
                        onPressed: () async {
                          bool status = await authProvider.signInWithGoogle();
                          print(status);
                          if (mounted) {
                            if (!status) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: const Duration(seconds: 10),
                                      content: Text(AppLocalizations.of(context)
                                          .authError)));
                            } else {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.scale,
                                      child: const AuthScreen()));
                            }
                          }
                        },
                        text: AppLocalizations.of(context).authGoogle,
                        prefixIconData: FontAwesomeIcons.google,
                      )),
                  const SizedBox(height: 10),
                  ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 900),
                      animationDuration: const Duration(milliseconds: 500),
                      child: StyledButton(
                        onPressed: () {},
                        text: AppLocalizations.of(context).authFacebook,
                        prefixIconData: FontAwesomeIcons.facebook,
                      )),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
