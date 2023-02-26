import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/my_page_controller.dart';
import 'package:solution_challenge/controller/my_page/subscriber_manage_controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(
      () => MyPageController()
    );
    Get.lazyPut<SubscriberManageController>(
      () => SubscriberManageController()
    );
}}