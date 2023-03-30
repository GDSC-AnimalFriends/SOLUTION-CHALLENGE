import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/util/storage_util.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

import '../../../controller/home/todo_list_controller.dart';
import '../../../data/model/todo_model.dart';
import '../../../util/const_key.dart';
import '../../common/common_button.dart';
import '../../common/todo_input.dart';
import '../../theme/app_colors.dart';

class AllTodoPage extends StatelessWidget with StorageUtil {
  AllTodoPage({super.key});
  final TodoListController todoListController = Get.put(TodoListController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          Column(
            children: [
              todoListView(),
              doneListView(),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 5,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 112, 125, 241),
              onPressed: () {
                Get.bottomSheet(
                  Column(
                    children: [
                      _todoInput(todoListController),
                      _datePick(context, todoListController),
                      _assignUser(context, todoListController),
                      _todoInfoInput(todoListController),
                      _doneButton(
                        todoListController,
                      )
                    ],
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enableDrag: true,
                );
              },
              label: const Text('할 일 추가'),
              icon: const Icon(Icons.edit),
            ),
          )
        ],
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
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      height: 75,
      decoration: const BoxDecoration(
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
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Container _assignUser(
      BuildContext context, TodoListController todoListController) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      height: 75,
      decoration: const BoxDecoration(
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
              //   showCupertinoDialog(
              //     barrierLabel: '할일 사용자 배정 다이얼로그',
              //     context: context,
              //     barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
              //     builder: (BuildContext context) {
              //       return Container(
              //           padding: const EdgeInsets.all(14),
              //           color: Colors.white,
              //           width: double.infinity,
              //           height: 400,
              //           child: const Text(
              //             '할일 배정하기',
              //             style: TextStyle(
              //                 fontSize: 30,
              //                 color: Colors.black,
              //                 backgroundColor: null),
              //           ));
              //     },
              //   );
              Get.bottomSheet(
                Column(
                  children: const [
                    SizedBox(height: 5),
                    Text('할 일 배정하기', style: common22),
                    Text('아래로 구독자? 또는 부양자 목록을 불러옵니다', style: common22),
                  ],
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                enableDrag: true,
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Widget _todoInfoInput(TodoListController todoListController) {
    return SizedBox(
      height: 96.7,
      child: TodoInput(
        controller: todoListController.todoDescriptionInput,
        hintText: '할 일 설명을 입력하세요',
        inputType: TextInputType.text,
        enableBottomBorder: true,
        heightLimit: true,
        maxLine: 7,
        maxLength: 100,
      ),
    );
  }

  Widget _doneButton(TodoListController todoListController) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
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
      ),
    );
  }

  Widget todoListView() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: todoListController.todos.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Text(
                todoListController.todos[index].title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                todoListController.todos[index].description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: const Icon(
                Icons.circle_outlined,
                color: Color.fromARGB(255, 112, 125, 241),
                size: 50.0,
              ),
              onTap: () {
                todoListController.checkToDone(index);
                todoListController.update();
              },
            ),
          );
        },
      ),
    );
  }

  Widget doneListView() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: todoListController.done.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Text(
                todoListController.done[index].title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 210, 210, 210),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              subtitle: Text(
                todoListController.done[index].description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 210, 210, 210),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              onTap: () {
                todoListController.checkToTodos(index);
                todoListController.update();
              },
            ),
          );
        },
      ),
    );
  }

  Widget categoryText(text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 112, 125, 241),
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }
}
