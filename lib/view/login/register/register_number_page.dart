import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/common/common_input.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import '../../common/common_button.dart';
import 'register_base_widget.dart';

class RegisterNumberPage extends StatelessWidget {
  const RegisterNumberPage({super.key});

  void toNext() {
    Get.toNamed(Routes.REGISTER_COMPLETE);
  }

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      resizeBottom: true,
      widgetList: [
        Text(
          '휴대전화 번호를 알려주세요',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 50),
        const CommonInput(
          hintText: '( - ) 없이 입력하세요',
          inputType: TextInputType.phone,
          needHideText: false,
        ),
        const Spacer(),
        CommonButton(
          buttonColor: primaryColor,
          textColor: Colors.white,
          buttonText: '다음',
          onPressed: () => toNext(),
        ),
      ],
    );
    ;
  }
}
