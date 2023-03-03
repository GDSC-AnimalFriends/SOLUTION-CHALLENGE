import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubscribeAddController extends GetxController {
  final searchInput = TextEditingController();

  Rx<bool> buttonEnabled = false.obs;

  // 이메일 정규식
  void emailValidation(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      buttonEnabled.value = true;
    } else {
      buttonEnabled.value = false;
    }
  }

  void searchEmail() {}

  void onCancel() {}

  void onSubscribe() {}
}
