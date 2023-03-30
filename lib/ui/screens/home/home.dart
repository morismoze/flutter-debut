import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:debutapp/models/user_challenge_day_model.dart';
import 'package:debutapp/models/user_challenge_model.dart';
import 'package:debutapp/ui/screens/challenge_builder/challenge_builder.dart';
import 'package:debutapp/ui/widgets/challenge/challenge_tile.dart';
import 'package:debutapp/ui/widgets/styled_icon_button.dart';
import 'package:debutapp/ui/widgets/hero_percentage_card.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      title: _buildAppBarTitle(),
      actions: _buildActions(),
    );
  }

  Widget _buildAppBarTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          Row(
            children: [
              Text(
                '${DateFormat(DateFormat.ABBR_WEEKDAY).format(DateTime.now())}, ${DateFormat(DateFormat.DAY).format(DateTime.now())}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      _buildChallengeBuilderButton(),
    ];
  }

  Widget _buildChallengeBuilderButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: StyledIconButton(
        onPressed: () {
          if (mounted) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const ChallengeBuilderScreen(),
              ),
            );
          }
        },
        icon: Icons.add,
      ),
    );
  }

  Widget _buildBody() {
    return DoubleBackToCloseApp(
      snackBar:
          SnackBar(content: Text(AppLocalizations.of(context).homeAppExit)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HeroPercentageCard(resolvedPercentage: '32'),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ChallengeTile(
                        userChallenge: UserChallengeModel(
                          id: '',
                          creationDate: DateTime(2023, 3, 27, 17, 30),
                          name: 'No caffeine',
                          imageUrl: 'https://placeholder.pics/svg/1000',
                          startDate: DateTime(2023, 3, 28, 17, 30),
                          durationInDays: 7,
                          challengeDays: [
                            UserChallengeDayModel(
                              date: DateTime(2023, 3, 28),
                              isResolved: false,
                            ),
                            UserChallengeDayModel(
                              date: DateTime(2023, 3, 29),
                              isResolved: true,
                            ),
                            UserChallengeDayModel(
                              date: DateTime(2023, 3, 30),
                              isResolved: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GNav(
              tabActiveBorder:
                  Border.all(color: Theme.of(context).primaryColor, width: 1),
              duration: const Duration(milliseconds: 300),
              gap: 10,
              color: Theme.of(context).colorScheme.tertiary,
              activeColor: Theme.of(context).primaryColor,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.house,
                  text: AppLocalizations.of(context).navigationHome,
                ),
                GButton(
                  icon: FontAwesomeIcons.gear,
                  text: AppLocalizations.of(context).navigationSettings,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
