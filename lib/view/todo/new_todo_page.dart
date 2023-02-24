// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/todo/todo_controller.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:solution_challenge/view/todo/todo_alram_toggle_button.dart';
import 'package:solution_challenge/view/todo/todo_input.dart';

import '../common/appbar_with_bottom_line.dart';
import '../common/common_input.dart';

class NewTodoPage extends GetView<TodoController> {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWithBottomLine(appBarTitle: '할일 추가하기'),
        body: SafeArea(
          child: Column(
            children: [
              TodoInput(
                controller: controller.todoInput,
                hintText: '할 일을 입력하세요',
                inputType: TextInputType.text,
                enableBottomBorder: true,
              ),
              Container(
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
                child: Center(
                  child: Text('알람 테스트: ${controller.AlramEnabled}'),
                ),
              ),
              AlramToggleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
