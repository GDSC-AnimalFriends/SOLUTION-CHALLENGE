import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/common/common_input.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import 'register_base_widget.dart';

class RegisterCompletePage extends StatelessWidget {
  const RegisterCompletePage({super.key});

  void complete() {
    // Get.toNamed(Routes.REGISTER_NUMBER);
    Get.snackbar("회원가입", "완료");
  }

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      resizeBottom: false,
      widgetList: [
        Text(
          '거의 다 끝났어요',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 50),
        const CommonInput(
          hintText: '이메일을 입력하세요',
          inputType: TextInputType.emailAddress,
          needHideText: false,
        ),
        const SizedBox(height: 20),
        const CommonInput(
          hintText: '비밀번호를 입력하세요',
          inputType: TextInputType.emailAddress,
          needHideText: true,
        ),
        const SizedBox(height: 6),
        const CommonInput(
          hintText: '다시 입력하세요',
          inputType: TextInputType.emailAddress,
          needHideText: true,
        ),
        const Spacer(),
        CommonButton(
          buttonColor: primaryColor,
          textColor: Colors.white,
          buttonText: '완료',
          onPressed: () => complete(),
        ),
      ],
    );
  }
}
