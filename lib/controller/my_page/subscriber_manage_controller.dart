import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriberManageController extends GetxController {
  final RxList<String> subscribers = <String>['승우', '여경', '지수'].obs;
  final List<RxInt> subscriberButtonIndex = <RxInt>[0.obs, 0.obs, 0.obs];
  final listTextTabToggle = ["수정허용", "수정거부"];


  void openDialog(index) {
    Get.dialog(
      AlertDialog(
        title: Text('정말 ${subscribers[index]}님을 구독 취소하시겠습니까?'),
        content: Text('구독 취소하면 나의 할 일 목록을 볼 수 없습니다.'),
        actions: [
          TextButton(
              onPressed: () => {
                subscribers.removeAt(index),
                Get.back(),
              },
              child: Text('네')
          ),
          TextButton(
              onPressed: () => Get.back(),
              child: Text('아니요')
          )
        ],
      ),
    );
  }
}


