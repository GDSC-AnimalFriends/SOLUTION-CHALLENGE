// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/todo/todo_controller.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:solution_challenge/view/todo/todo_alram_toggle_button.dart';
import 'package:solution_challenge/view/todo/todo_info_input.dart';
import 'package:solution_challenge/view/todo/todo_input.dart';

import '../common/appbar_with_bottom_line.dart';

class NewTodoPage extends GetView<TodoController> {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBottomLine(appBarTitle: '할일 추가하기'),
      body: SafeArea(
        child: ListView(
          children: [
            TodoInput(
              controller: controller.todoInput,
              hintText: '할 일을 입력하세요',
              inputType: TextInputType.text,
              enableBottomBorder: true,
            ),
            Container(
                padding: EdgeInsets.all(14),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: TodoBorder, width: 1),
                  ),
                ),
                child: Row(children: [
                  Obx(() => Text(
                      '${controller.selectedDate.value.year}. ${controller.selectedDate.value.month}. ${controller.selectedDate.value.day}'))
                ])),
            Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: TodoBorder,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Obx(() => controller.RepeatEnabled.value
                      ? Text('반복 : 있음')
                      : Text('반복 : 없음'))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: TodoBorder,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Obx(() => controller.RepeatEnabled.value
                      ? Text('누구의 할일 : 있음')
                      : Text('누구의 할일 : 없음'))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: TodoBorder, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Text('알림 : ${controller.AlramEnabled.value}')),
                    ],
                  ),
                  AlramToggleButton(),
                ],
              ),
            ),
            // TodoInfoInput(
            //   controller: controller.todoInfoInput,
            //   hintText: '할 일 설명을 입력하세요',
            //   inputType: TextInputType.text,
            //   enableBottomBorder: false,
            // ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: CommonButton(
                  buttonColor: primaryColor,
                  textColor: white,
                  buttonText: '완료하기',
                  onPressed: () {
                    controller.back();
                  },
                  enabled: true),
            )
          ],
        ),
      ),
    );
  }
}
