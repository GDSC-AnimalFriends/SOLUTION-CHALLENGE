// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:solution_challenge/view/todo/todo_alram_toggle_button.dart';
import 'package:solution_challenge/view/todo/todo_input.dart';

import '../../controller/home/todo_list_controller.dart';
import '../common/appbar_with_bottom_line.dart';

class TodoPage extends GetView<TodoListController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TodoListController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBottomLine(appBarTitle: '할일 추가하기'),
      body: SafeArea(
        child: ListView(
          children: [
            _todoInput(),
            _datePick(context),
            _repeat(context),
            _assignUser(context),
            _alram(),
            _todoInfoInput(),
            _doneButton(),
          ],
        ),
      ),
    );
  }

  TodoInput _todoInput() {
    return TodoInput(
      controller: controller.todoInput,
      hintText: '할 일을 입력하세요',
      inputType: TextInputType.text,
      enableBottomBorder: true,
      heightLimit: true,
      maxLine: 1,
      maxLength: 30,
    );
  }

  Container _datePick(BuildContext context) {
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

  Container _repeat(BuildContext context) {
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
            children: [
              Text('반복 : '),
              Obx(
                () => controller.repeatEnabled.value ? Text('있음') : Text('없음'),
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => _TypeButton(
                              typeName: "반복",
                              selected: controller.repeatEnabled.value,
                              onPressed: () => controller.repeatCheck(),
                            ),
                          ),
                          SizedBox(width: 14),
                          Obx(
                            () => _TypeButton(
                              typeName: "미반복",
                              selected: !controller.repeatEnabled.value,
                              onPressed: () => controller.repeatCheck(),
                            ),
                          ),
                        ],
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

  Container _assignUser(BuildContext context) {
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
            children: [
              Text('누구의 할일 : '),
              Obx(
                () => controller.repeatEnabled.value ? Text('있음') : Text('없음'),
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
    );
  }

  Container _alram() {
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
          Row(
            children: [
              Obx(() => Text('알림 : ${controller.alramEnabled.value}')),
            ],
          ),
          AlramToggleButton(),
        ],
      ),
    );
  }

  Expanded _todoInfoInput() {
    return Expanded(
      child: TodoInput(
        controller: controller.todoDescriptionInput,
        hintText: '할 일 설명을 입력하세요',
        inputType: TextInputType.text,
        enableBottomBorder: false,
        heightLimit: false,
        maxLine: 7,
        maxLength: 100,
      ),
    );
  }

  Padding _doneButton() {
    TodoModel todo = TodoModel(
      todoid: DateTime.now().toString().replaceAll('.', '_'),
      alarmDate: DateTime(
        2023,
      ),
      date: DateTime(
        2023,
      ),
      title: "도트 찍기",
      repeatType: 1,
      repeat: [
        {"월": true},
      ],
      user: "nhg1113@icloud.com",
      creator: "NOGUEN",
      alarm: true,
      description: "고앵이 도트 찍기",
      complete: false,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      child: CommonButton(
          buttonColor: primaryColor,
          textColor: white,
          buttonText: '완료하기',
          onPressed: () {
            Get.find<TodoListController>().addTodo(todo);
            Get.back();
          },
          enabled: true),
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
