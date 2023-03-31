import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:debutapp/ui/widgets/styled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengeBuilderScreen extends StatefulWidget {
  const ChallengeBuilderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChallengeBuilderScreenState();
}

class _ChallengeBuilderScreenState extends State<ChallengeBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 11.5),
        child: StyledIconButton(
          icon: FontAwesomeIcons.arrowLeft,
          iconSize: 20,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      titleSpacing: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 25.0),
          _buildCategories()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context).challengeBuilderHeroHeadline,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              AppLocalizations.of(context).challengeBuilderHeroBody,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    List<String> categories =
        AppLocalizations.of(context).challengeBuilderCategoriesList.split(':');

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context).challengeBuilderCategoriesTitle,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: StyledIconButton(
                    onPressed: () {},
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.3),
                    ),
                    icon: Icons.abc_outlined,
                    iconSize: 70,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
