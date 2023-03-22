import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/service/auth_service.dart';

//컨트롤러는 페이지별로 폴더를 만들어주세요. GetXController 사용해주세요
class LoginController extends GetxController {
  AuthService authService = AuthService();
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  RxInt loginResult = 9.obs;

  void login() async {
    loginResult.value =
        await authService.login(emailInput.text, passwordInput.text);

    if (loginResult.value == 0) {
      Get.offNamed(Routes.HOME);
    }
  }

  void toSignUp() {
    Get.toNamed(Routes.REGISTER_TYPE);
  }
}
