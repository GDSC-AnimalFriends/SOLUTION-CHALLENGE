import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/subscriber_model.dart';
import 'package:solution_challenge/routes/app_pages.dart';

import '../../data/model/user_model.dart';
import '../../data/provider/firebase_client.dart';

class SubscriberManageController extends GetxController {
  RxList<SubscriberModel> subscriberList = <SubscriberModel>[].obs;
  List<UserModel> userList = <UserModel>[]; //구독자의 email 가져오기
  final subscriber = FirebaseClient();
  final listTextTabToggle = ["수정허용", "수정거부"];

  // await subscriber.update({
  // "auth": 19
  // });
  //await subscriber.update(){};

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

  void onInit() {
    subscriber.getMySubscriberList();
    _getRemoteSubscriberList();
    _getRemoteUserList();
    initializeButtonIndex();
    super.onInit();
  }

  void _getRemoteSubscriberList() async {
    subscriberList.value = subscriber.remoteSubscriberList;
  }

  void _getRemoteUserList() async {
    userList = subscriber.remoteUserList;
  }



  void isAuthButtonIndex(buttonIndex,index){
    if(buttonIndex == 0){//수정허용
      subscriber.updateSubscriberAuth(subscriberList[index], true).then((value) {
        print("true로 update됨");
        // The subscriber data has been successfully updated in Firebase
      }).catchError((error) {
        // An error occurred while updating the subscriber data in Firebase
      });
    }
    else {
      subscriber.updateSubscriberAuth(subscriberList[index], false).then((value) {
        print("false로 update됨");
        // The subscriber data has been successfully updated in Firebase
      }).catchError((error) {
      });
    }
    subscriberButtonIndex[index].value = buttonIndex;



  }

  String searchSubscriberEmail(id) { //구독자 id로 구독자의 email 찾기
    final subscriberEmail = userList[id].email;
    return subscriberEmail;
  }


  void openDialog(index) async {
    Get.dialog(
      AlertDialog(
        title: Text('정말 ${subscriberList[index].name}님을 구독 취소하시겠습니까?'),
        content: const Text('구독 취소하면 나의 할 일 목록을 볼 수 없습니다.'),
        actions: [
          TextButton(
              onPressed: () => {
                subscriberList.removeAt(index),
                Get.back(),
              },
              child: const Text('네')),
          TextButton(onPressed: () => Get.back(), child: const Text('아니요'))
        ],
      ),
    );
  }
  void toAddSubscirber() {
    Get.toNamed(Routes.SUBSCRIBE_ADD);
  }


}

// class SubscriberManageController extends GetxController {
//   final RxList<String> subscribers = <String>['승우', '여경', '지수'].obs;
//   final List<RxInt> subscriberButtonIndex = <RxInt>[0.obs, 0.obs, 0.obs];
//   RxInt list로 subscriber.length만큼의 0으로 있어야함...?
//   final listTextTabToggle = ["수정허용", "수정거부"];
//
//   void openDialog(index) {
//     Get.dialog(
//       AlertDialog(
//         title: Text('정말 ${subscribers[index]}님을 구독 취소하시겠습니까?'),
//         content: const Text('구독 취소하면 나의 할 일 목록을 볼 수 없습니다.'),
//         actions: [
//           TextButton(
//               onPressed: () => {
//                     subscribers.removeAt(index),
//                     Get.back(),
//                   },
//               child: const Text('네')),
//           TextButton(onPressed: () => Get.back(), child: const Text('아니요'))
//         ],
//       ),
//     );
//   }
//
//   void toAddSubscirber() {
//     Get.toNamed(Routes.SUBSCRIBE_ADD);
//   }
// }
