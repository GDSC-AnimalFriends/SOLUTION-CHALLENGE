import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/home/todo_list_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solution_challenge/service/todo_service.dart';
import '../../../data/model/todo_model.dart';

class TodayTodoPage extends StatelessWidget {
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
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: categoryText("남았어요"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: todoListView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: categoryText("끝났어요"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: doneListView(),
            ),
            testButton(),
          ],
        ),
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
                todoListController.done[index].title,
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

  Widget testButton() {
    return FloatingActionButton(onPressed: () {
      TodoModel todo = TodoModel(
        todoid: DateTime.now().toString().replaceAll('.', '_'),
        alarmDate: DateTime(2023),
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
      TodoService().addTodo(todo: todo, username: "noguen");
    });
  }
}
