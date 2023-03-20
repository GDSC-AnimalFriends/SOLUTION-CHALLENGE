import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/todo_model.dart';

class TodoController extends GetxController {
  final todoInput = TextEditingController(); // 투두
  final todoDescriptionInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜
  RxBool repeatEnabled = false.obs; // 반복 여부
  RxBool repeatEveryWeek = false.obs; // 매주 반복
  RxBool repeatEveryDay = false.obs;
  RxBool alramEnabled = false.obs; // 알람 여부
  TodoModel todo = TodoModel(
    todoid: "",
    date: DateTime.now(),
    title: "할 일",
    repeat: List.empty(),
    user: "userid",
    creator: "userid",
    alarm: false,
    description: "설명",
    complete: false,
  );

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
    alramEnabled.value ? alramEnabled.value = false : alramEnabled.value = true;
  }

  void back() {
    Get.back();
  }
}

// ❓ 사용자 배정은 타입을 어떻게 해야할까