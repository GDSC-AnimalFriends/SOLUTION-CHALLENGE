import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

//예시 위젯입니다. 공통으로 쓰이는 버튼, 입력창 등을 각각 만들어주세요
class MainButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  final Color borderColor;
  const MainButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed,
      this.borderColor = black});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: borderColor,
      onPressed: () => onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
