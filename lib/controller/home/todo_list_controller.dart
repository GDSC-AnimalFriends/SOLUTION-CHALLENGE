import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/service/todo_service.dart';

class TodoListController extends GetxController {
  List<TodoModel> todos = List<TodoModel>.empty(growable: true).obs;
  List<TodoModel> done = List<TodoModel>.empty(growable: true).obs;
  final todoInput = TextEditingController(); // 투두
  final todoDescriptionInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜
  Rx<DateTime> alarmDate = DateTime.now().obs; // 알람 날짜
  RxBool alarmEnabled = false.obs; // 알람 여부
  RxBool repeatEnabled = false.obs; // 반복 여부
  RxBool repeatEveryWeek = false.obs; // 매주 반복
  RxBool repeatEveryDay = false.obs; //매일 반복

  TodoModel todo = TodoModel(
    todoid: "",
    date: DateTime.now(),
    alarmDate: DateTime.now(),
    title: "할 일",
    repeatType: 0,
    repeat: List.empty(),
    user: "userid",
    creator: "userid",
    alarm: false,
    description: "설명",
    complete: false,
  );

  void addTodo(TodoModel todo) {
    todos.add(todo);
    TodoService().addTodo(todo: todo, username: 'noguen');
  }

  void checkToDone(int index) {
    done.add(todos.removeAt(index));
    refresh();
  }

  void checkToTodos(int index) {
    todos.add(done.removeAt(index));
    refresh();
  }

  void repeatCheck() {
    repeatEnabled.value
        ? repeatEnabled.value = false
        : repeatEnabled.value = true;
  }

  List<RxBool> weekSelected = <RxBool>[
    false.obs, // 월
    false.obs, // 화
    false.obs, // 수
    false.obs, // 목
    false.obs, // 금
    false.obs, // 토
    false.obs, // 일
  ];

  void alramCheck() {
    alarmEnabled.value ? alarmEnabled.value = false : alarmEnabled.value = true;
  }

  void back() {
    Get.back();
  }
}
