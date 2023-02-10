import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../common/common_button.dart';
import '../common/common_input.dart';
import 'login_base.dart';

//로그인 페이지
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void login() {
    Get.toNamed(Routes.MYPAGE);
  }

  void toSignUp() {
    Get.toNamed(Routes.REGISTER_TYPE);
  }

  @override
  Widget build(BuildContext context) {
    return LoginBaseScreen(
      widgetList: [
        Text(
          '앱 네임',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          '소중한 사람, 확인해보세요',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 42),
        CommonInput(
          hintText: '이메일',
          focusBorderColor: Theme.of(context).primaryColor,
          needHideText: false,
        ),
        const SizedBox(height: 12),
        CommonInput(
          hintText: '비밀번호',
          focusBorderColor: Theme.of(context).primaryColor,
          needHideText: true,
        ),
        const SizedBox(height: 42),
        CommonButton(
          buttonColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          buttonText: '로그인',
          onPressed: () => login(),
        ),
        const SizedBox(height: 12),
        CommonButton(
          buttonColor: Colors.white,
          textColor: Theme.of(context).primaryColor,
          buttonText: '회원가입',
          onPressed: () => toSignUp(),
        ),
      ],
    );
  }
}
