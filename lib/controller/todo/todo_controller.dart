import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final todoInput = TextEditingController(); // 투두
  final todoInfoInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜

  ///////////////// ▼ 반복

  RxBool RepeatEnabled = false.obs; // 반복 여부

  void RepeatEnable() {
    RepeatEnabled.value = true;
  }

  void RepeatDisable() {
    RepeatEnabled.value = false;
  }

  RxBool RepeatEveryWeek = false.obs; // 매주 반복
  RxBool RepeatEveryDay = false.obs; // 매일 반복

  RxBool RepeatMon = false.obs; // 월 반복
  RxBool RepeatTue = false.obs; // 화 반복
  RxBool RepeatWed = false.obs; // 수 반복
  RxBool RepeatThr = false.obs; // 목 반복
  RxBool RepeatFri = false.obs; // 금 반복
  RxBool RepeatSat = false.obs; // 토 반복
  RxBool RepeatSun = false.obs; // 일 반복

  ///////////////// ▼ 알람

  RxBool AlramEnabled = false.obs;

  void AlramEnable() {
    AlramEnabled.value = true;
  }

  void AlramDisable() {
    AlramEnabled.value = false;
  }
  ///////////////// ▼ 뒤로가기

  void back() {
    Get.back();
  }
}

// ❓ 사용자 배정은 타입을 어떻게 해야할까