import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';

//컨트롤러는 페이지별로 폴더를 만들어주세요. GetXController 사용해주세요
class LoginController extends GetxController {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  void login() {
    Get.snackbar(
        "로그인 정보", "이메일: ${emailInput.text} 비밀번호 : ${passwordInput.text}");
  }

  void toSignUp() {
    Get.toNamed(Routes.REGISTER_TYPE);
  }

  void tempValidation(String value) {}
}
