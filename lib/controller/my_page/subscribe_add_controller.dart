import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_client.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';

class SubscribeAddController extends GetxController {
  FirebaseClient client = FirebaseClient();
  final searchInput = TextEditingController();
  UserModel? resultUser;

  Rx<bool> buttonEnabled = false.obs;
  RxBool userSearch = false.obs;
  RxBool searchResult = false.obs;

  // 이메일 정규식
  void emailValidation(String value) {
    if (value.isEmpty) {
      buttonEnabled.value = false;
      userSearch.value = false;
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      buttonEnabled.value = true;
    } else {
      buttonEnabled.value = false;
    }
  }

  // 이메일로 검색
  void searchEmail() async {
    resultUser = null;
    final resultCode = await client.searchUser(searchInput.text);
    if (resultCode == SUCCESS) {
      resultUser = client.searchedUser;
    } else if (resultCode == FAIL_ONE) {
      return;
    }
    userSearch.value = true;
    if (resultUser != null) {
      searchResult.value = true;
    } else {
      searchResult.value = false;
    }
  }

  // 취소
  void onCancel() {
    buttonEnabled.value = false;
    userSearch.value = false;
    searchInput.text = "";
  }

  // 구독하기
  void onSubscribe() async {
    int resultCode = await client.sendSubscribeAlarm(resultUser!.id!);
    switch (resultCode) {
      case SUCCESS:
        Get.snackbar("알림", "상대방에게 구독요청을 전송했어요");
        break;
      case FAIL_ONE:
        Get.snackbar("알림", "이미 구독중인 유저에요");
        break;
      case FAIL_SECOND:
        Get.snackbar("알림", "이미 구독요청을 보냈어요");
        break;
      default:
        Get.snackbar("에러", "구독요청 전송에 실패했어요");
    }
    buttonEnabled.value = false;
    userSearch.value = false;
    searchInput.text = "";
  }
}
