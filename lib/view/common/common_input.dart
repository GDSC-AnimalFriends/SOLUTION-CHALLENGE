import 'package:flutter/material.dart';

class CommonInput extends StatelessWidget {
  final String hintText;
  final Color focusBorderColor;
  final bool needHideText;
  const CommonInput({
    super.key,
    required this.hintText,
    required this.focusBorderColor,
    required this.needHideText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: focusBorderColor),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: needHideText,
    );
  }
}
