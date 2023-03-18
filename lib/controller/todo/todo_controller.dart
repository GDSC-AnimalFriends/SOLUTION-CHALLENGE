import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  ///////////////// ▼ 투두 관련 ▼

  final todoInput = TextEditingController(); // 투두
  final todoInfoInput = TextEditingController(); // 투두 설명
  Rx<DateTime> todoDate = DateTime.now().obs; // 투두 날짜

  ///////////////// ▼ 반복 ▼

  RxBool repeatEnabled = false.obs; // 반복 여부

  void repeatEnable() {
    // 반복 ON
    repeatEnabled.value = true;
  }

  void repeatDisable() {
    // 반복 OFF
    repeatEnabled.value = false;
  }

  RxBool repeatEveryWeek = false.obs; // 매주 반복
  RxBool repeatEveryDay = false.obs; // 매일 반복

  List<RxBool> weekSelected = <RxBool>[
    false.obs, // 월
    false.obs, // 화
    false.obs, // 수
    false.obs, // 목
    false.obs, // 금
    false.obs, // 토
    false.obs, // 일
  ];

  ///////////////// ▼ 알람 ▼

  RxBool alramEnabled = false.obs; // 알람 여부

  void alramEnable() {
    // 알람 ON
    alramEnabled.value = true;
  }

  void alramDisable() {
    // 알람 OFF
    alramEnabled.value = false;
  }
  ///////////////// ▼ 뒤로가기 ▼

  void back() {
    Get.back();
  }
}

// ❓ 사용자 배정은 타입을 어떻게 해야할까