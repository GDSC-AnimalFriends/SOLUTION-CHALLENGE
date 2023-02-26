import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  ///////////////// ▼ 투두 관련 ▼

  final todoInput = TextEditingController(); // 투두
  final todoInfoInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜

  ///////////////// ▼ 반복 ▼

  RxBool RepeatEnabled = false.obs; // 반복 여부

  void RepeatEnable() {
    // 반복 ON
    RepeatEnabled.value = true;
  }

  void RepeatDisable() {
    // 반복 OFF
    RepeatEnabled.value = false;
  }

  RxBool RepeatEveryWeek = false.obs; // 매주 반복
  RxBool RepeatEveryDay = false.obs; // 매일 반복

  List<RxBool> WeekSelected = <RxBool>[
    false.obs, // 월
    false.obs, // 화
    false.obs, // 수
    false.obs, // 목
    false.obs, // 금
    false.obs, // 토
    false.obs, // 일
  ];

  ///////////////// ▼ 알람 ▼

  RxBool AlramEnabled = false.obs; // 알람 여부

  void AlramEnable() {
    // 알람 ON
    AlramEnabled.value = true;
  }

  void AlramDisable() {
    // 알람 OFF
    AlramEnabled.value = false;
  }
  ///////////////// ▼ 뒤로가기 ▼

  void back() {
    Get.back();
  }
}

// ❓ 사용자 배정은 타입을 어떻게 해야할까