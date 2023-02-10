import 'package:get/get.dart';
import 'package:solution_challenge/controller/login/login_controller.dart';

//페이지 별로 의존성 관리해주세요. repository나 api를 초기화해 사용할 수 있어요. app_page의 binding에 사용해주세요
class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() {
      return TodoController();
    });
  }
}
