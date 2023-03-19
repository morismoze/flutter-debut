import 'package:debutapp/data/sharedpref/shared_preferences_helper.dart';
import 'package:debutapp/ui/screens/home/home.dart';
import 'package:debutapp/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  void _handleCtaClick() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
    SharedPreferencesHelper.setIsOnboarded(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  'assets/images/onboarding.svg',
                  semanticsLabel: 'Onboarding hero image',
                  height: 260,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                              AppLocalizations.of(context).onboardingHeadline,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor)),
                        ),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).onboardingDescription,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                      ],
                    ),
                  )),
              Button(
                onPressed: _handleCtaClick,
                text: AppLocalizations.of(context).onboardingCta,
                suffixIconData: Icons.arrow_forward_rounded,
              )
            ],
          )),
    );
  }
}
