import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/home/todo_list_controller.dart';
import 'package:solution_challenge/data/model/todo_model.dart';

class TodoListView extends StatelessWidget {
  List<TodoModel> listToShow;
  TodoListController todoListController;
  TodoListView({
    required this.listToShow,
    required this.todoListController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: listToShow.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: swipeActionCell(listToShow, index));
        },
      ),
    );
  }
}

Widget swipeActionCell(List<TodoModel> listToShow, int index) {
  return SwipeActionCell(
    key: ObjectKey(listToShow[index]),
    trailingActions: <SwipeAction>[
      SwipeAction(
          performsFirstActionWithFullSwipe: true,
          title: "delete",
          onTap: (CompletionHandler handler) async {
            listToShow.removeAt(index);
          },
          color: Colors.red),
    ],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        listToShow[index].title,
        style: const TextStyle(fontSize: 40),
      ),
    ),
  );
}
