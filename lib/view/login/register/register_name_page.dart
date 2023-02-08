import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/common/common_input.dart';

import '../../common/common_button.dart';
import 'register_base_widget.dart';

class RegisterNamePage extends StatelessWidget {
  const RegisterNamePage({super.key});

  void toNext() {
    Get.toNamed(Routes.REGISTER_NUMBER);
  }

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      widgetList: [
        Text(
          '이름을 알려주세요',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 50),
        const CommonInput(
          hintText: '이름을 입력하세요',
          inputType: TextInputType.name,
          needHideText: false,
        ),
        const Spacer(),
        CommonButton(
          buttonColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          buttonText: '다음',
          onPressed: () => toNext(),
        ),
      ],
    );
    ;
  }
}
