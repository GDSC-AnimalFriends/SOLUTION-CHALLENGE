import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import 'register_base_widget.dart';

class RegisterTypePage extends StatelessWidget {
  const RegisterTypePage({super.key});

  void toNext() {
    Get.toNamed(Routes.REGISTER_NAME);
  }

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      resizeBottom: true,
      widgetList: [
        Text(
          '어떻게 오셨나요?',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.grey,
                height: 170,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.grey,
                height: 170,
              ),
            ),
          ],
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
  }
}
