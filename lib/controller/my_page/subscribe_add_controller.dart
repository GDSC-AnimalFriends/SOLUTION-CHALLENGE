import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_client.dart';

class SubscribeAddController extends GetxController {
  FirebaseClient client = FirebaseClient();
  final searchInput = TextEditingController();
  UserModel? resultUser;

  Rx<bool> buttonEnabled = false.obs;
  RxBool userSearch = false.obs;
  RxBool searchResult = false.obs;

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

  void searchEmail() async {
    resultUser = await client.searchUser(searchInput.text);
    userSearch.value = true;
    if (resultUser != null) {
      searchResult.value = true;
    } else {
      searchResult.value = false;
    }
  }

  void onCancel() {
    userSearch.value = false;
    searchInput.text = "";
  }

  void onSubscribe() {
    userSearch.value = false;
    searchInput.text = "";
    //구독 로직 필요
  }
}
