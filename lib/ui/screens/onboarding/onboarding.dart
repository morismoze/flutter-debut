import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:debutapp/ui/screens/auth/auth.dart';
import 'package:debutapp/ui/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  void _handleCtaClick() async {
    await SharedPreferencesHelper.setIsOnboarded(true);
    if (mounted) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop, child: const AuthScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 3,
                  child: ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 100),
                    animationDuration: const Duration(milliseconds: 500),
                    child: SvgPicture.asset(
                      'assets/images/onboarding.svg',
                      semanticsLabel: AppLocalizations.of(context)
                          .onboardingImageSemanticsLabel,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ShowUpAnimation(
                            delayStart: const Duration(milliseconds: 700),
                            animationDuration:
                                const Duration(milliseconds: 500),
                            direction: Direction.vertical,
                            offset: 0.5,
                            child: Text(
                              AppLocalizations.of(context).onboardingHeadline,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(height: 15),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: ShowUpAnimation(
                              delayStart: const Duration(milliseconds: 900),
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              direction: Direction.vertical,
                              offset: 0.5,
                              child: Text(
                                AppLocalizations.of(context).onboardingBody,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  )),
              ShowUpAnimation(
                  delayStart: const Duration(milliseconds: 1200),
                  animationDuration: const Duration(milliseconds: 500),
                  direction: Direction.vertical,
                  offset: 0.5,
                  child: StyledButton(
                    onPressed: _handleCtaClick,
                    text: AppLocalizations.of(context).onboardingCta,
                    suffixIconData: FontAwesomeIcons.arrowRight,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
