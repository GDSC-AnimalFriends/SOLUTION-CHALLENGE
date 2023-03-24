import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/routes/app_pages.dart';

class SubscriberManageController extends GetxController {
  final RxList<String> subscribers = <String>['승우', '여경', '지수'].obs;
  final List<RxInt> subscriberButtonIndex = <RxInt>[0.obs, 0.obs, 0.obs];
  final listTextTabToggle = ["수정허용", "수정거부"];

  void openDialog(index) {
    Get.dialog(
      AlertDialog(
        title: Text('정말 ${subscribers[index]}님을 구독 취소하시겠습니까?'),
        content: const Text('구독 취소하면 나의 할 일 목록을 볼 수 없습니다.'),
        actions: [
          TextButton(
              onPressed: () => {
                    subscribers.removeAt(index),
                    Get.back(),
                  },
              child: const Text('네')),
          TextButton(onPressed: () => Get.back(), child: const Text('아니요'))
        ],
      ),
    );
  }
  // 노인이면 구독자가 보호자들(uid) , 보호자면 구독자가 노인(uid)
  // 본인 uid에 저장된 구독리스트(uid)를 조회하고 그 구독자(uid)에 맞는 img?, displayName, email, 권한설정
  // 구독자 리스트 : 구독자 uid, 수정권한(bool)

  void toAddSubscirber() {
    Get.toNamed(Routes.SUBSCRIBE_ADD);
  }

}
