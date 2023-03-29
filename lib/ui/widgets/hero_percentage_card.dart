import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HeroPercentageCard extends StatefulWidget {
  final String resolvedPercentage;

  const HeroPercentageCard({super.key, required this.resolvedPercentage});

  @override
  State<HeroPercentageCard> createState() => _HeroPercentageCardState();
}

class _HeroPercentageCardState extends State<HeroPercentageCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildTextInfo(), _buildProgressIndicator()],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context).homeHeroTitle,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),),
        const SizedBox(height: 15),
        Text('1/3 ${AppLocalizations.of(context).homeHeroGoalInfo}',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),)
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return CircularPercentIndicator(
      radius: 50.0,
      circularStrokeCap: CircularStrokeCap.round,
      lineWidth: 12.5,
      percent: 0.32,
      center: RichText(
          text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
        children: <TextSpan>[
          TextSpan(text: widget.resolvedPercentage),
          const TextSpan(text: '%', style: TextStyle(fontSize: 14)),
        ],
      ),),
      progressColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
      animation: true,
    );
  }
}
