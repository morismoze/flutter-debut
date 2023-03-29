import 'package:debutapp/models/user_challenge_day_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChallengeTileDay extends StatefulWidget {
  final UserChallengeDayModel challengeDay;

  const ChallengeTileDay({super.key, required this.challengeDay});

  @override
  State<ChallengeTileDay> createState() => _ChallengeTileDayState();
}

class _ChallengeTileDayState extends State<ChallengeTileDay> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: _getBgColor(),
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: _getBorderColor(),
          ),
        ),
        child: Center(
          child: Text(
            DateFormat('EEEE').format(widget.challengeDay.date)[0],
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: _getFontColor()),
          ),
        ),
      ),
    );
  }

  Color _getBgColor() {
    switch (widget.challengeDay.isResolved) {
      case null:
      case false:
        return Colors.transparent;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  Color _getBorderColor() {
    final now = DateTime.now();
    if (widget.challengeDay.date.year == now.year &&
        widget.challengeDay.date.month == now.month &&
        widget.challengeDay.date.day == now.day) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.tertiary.withOpacity(0.3);
    }
  }

  Color _getFontColor() {
    final now = DateTime.now();
    if (widget.challengeDay.date.year == now.year &&
        widget.challengeDay.date.month == now.month &&
        widget.challengeDay.date.day == now.day) {
      return Theme.of(context).colorScheme.primary;
    } else if (widget.challengeDay.date.isBefore(now)) {
      return Colors.transparent;
    } else {
      return Theme.of(context).colorScheme.tertiary;
    }
  }
}
