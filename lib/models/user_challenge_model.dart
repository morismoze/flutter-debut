import 'package:debutapp/models/user_challenge_day_model.dart';

class UserChallengeModel {
  final String name;
  final String imageUrl;
  final DateTime? startDate;
  final int durationInDays;
  final List<UserChallengeDayModel>? challengeDays;

  UserChallengeModel({
    required this.name,
    required this.imageUrl,
    required this.durationInDays,
    this.startDate,
    this.challengeDays,
  });
}
