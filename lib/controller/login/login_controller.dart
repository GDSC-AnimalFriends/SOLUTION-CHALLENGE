import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';

//컨트롤러는 페이지별로 폴더를 만들어주세요. GetXController 사용해주세요
class LoginController extends GetxController {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  void login() {
    Get.toNamed(Routes.HOME);
  }

  void toSignUp() {
    Get.toNamed(Routes.REGISTER_TYPE);
  }
}
