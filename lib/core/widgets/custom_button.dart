import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.radius,
    required this.backGroundColor,
    required this.textBody,
    required this.textStyle,
    this.onPressed,
  });
  final BorderRadius? radius;
  final Color backGroundColor;
  final String textBody;
  final TextStyle textStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: radius ?? BorderRadius.circular(12)),
            backgroundColor: backGroundColor),
        child: Text(
          textBody,
          style: textStyle,
        ),
      ),
    );
  }
}
