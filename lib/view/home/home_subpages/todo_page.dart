// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import '../../../controller/home/todo_list_controller.dart';
import '../../common/appbar_with_bottom_line.dart';

class TodoPage extends StatelessWidget with StorageUtil {
  TodoListController todoListController = Get.put(TodoListController()).obs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBottomLine(appBarTitle: '할일 추가하기'),
      body: SafeArea(
        child: ListView(
          children: [
            _todoInput(todoListController),
            _datePick(context, todoListController),
            _assignUser(context, todoListController),
            _todoInfoInput(todoListController),
            _doneButton(todoListController),
          ],
        ),
      ),
    );
  }

  TodoInput _todoInput(TodoListController todoListController) {
    return TodoInput(
      controller: todoListController.todoInput,
      hintText: '할 일을 입력하세요',
      inputType: TextInputType.text,
      enableBottomBorder: true,
      heightLimit: true,
      maxLine: 1,
      maxLength: 30,
    );
  }

  Container _datePick(
      BuildContext context, TodoListController todoListController) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: todoBorder, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Text(
              '${todoListController.todoDate.value.year}. ${todoListController.todoDate.value.month}. ${todoListController.todoDate.value.day}')),
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
                          todoListController.todoDate.value = date;
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
    );
  }

  Container _assignUser(
      BuildContext context, TodoListController todoListController) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: todoBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text('누구의 할일 : '),
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
    );
  }

  TodoInput _todoInfoInput(TodoListController todoListController) {
    return TodoInput(
      controller: todoListController.todoDescriptionInput,
      hintText: '할 일 설명을 입력하세요',
      inputType: TextInputType.text,
      enableBottomBorder: false,
      heightLimit: false,
      maxLine: 7,
      maxLength: 100,
    );
  }

  Padding _doneButton(TodoListController todoListController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      child: CommonButton(
          buttonColor: primaryColor,
          textColor: white,
          buttonText: '완료하기',
          onPressed: () {
            TodoModel todo = TodoModel(
              todoid: DateTime.now().toString().replaceAll('.', '_'),
              date: todoListController.todoDate.value,
              title: todoListController.todoInput.text,
              user: getString(UID_KEY)!,
              creator: getString(UID_KEY)!,
              description: todoListController.todoDescriptionInput.text,
              complete: false,
            );
            Get.find<TodoListController>().addTodo(todo);
            Get.back();
          },
          enabled: true),
    );
  }
}

class TodoInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool enableBottomBorder;
  final int maxLine;
  final int maxLength;
  final bool heightLimit;

  const TodoInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    required this.enableBottomBorder,
    required this.maxLine,
    required this.maxLength,
    required this.heightLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      height: heightLimit ? 80 : null,
      decoration: BoxDecoration(
        border: enableBottomBorder
            ? const Border(
                bottom: BorderSide(
                  color: todoBorder,
                  width: 1,
                ),
              )
            : const Border(),
      ),
      child: Center(
        child: TextField(
          maxLines: maxLine,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none, // TextField 자체의 하단 선 제거
            hintText: hintText,
            labelStyle: const TextStyle(
              fontSize: 10,
            ),
          ),
          keyboardType: inputType,
          autofocus: false,
        ),
      ),
    );
  }
}
