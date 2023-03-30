import 'package:debutapp/models/user_challenge_day_model.dart';
import 'package:debutapp/ui/widgets/styled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChallengeTileDay extends StatefulWidget {
  final UserChallengeDayModel challengeDay;

  const ChallengeTileDay({super.key, required this.challengeDay});

  @override
  State<ChallengeTileDay> createState() => _ChallengeTileDayState();
}

class _ChallengeTileDayState extends State<ChallengeTileDay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildIcon(),
    );
  }

  Widget _buildIcon() {
    final now = DateTime.now();
    if (widget.challengeDay.date.isBefore(now)) {
      return StyledIconButton(
        onPressed: () {},
        border: Border.all(
          width: _getBorderWidth(),
          color: _getBorderColor(),
        ),
        bgColor: _getBgColor(),
        icon: widget.challengeDay.isResolved!
            ? FontAwesomeIcons.check
            : FontAwesomeIcons.xmark,
        iconColor: _getFontColor(),
        iconSize: 12.5,
      );
    } else {
      return StyledIconButton(
        onPressed: () {},
        border: Border.all(
          width: _getBorderWidth(),
          color: _getBorderColor(),
        ),
        bgColor: _getBgColor(),
        iconColor: _getFontColor(),
        icon: _getWeekdayIcon(),
        iconSize: 12.5,
      );
    }
  }

  IconData _getWeekdayIcon() {
    switch (DateFormat('EEEE').format(widget.challengeDay.date)[0]) {
      case 'M':
        return FontAwesomeIcons.m;
      case 'T':
        return FontAwesomeIcons.t;
      case 'W':
        return FontAwesomeIcons.w;
      case 'F':
        return FontAwesomeIcons.f;
      case 'S':
        return FontAwesomeIcons.s;
      default:
        return FontAwesomeIcons.m;
    }
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

  double _getBorderWidth() {
    final now = DateTime.now();
    if (widget.challengeDay.date.year == now.year &&
        widget.challengeDay.date.month == now.month &&
        widget.challengeDay.date.day == now.day) {
      return 1.5;
    } else {
      return 1;
    }
  }

  Color _getFontColor() {
    final now = DateTime.now();
    if (widget.challengeDay.date.year == now.year &&
        widget.challengeDay.date.month == now.month &&
        widget.challengeDay.date.day == now.day) {
      return Theme.of(context).colorScheme.primary;
    } else if (widget.challengeDay.date.isBefore(now) &&
        widget.challengeDay.isResolved!) {
      return Theme.of(context).colorScheme.secondary;
    } else {
      return Theme.of(context).colorScheme.tertiary;
    }
  }
}
