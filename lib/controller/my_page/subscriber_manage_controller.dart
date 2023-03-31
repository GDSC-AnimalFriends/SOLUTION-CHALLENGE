import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/subscriber_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/routes/app_pages.dart';

import '../../data/model/user_model.dart';
import '../../data/provider/firebase_client.dart';

class SubscriberManageController extends GetxController {
  User user = firebaseAuth.currentUser!;
  RxList<SubscriberModel> subscriberList = <SubscriberModel>[].obs;
  List<UserModel> userList = <UserModel>[]; //구독자의 email 가져오기
  final subscriber = FirebaseClient();
  final listTextTabToggle = ["수정허용", "수정거부"];
  final List<RxInt> subscriberButtonIndex = <RxInt>[];

  void initializeButtonIndex() {
    for (int i = 0; i < subscriberList.length; i++) {
      if (subscriberList[i].auth == true) {
        subscriberButtonIndex.add(RxInt(0));
      }
      else {
        subscriberButtonIndex.add(RxInt(1));
      }
    }
  }

  void onInit() async{
    await subscriber.getMySubscriberList();
    await _getRemoteSubscriberList();
    initializeButtonIndex();
    super.onInit();
  }

  Future<void> _getRemoteSubscriberList() async {
    subscriberList.value = subscriber.remoteSubscriberList;
  }


  void isAuthButtonIndex(buttonIndex,index) async{
    if(buttonIndex == 0){//수정허용
      subscriber.updateSubscriberAuth(subscriberList[index], true).then((value) {
      }).catchError((error) {}); //나의 구독자 auth 바꾸기

    }
    else {
      subscriber.updateSubscriberAuth(subscriberList[index], false).then((value) {
      }).catchError((error) {});
    }
    subscriberButtonIndex[index].value = buttonIndex;
  }


  void openDialog(index) async {
    Get.dialog(
      AlertDialog(
        title: Text('정말 ${subscriberList[index].name}님을 구독 취소하시겠습니까?'),
        content: const Text('구독 취소하면 나의 할 일 목록을 볼 수 없습니다.'),
        actions: [
          TextButton(
              onPressed: () => {
                deleteSubscriber(index),
                Get.back(),
              },
              child: const Text('네')),
          TextButton(onPressed: () => Get.back(), child: const Text('아니요'))
        ],
      ),
    );
  }

  void deleteSubscriber(int index) async {
    if (await subscriber.deleteSubscriber(subscriberList[index]) ==
        SUCCESS) {//내 구독자리스트에서 삭제
      subscriberList.removeAt(index);
    }
  }

  void toAddSubscirber() {
    Get.toNamed(Routes.SUBSCRIBE_ADD);
  }

  String isOldYoung(){
    if(userType == 'old') {
      return '노인';
    }
    else {
      return '보호자';
    }
  }
}