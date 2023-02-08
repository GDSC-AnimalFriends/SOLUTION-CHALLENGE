import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import '../../routes/app_pages.dart';
import '../common/common_button.dart';
import '../common/common_input.dart';
import 'login_base_widget.dart';

//로그인 페이지
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void login() {}

  void toSignUp() {
    Get.toNamed(Routes.REGISTER_TYPE);
  }

  @override
  Widget build(BuildContext context) {
    return LoginBaseWidget(
      widgetList: [
        Text(
          '앱 네임',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          '소중한 사람, 확인해보세요',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 42),
        const CommonInput(
          hintText: '이메일',
          inputType: TextInputType.emailAddress,
          needHideText: false,
        ),
        const SizedBox(height: 12),
        const CommonInput(
          hintText: '비밀번호',
          inputType: TextInputType.text,
          needHideText: true,
        ),
        const SizedBox(height: 42),
        CommonButton(
          buttonColor: primaryColor,
          textColor: Colors.white,
          buttonText: '로그인',
          onPressed: () => login(),
        ),
        const SizedBox(height: 12),
        CommonButton(
          buttonColor: Colors.white,
          textColor: primaryColor,
          buttonText: '회원가입',
          onPressed: () => toSignUp(),
        ),
      ],
    );
  }
}
