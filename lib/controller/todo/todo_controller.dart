import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final todoInput = TextEditingController(); // 투두
  final todoInfoInput = TextEditingController(); // 투두 설명

  Rx<DateTime> selectedDate = DateTime.now().obs; // 투두 날짜
  Rx<DateTime> TodoDate = DateTime.now().obs;

  RxBool RepeatEnabled = false.obs; // 반복
  void ChangeRepeatEnabled(RepeatEnabled) {
    RepeatEnabled!;
  }

  RxBool AlramEnabled = false.obs; // 알람
  void ChangeAlramEnabled(AlramEnabled) {
    AlramEnabled!;
  }
}

// ❓ 사용자 배정은 타입을 어떻게 해야할까