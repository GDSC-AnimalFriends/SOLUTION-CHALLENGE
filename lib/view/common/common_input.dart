import 'package:flutter/material.dart';

class CommonInput extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool needHideText;
  const CommonInput({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.needHideText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
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
