import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class CommonButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final GestureTapCallback onPressed;
  final bool enabled;
  const CommonButton(
      {super.key,
      required this.buttonColor,
      required this.textColor,
      required this.buttonText,
      required this.onPressed,
      required this.enabled});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: enabled ? buttonColor : buttonDisabled,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
