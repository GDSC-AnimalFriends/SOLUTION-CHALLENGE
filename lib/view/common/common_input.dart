import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class CommonInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool needHideText;
  const CommonInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    required this.needHideText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      keyboardType: inputType,
      obscureText: needHideText,
    );
  }
}
