import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/service/auth_service.dart';
import 'package:solution_challenge/util/const_key.dart';

class RegisterController extends GetxController {
  AuthService authService = AuthService();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  Rx<bool> typeSelected = false.obs;
  Rx<bool> nameEnabled = false.obs;
  Rx<bool> phoneEnabled = false.obs;
  Rx<bool> emailEnabled = false.obs;
  Rx<String> password = "".obs;
  Rx<bool> passwordEnabled = false.obs;

  RxInt registerResult = 9.obs;

  //타입을 변경해요
  void changeType() {
    typeSelected.value = !typeSelected.value;
  }

  // 이름 정규식 : 2글자 이상 입력
  void nameValidation(String value) {
    if (value.length > 1) {
      nameEnabled.value = true;
    } else {
      nameEnabled.value = false;
    }
  }

  // 전화번호 정규식
  void phoneValidation(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isNotEmpty && regExp.hasMatch(value)) {
      phoneEnabled.value = true;
    } else {
      phoneEnabled.value = false;
    }
  }

  // 이메일 정규식
  void emailValidation(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      emailEnabled.value = true;
    } else {
      emailEnabled.value = false;
    }
  }

  // 비밀번호 가져오기
  void setPassword(String value) {
    password.value = value;
    if (value.isNotEmpty && value == rePasswordController.text) {
      passwordEnabled.value = true;
    } else {
      passwordEnabled.value = false;
    }
  }

  // 다시 쓴 비밀번호 규칙
  void passwordValidation(String value) {
    if (value.isNotEmpty && value == password.value) {
      passwordEnabled.value = true;
    } else {
      passwordEnabled.value = false;
    }
  }

  // 화면 이동
  void registerPageChange(String route) {
    Get.toNamed(route);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // 회원가입 완료
  Future<void> registerComplete() async {
    final userModel = UserModel(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      imageUrl: DEFUALT_URL,
      type: typeSelected.value ? TYPE_OLD : TYPE_YOUNG,
    );

    registerResult.value = await authService.register(
      userModel,
      rePasswordController.text,
    );

    if (registerResult.value == SUCCESS) {
      Get.offAllNamed(Routes.HOME);
      _clearAllState();
    }
  }

  //상태 초기화
  void _clearAllState() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
    typeSelected.value = false;
    nameEnabled.value = false;
    phoneEnabled.value = false;
    emailEnabled.value = false;
    passwordEnabled.value = false;
  }
}
