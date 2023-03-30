import 'package:debutapp/models/user_challenge_day_model.dart';

class UserChallengeModel {
  final String id;
  final DateTime creationDate;
  final String name;
  final String imageUrl;
  final DateTime? startDate;
  final int durationInDays;
  final List<UserChallengeDayModel>? challengeDays;

  UserChallengeModel({
    required this.id,
    required this.creationDate,
    required this.name,
    required this.imageUrl,
    required this.durationInDays,
    this.startDate,
    this.challengeDays,
  });
}
