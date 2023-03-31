import 'package:debutapp/models/user_challenge_day_model.dart';
import 'package:debutapp/models/user_challenge_model.dart';
import 'package:debutapp/ui/widgets/challenge/challenge_tile_day.dart';
import 'package:debutapp/ui/widgets/challenge/challenge_tile_image.dart';
import 'package:flutter/material.dart';

class ChallengeTile extends StatelessWidget {
  final UserChallengeModel userChallenge;

  const ChallengeTile({super.key, required this.userChallenge});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTileHeader(context),
          const SizedBox(height: 15.0),
          _buildTileBody()
        ],
      ),
    );
  }

  Widget _buildTileHeader(BuildContext context) {
    return Row(
      children: [
        ChallengeTileImage(url: userChallenge.imageUrl),
        const SizedBox(width: 20.0),
        Text(
          userChallenge.name,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  Widget _buildTileBody() {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: userChallenge.durationInDays,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ChallengeTileDay(
              challengeDay: UserChallengeDayModel(
                date: DateUtils.dateOnly(
                  userChallenge.startDate!.add(Duration(days: index)),
                ),
                isResolved: index > userChallenge.challengeDays!.length - 1
                    ? null
                    : userChallenge.challengeDays![index].isResolved,
              ),
            ),
          );
        },
      ),
    );
  }
}
