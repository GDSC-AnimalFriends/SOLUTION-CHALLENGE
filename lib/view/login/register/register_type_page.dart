import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/login/register/register_controller.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import 'register_base_widget.dart';

class RegisterTypePage extends GetView<RegisterController> {
  const RegisterTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterBaseWidget(
      resizeBottom: true,
      widgetList: [
        Text(
          '어떻게 오셨나요?',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Obx(
              () => _TypeButton(
                typeName: "보호자",
                selected: !controller.typeSelected.value,
                onPressed: () => controller.changeType(),
              ),
            ),
            const SizedBox(width: 10),
            Obx(
              () => _TypeButton(
                typeName: "노인",
                selected: controller.typeSelected.value,
                onPressed: () => controller.changeType(),
              ),
            ),
          ],
        ),
      ],
      bottomSheet: CommonButton(
        buttonColor: primaryColor,
        textColor: Colors.white,
        buttonText: '다음',
        onPressed: () => controller.registerPageChange(Routes.REGISTER_NAME),
        enabled: true,
      ),
    );
  }
}

class _TypeButton extends StatelessWidget {
  final String typeName;
  final bool selected;
  final GestureTapCallback onPressed;
  const _TypeButton(
      {required this.typeName,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: selected ? primaryColor : Colors.grey[100],
          ),
          child: Center(
            child: Text(
              typeName,
              style: selected
                  ? const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w500, color: white)
                  : Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
      ),
    );
  }
}
