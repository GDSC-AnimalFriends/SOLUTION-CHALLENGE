import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/my_page_controller.dart';
import 'package:solution_challenge/controller/my_page/subscribe_add_controller.dart';

import 'package:solution_challenge/controller/my_page/subscriber_manage_controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() {
      return MyPageController();
    });

    Get.lazyPut<SubscribeAddController>(() {
      return SubscribeAddController();
    });

    Get.lazyPut<SubscriberManageController>(() => SubscriberManageController());
  }
}
