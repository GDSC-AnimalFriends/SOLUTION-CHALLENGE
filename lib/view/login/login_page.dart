import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

//예시용 페이지입니다
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "로그인페이지",
            style: inputHintStyle,
          ),
        ),
      ),
    );
  }
}
