import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.textslidingAnimation,
  }) : super(key: key);

  final Animation<Offset> textslidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textslidingAnimation,
      builder: (context, _) => SlideTransition(
        position: textslidingAnimation,
        child: const Text(
          'Where reading is amazing',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
