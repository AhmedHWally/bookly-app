import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({
    Key? key,
    required this.logoslidingAnimation,
  }) : super(key: key);

  final Animation<Offset> logoslidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: logoslidingAnimation,
        builder: (context, _) => SlideTransition(
            position: logoslidingAnimation,
            child: Image.asset(AssetsData.logo)));
  }
}
