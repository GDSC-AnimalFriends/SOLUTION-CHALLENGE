import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/data/provider/firebase_client.dart';
import 'package:solution_challenge/service/todo_service.dart';

class TodoListController extends GetxController {
  List<TodoModel> todos = List<TodoModel>.empty(growable: true).obs;
  List<TodoModel> done = List<TodoModel>.empty(growable: true).obs;
  TextEditingController todoInput = TextEditingController(); // 투두 제목
  TextEditingController todoDescriptionInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜
  Rx<DateTime> alarmDate = DateTime.now().obs; // 알람 날짜
  RxBool alarmEnabled = false.obs; // 알람 여부
  RxBool weekRepeatEnabled = false.obs; // 반복 여부
  RxBool dayRepeatEnabled = false.obs; // 반복 여부
  RxInt repeatWeekRate = 0.obs; // 주 단위 반복 여부
  RxInt repeatDayRate = 0.obs; // 일 단위 반복 여부
  List<Map<String, bool>> repeat = <Map<String, bool>>[
    {"MON": false},
    {"TUE": false},
    {"WED": false},
    {"THU": false},
    {"FRI": false},
    {"SAT": false},
    {"SON": false},
  ]; // 주 반복 단위

  TodoModel todo = TodoModel(
    todoid: "",
    date: DateTime.now(),
    alarmDate: DateTime.now(),
    title: "할 일",
    dayRepeat: 0,
    weekRepeat: 0,
    repeat: List.empty(),
    user: "userid",
    creator: "userid",
    alarm: false,
    description: "설명",
    complete: false,
  );

  void readTodo(String userId) {
    //TodoService().readTodo(userId: userId);
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
    TodoService().addTodo(todo: todo, userid: 'noguen');
  }

  void checkToDone(int index) {
    done.add(todos.removeAt(index));
    refresh();
  }

  void checkToTodos(int index) {
    todos.add(done.removeAt(index));
    refresh();
  }

  void weekRepeatCheck() {
    weekRepeatEnabled.value
        ? weekRepeatEnabled.value = false
        : weekRepeatEnabled.value = true;
  }

  void dayRepeatCheck() {
    dayRepeatEnabled.value
        ? dayRepeatEnabled.value = false
        : dayRepeatEnabled.value = true;
  }

  void alramCheck() {
    alarmEnabled.value ? alarmEnabled.value = false : alarmEnabled.value = true;
  }

  void back() {
    Get.back();
  }

  @override
  void onInit() {
    FirebaseClient().getMyAlarmList();
    super.onInit();
  }
}
