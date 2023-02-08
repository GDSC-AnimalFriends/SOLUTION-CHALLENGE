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
          children: const [
            TypeButton(typeName: "보호자"),
            SizedBox(width: 10),
            TypeButton(typeName: "노인")
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

class TypeButton extends StatelessWidget {
  final String typeName;
  const TypeButton({
    super.key,
    required this.typeName,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100],
          ),
          child: Center(
            child: Text(
              typeName,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
