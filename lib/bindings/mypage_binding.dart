import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/my_page_controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() {
      return MyPageController();
    });
  }
}