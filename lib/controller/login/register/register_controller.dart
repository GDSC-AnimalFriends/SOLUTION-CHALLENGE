import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final editController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  Rx<bool> buttonEnabled = false.obs;
  Rx<bool> typeEnabled = false.obs;
  Rx<bool> nameEnabled = false.obs;
  Rx<bool> phoneEnabled = false.obs;
  Rx<bool> registerEnabled = false.obs;

  void tempValidation(String value) {
    if (value.length > 1) {
      buttonEnabled.value = !buttonEnabled.value;
    } else {
      buttonEnabled.value = false;
    }
  }

  void nameValidation(String value) {
    if (value.length > 1) {
      nameEnabled.value = true;
    } else {
      nameEnabled.value = false;
    }
  }

  void registerPageChange(String route) {
    Get.toNamed(route);
  }

  void registerComplete() {
    Get.snackbar("계정 정보",
        "이름 : ${nameController.value.obs}\n번호 : ${phoneController.text}\n이메일 : ${emailController.text}\n비밀번호: ${passwordController.text}\n타입 : ");
  }
}
