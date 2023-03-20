import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';

import '../../../controller/home/todo_list_controller.dart';

class AllTodoPage extends StatelessWidget {
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
                Get.toNamed(Routes.TODO);
              },
              label: const Text('할 일 추가'),
              icon: const Icon(Icons.edit),
            ),
          )
        ],
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
