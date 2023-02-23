// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/todo/todo_controller.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:solution_challenge/view/todo/todo_alram_toggle_button.dart';
import 'package:solution_challenge/view/todo/todo_input.dart';

import '../common/appbar_with_bottom_line.dart';
import '../theme/app_text_theme.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

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
                heightLimit: true,
                maxLine: 1,
                maxLength: 30),
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
                  Obx(() => Text(
                      '${controller.todoDate.value.year}. ${controller.todoDate.value.month}. ${controller.todoDate.value.day}')),
                  IconButton(
                    onPressed: () {
                      showCupertinoDialog(
                        barrierLabel: '날짜 선택 다이얼로그',
                        context: context,
                        barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.white,
                              height: 400,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                minimumDate: DateTime.now(),
                                onDateTimeChanged: (DateTime date) {
                                  controller.todoDate.value = date;
                                  print(
                                    '선택 날짜: ${controller.todoDate.value}',
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('반복 : '),
                      Obx(
                        () => controller.RepeatEnabled.value
                            ? Text('있음')
                            : Text('없음'),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showCupertinoDialog(
                        barrierLabel: '반복 선택 다이얼로그',
                        context: context,
                        barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                padding: EdgeInsets.all(14),
                                color: Colors.white,
                                width: double.infinity,
                                height: 400,
                                child: Text(
                                  '반복 선택하기',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      backgroundColor: null),
                                )),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('누구의 할일 : '),
                      Obx(
                        () => controller.RepeatEnabled.value
                            ? Text('있음')
                            : Text('없음'),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showCupertinoDialog(
                        barrierLabel: '할일 사용자 배정 다이얼로그',
                        context: context,
                        barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                padding: EdgeInsets.all(14),
                                color: Colors.white,
                                width: double.infinity,
                                height: 400,
                                child: Text(
                                  '할일 배정하기',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      backgroundColor: null),
                                )),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
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
            Expanded(
              child: TodoInput(
                controller: controller.todoInfoInput,
                hintText: '할 일 설명을 입력하세요',
                inputType: TextInputType.text,
                enableBottomBorder: false,
                heightLimit: false,
                maxLine: 7,
                maxLength: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: CommonButton(
                  buttonColor: primaryColor,
                  textColor: white,
                  buttonText: '완료하기',
                  onPressed: () {
                    controller.back();
                  },
                  enabled: true),
            ),
          ],
        ),
      ),
    );
  }
}
