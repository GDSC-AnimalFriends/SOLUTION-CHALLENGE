import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import '../theme/app_text_theme.dart';

class TodoInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool enableBottomBorder;
  final int maxLine;
  final int maxLength;
  final bool heightLimit;
  const TodoInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    required this.enableBottomBorder,
    required this.maxLine,
    required this.maxLength,
    required this.heightLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      height: heightLimit ? 80 : null,
      decoration: BoxDecoration(
        border: enableBottomBorder
            ? Border(
                bottom: BorderSide(
                  color: TodoBorder,
                  width: 1,
                ),
              )
            : Border(),
      ),
      child: Center(
        child: TextField(
          maxLines: maxLine,
          // maxLength: maxLength,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none, // TextField 자체의 하단 선 제거
            hintText: hintText,
            labelStyle: TextStyle(
              fontSize: 10,
            ),
          ),
          keyboardType: inputType,
          autofocus: false,
        ),
      ),
    );
  }
}
