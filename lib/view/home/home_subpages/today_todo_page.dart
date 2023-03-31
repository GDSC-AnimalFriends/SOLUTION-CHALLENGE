import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/home/todo_list_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solution_challenge/util/storage_util.dart';
import 'package:solution_challenge/view/common/todo_list_view.dart';

class TodayTodoPage extends StatelessWidget with StorageUtil {
  TodayTodoPage({super.key});
  final TodoListController todoListController = Get.put(TodoListController());
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 16.0,
                ),
                child: categoryText("남았어요"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TodoListView(
                todoListController: todoListController,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 16.0,
                ),
                child: categoryText("끝났어요"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DoneListView(
                todoListController: todoListController,
              ),
            ),
          ],
        ),
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
