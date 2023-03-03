import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/todo/todo_controller.dart';

import '../theme/app_colors.dart';

const List<Widget> onOffList = <Widget>[
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
  @override
  Widget build(BuildContext context) {
    Get.put(TodoController());
    return GetBuilder<TodoController>(
        builder: (controller) => ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                  if (_isSelected[0] == true)
                    controller.AlramEnable();
                  else
                    controller.AlramDisable();
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              selectedColor: Colors.white,
              fillColor: primaryColor,
              color: primaryColor,
              isSelected: _isSelected,
              children: onOffList,
            ));
  }
}
