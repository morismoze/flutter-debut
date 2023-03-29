import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChallengeTileImage extends StatelessWidget {
  final String url;
  final String? semanticsLabel;

  const ChallengeTileImage({super.key, required this.url, this.semanticsLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SvgPicture.network(
        fit: BoxFit.cover,
        url,
        semanticsLabel: semanticsLabel,
        placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(20.0),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
