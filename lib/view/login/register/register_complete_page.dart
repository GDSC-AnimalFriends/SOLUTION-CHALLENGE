import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/login/register/register_controller.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/common/common_input.dart';
import 'package:solution_challenge/view/common/visible_control_text.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import 'register_base_widget.dart';

class RegisterCompletePage extends GetView<RegisterController> {
  const RegisterCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      resizeBottom: false,
      widgetList: [
        Text(
          '거의 다 끝났어요',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 50),
        CommonInput(
          controller: controller.emailController,
          validation: (value) => controller.emailValidation(value),
          hintText: '이메일을 입력하세요',
          inputType: TextInputType.emailAddress,
          needHideText: false,
        ),
        Obx(() => VisibleControlText(
              visible: controller.registerResult.value == FAIL_SECOND,
              text: "이미 가입된 이메일입니다",
            )),
        const SizedBox(height: 20),
        CommonInput(
          controller: controller.passwordController,
          validation: (value) => controller.setPassword(value),
          hintText: '6자 이상 비밀번호를 입력하세요',
          inputType: TextInputType.text,
          needHideText: true,
        ),
        const SizedBox(height: 6),
        CommonInput(
          controller: controller.rePasswordController,
          validation: (value) => controller.passwordValidation(value),
          hintText: '다시 입력하세요',
          inputType: TextInputType.text,
          needHideText: true,
        ),
        Obx(() => VisibleControlText(
              visible: controller.registerResult.value == FAIL_ONE,
              text: "6자 이상 비밀번호가 필요합니다",
            )),
      ],
      bottomSheet: Obx(
        () => CommonButton(
          buttonColor: primaryColor,
          textColor: Colors.white,
          buttonText: '완료',
          onPressed: () => controller.registerComplete(),
          enabled:
              controller.emailEnabled.value && controller.passwordEnabled.value,
        ),
      ),
    );
  }
}
