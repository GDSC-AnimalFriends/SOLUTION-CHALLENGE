import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final todoInput = TextEditingController(); // 투두

  final todoInfoInput = TextEditingController(); // 투두 설명

  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜

  RxBool RepeatEnabled = false.obs; // 반복

  void RepeatEnableChange() {
    RepeatEnabled.value = !RepeatEnabled.value;
  }

  RxBool AlramEnabled = false.obs; // 알람

  void AlramEnable() {
    AlramEnabled.value = true;
  }

  void AlramDisable() {
    AlramEnabled.value = false;
  }

  void back() {
    Get.back();
  }
}

// ❓ 사용자 배정은 타입을 어떻게 해야할까