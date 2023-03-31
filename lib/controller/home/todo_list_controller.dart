import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/service/todo_service.dart';
import 'package:solution_challenge/util/storage_util.dart';

import '../../util/const_key.dart';

class TodoListController extends GetxController with StorageUtil {
  List<TodoModel> todos = List<TodoModel>.empty(growable: true).obs;
  List<TodoModel> done = List<TodoModel>.empty(growable: true).obs;
  TextEditingController todoInput = TextEditingController();
  TextEditingController todoDescriptionInput = TextEditingController();
  Rx<DateTime> todoDate = DateTime.now().obs;

  @override
  void onInit() async {
    DataSnapshot dataSnapshot;

    dataSnapshot = await TodoService().readTodo(userId: getString(UID_KEY)!);
    if (dataSnapshot.exists) {
      Map<dynamic, dynamic> values =
          dataSnapshot.value as Map<Object?, Object?>;

      (values).forEach((key, value) {
        TodoModel convertedTodo = TodoModel(
          todoid: value["todoid"],
          date: DateTime.parse(value["date"].toString()),
          title: value["title"],
          user: value["user"],
          creator: value["creator"],
          description: value["description"],
          complete: value["complete"],
        );
        if (convertedTodo.complete) {
          done.add(convertedTodo);
        } else {
          todos.add(convertedTodo);
        }
      });
    }

    print(done.length);
    super.onInit();
  }

  TodoModel todo = TodoModel(
    todoid: "",
    date: DateTime.now(),
    title: "할 일",
    user: "userid",
    creator: "userid",
    description: "설명",
    complete: false,
  );

  void addTodo(TodoModel todo) {
    todos.add(todo);
    TodoService().addTodo(todo: todo);
  }

  void checkToDone(int index) {
    TodoModel updatedTodo = TodoModel(
      todoid: todos[index].todoid,
      date: todos[index].date,
      title: todos[index].title,
      user: todos[index].user,
      creator: todos[index].creator,
      description: todos[index].description,
      complete: true,
    );

    TodoService().addTodo(todo: updatedTodo);
    done.add(todos.removeAt(index));
    print(todos.length);
    print(done.length);
    refresh();
  }

  void checkToTodos(int index) {
    TodoModel updatedTodo = TodoModel(
      todoid: done[index].todoid,
      date: done[index].date,
      title: done[index].title,
      user: done[index].user,
      creator: done[index].creator,
      description: done[index].description,
      complete: false,
    );

    TodoService().addTodo(todo: updatedTodo);
    todos.add(done.removeAt(index));
    print(todos.length);
    print(done.length);
    refresh();
  }

  void deleteTodo(int index, List<TodoModel> todo) {
    TodoService().deleteTodo(
      todoid: todo[index].todoid,
      userid: getString(UID_KEY)!,
    );
    todo.removeAt(index);
    refresh();
  }

  void back() {
    Get.back();
  }
}
