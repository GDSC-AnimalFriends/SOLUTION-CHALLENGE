import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/login/register/register_controller.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/common/common_input.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import '../../common/common_button.dart';
import 'register_base_widget.dart';

class RegisterNamePage extends GetView<RegisterController> {
  const RegisterNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      resizeBottom: true,
      widgetList: [
        Text(
          '이름을 알려주세요',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 50),
        CommonInput(
          controller: controller.nameController,
          validation: (value) => controller.nameValidation(value),
          hintText: '이름을 입력하세요',
          inputType: TextInputType.name,
          needHideText: false,
        ),
        const Spacer(),
        Obx(
          () {
            return CommonButton(
              buttonColor: primaryColor,
              textColor: Colors.white,
              buttonText: '다음',
              onPressed: () =>
                  controller.registerPageChange(Routes.REGISTER_NUMBER),
              enabled: controller.nameEnabled.value,
            );
          },
        ),
      ],
    );
    ;
  }
}
