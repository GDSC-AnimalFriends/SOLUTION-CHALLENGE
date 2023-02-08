import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final GestureTapCallback onPressed;
  const CommonButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: buttonColor,
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
