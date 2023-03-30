import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/service/todo_service.dart';
import 'package:solution_challenge/util/storage_util.dart';

class TodoListController extends GetxController with StorageUtil {
  List<TodoModel> todos = List<TodoModel>.empty(growable: true).obs;
  List<TodoModel> done = List<TodoModel>.empty(growable: true).obs;
  TextEditingController todoInput = TextEditingController(); // 투두 제목
  TextEditingController todoDescriptionInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜

  TodoModel todo = TodoModel(
    todoid: "",
    date: DateTime.now(),
    title: "할 일",
    user: "userid",
    creator: "userid",
    description: "설명",
    complete: false,
  );

  void readTodo(String userId) {
    TodoService().readTodo(userId: userId);
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
    TodoService().addTodo(todo: todo);
  }

  void checkToDone(int index) {
    done.add(todos.removeAt(index));
    refresh();
  }

  void checkToTodos(int index) {
    todos.add(done.removeAt(index));
    refresh();
  }

  void back() {
    Get.back();
  }
}
