import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/todo/todo_controller.dart';

import '../theme/app_colors.dart';

const List<Widget> state = <Widget>[
  // 알림
  Text('ON'),
  Text('OFF'),
];

class AlramToggleButton extends StatefulWidget {
  const AlramToggleButton({super.key});

  @override
  State<AlramToggleButton> createState() => _AlramToggleButtonState();
}

class _AlramToggleButtonState extends State<AlramToggleButton> {
  final List<bool> _isSelected = <bool>[false, true];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    Get.put(TodoController());
    return GetBuilder<TodoController>(
        builder: (controller) => ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                  if (_isSelected[0] == true) {
                    controller.AlramEnabled = true.obs;
                    print('알람 상태: ${controller.AlramEnabled}');
                  } else {
                    controller.AlramEnabled = false.obs;
                    print('알람 상태: ${controller.AlramEnabled}');
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: primaryColor,
              color: primaryColor,
              isSelected: _isSelected,
              children: state,
            ));
  }
}
