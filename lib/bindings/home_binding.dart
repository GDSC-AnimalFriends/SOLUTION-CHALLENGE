import 'package:get/get.dart';
import 'package:solution_challenge/bindings/mypage_binding.dart';
import 'package:solution_challenge/controller/home/alarm_controller.dart';
import 'package:solution_challenge/controller/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });

    Get.lazyPut<AlarmController>(() {
      return AlarmController();
    });
    MyPageBinding().dependencies();
  }
}
