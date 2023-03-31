import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/home/todo_list_controller.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class TodoListView extends StatelessWidget {
  TodoListController todoListController;
  TodoListView({
    required this.todoListController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: todoListController.todos.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: swipeActionCell(
              todoListController.todos,
              index,
              todoListController,
            ),
          );
        },
      ),
    );
  }
}

Widget _getIconButton(color, icon) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: color,
    ),
    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}

Widget swipeActionCell(List<TodoModel> listToShow, int index,
    TodoListController todoListController) {
  return SwipeActionCell(
    key: ObjectKey(listToShow[index]),
    trailingActions: <SwipeAction>[
      SwipeAction(
        nestedAction: SwipeNestedAction(
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red,
            ),
            width: 130,
            height: 60,
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Text(
                    '할 일 제거',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
        color: Colors.transparent,
        content: _getIconButton(Colors.red, Icons.delete),
        onTap: (handler) async {
          todoListController.deleteTodo(index, todoListController.todos);
        },
      ),
      SwipeAction(
        content: _getIconButton(primaryColor, Icons.vertical_align_top),
        color: Colors.transparent,
        onTap: (handler) {},
      ),
    ],
    backgroundColor: Colors.transparent,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listToShow[index].title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              listToShow[index].title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.circle_outlined),
          color: primaryColor,
          iconSize: 50.0,
          onPressed: () {
            todoListController.checkToDone(index);
          },
        ),
      ]),
    ),
  );
}

class DoneListView extends StatelessWidget {
  TodoListController todoListController;
  DoneListView({
    required this.todoListController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: todoListController.done.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: doneSwipeActionCell(
              todoListController.done,
              index,
              todoListController,
            ),
          );
        },
      ),
    );
  }
}

Widget doneSwipeActionCell(List<TodoModel> listToShow, int index,
    TodoListController todoListController) {
  return SwipeActionCell(
    key: ObjectKey(listToShow[index]),
    trailingActions: <SwipeAction>[
      SwipeAction(
        nestedAction: SwipeNestedAction(
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red,
            ),
            width: 130,
            height: 60,
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Text(
                    '할 일 제거',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
        color: Colors.transparent,
        content: _getIconButton(Colors.red, Icons.delete),
        onTap: (handler) async {
          todoListController.deleteTodo(index, todoListController.done);
        },
      ),
      SwipeAction(
        content: _getIconButton(primaryColor, Icons.vertical_align_top),
        color: Colors.transparent,
        onTap: (handler) {},
      ),
    ],
    backgroundColor: Colors.transparent,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listToShow[index].title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              listToShow[index].description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.circle_outlined),
          color: primaryColor,
          iconSize: 50.0,
          onPressed: () {
            todoListController.checkToTodos(index);
          },
        ),
      ]),
    ),
  );
}
