//파이어베이스와 통신용
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/alarm_model.dart';
import 'package:solution_challenge/data/model/subscriber_model.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class FirebaseClient with StorageUtil {
  //싱글톤
  FirebaseClient._privateConstructor();
  static final FirebaseClient _instace = FirebaseClient._privateConstructor();
  factory FirebaseClient() {
    return _instace;
  }

  //내 알람을 저장하는 공간
  RxList<AlarmModel> remoteAlarmList = <AlarmModel>[].obs;

  //구독자를 저장하는 공간
  RxList<SubscriberModel> remoteSubscriberList = <SubscriberModel>[].obs;

  //유저를 저장하는 공간
  List<UserModel> remoteUserList = <UserModel>[];

  //검색된 유저를 저장하는 공간
  UserModel? searchedUser;

  Future<void> getMySubscriberList() async {//구독자 가져와볼게
    try {
      Query query = databaseRef
          .child(userType!)
          .child(getString(UID_KEY)!)
          .child("subscribeList");

      final queryStr = "$userType/${getString(UID_KEY)}/SubscribeList";
      log(queryStr);

      await query.once().then((value) {
        Map<dynamic, dynamic> remoteSubscribers = value.snapshot.value as Map;
        List<dynamic> resultList = remoteSubscribers.values.toList();
        List<SubscriberModel> list = <SubscriberModel>[];
        for (var result in resultList) {
          final model = SubscriberModel.fromJson(result);
          list.add(model);
        }
        remoteSubscriberList.value = list;
      });
    } catch (e) {
      return;
    }
    return;
  }

//노인의 구독자 auth, 보호자의 구독자 auth 수정 변경사항 update
  Future<void> updateSubscriberAuth(SubscriberModel subscriber, bool trueOrFalse) async {
    // Get a reference to the subscriber in Firebase
    DatabaseReference subscriberRef = databaseRef.child(subscriber.ref);
    DatabaseReference subscriberOtherRef = databaseRef.child(subscriber.otherRef);
    subscriberRef.update({"auth": trueOrFalse});
    subscriberOtherRef.update({"auth" : trueOrFalse});
  }

  //구독자리스트에서 구독취소
  Future<int> deleteSubscriber(subscriber) async {
    try {
      DatabaseReference subscriberRef = databaseRef.child(subscriber.ref);
      DatabaseReference subscriberOtherRef = databaseRef.child(subscriber.otherRef);
      await subscriberRef.child(subscriber).remove(); //나의 구독자
      await subscriberOtherRef.child(subscriber).remove(); //구독자의 나
      return SUCCESS;
    } catch (e) {
      return ERROR;
    }
  }


  //내 알람 가져오기
  Future<void> getMyAlarmList() async {
    try {
      Query query = databaseRef
          .child(userType!)
          .child(getString(UID_KEY)!)
          .child("alarmList");

      final queryStr = "$userType/${getString(UID_KEY)}/alarmList";
      log(queryStr);

      await query.once().then((value) {
        Map<dynamic, dynamic> remoteAlarms = value.snapshot.value as Map;
        List<dynamic> resultList = remoteAlarms.values.toList();
        List<AlarmModel> list = <AlarmModel>[];
        for (var result in resultList) {
          final model = AlarmModel.fromJson(result);
          list.add(model);
        }
        remoteAlarmList.value = list;
      });
    } catch (e) {
      return;
    }
    return;
  }

  //알림리스트에서 구독하기 눌렀을때 구독
  Future<int> subscribeUser(AlarmModel model) async {
    try {
      final ref = "$userType/${model.toUid}/subscribeList/${model.fromUid}";
      final otherRef =
          "$oppositeType/${model.fromUid}/subscribeList/${model.toUid}";

      //내 구독목록에 추가
      if (await addSubscriber(
              model.fromUid, ref, otherRef, model.imageUrl, model.name) ==
          false) {
        log("내 구독목록에 추가실패");
        return FAIL_ONE;
      }
      //상대 구독목록에 추가
      if (await addSubscriber(
              model.toUid, otherRef, ref, getString(IMAGE_KEY)!, myName!) ==
          false) {
        log("상대 구독목록에 추가실패");
        return FAIL_SECOND;
      }
      return SUCCESS;
    } catch (e) {
      return ERROR;
    }
  }

  //알림 리스트에서 삭제
  Future<int> deleteAlarm(String ref) async {
    try {
      await databaseRef.child(ref).remove();
      return SUCCESS;
    } catch (e) {
      return ERROR;
    }
  }

  //구독자 목록에 추가
  Future<bool> addSubscriber(String targetId, String ref, String otherRef,
      String imageUrl, String name) async {
    try {
      final subscriberModel = SubscriberModel(
        id: targetId,
        ref: ref,
        otherRef: otherRef,
        imageUrl: imageUrl,
        name: name,
        auth: true,
      );
      await databaseRef.child(ref).set(subscriberModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //유저 검색 (구독자 찾기)
  Future<int> searchUser(String email) async {
    if (email == firebaseAuth.currentUser?.email) {
      Get.snackbar("검색오류", "본인 아이디는 구독할 수 없습니다");
      return FAIL_ONE;
    }

    var resultCode = ERROR;

    Query query =
        databaseRef.child(oppositeType).orderByChild("email").equalTo(email);
    await query.once().then((value) {
      final snapshotValue = value.snapshot.value;
      if (snapshotValue == null) {
        resultCode = FAIL_SECOND;
      } else {
        Map<dynamic, dynamic> user = snapshotValue as Map;
        final uid = user.keys.first;
        log(uid);
        searchedUser = UserModel(
          id: uid,
          name: user[uid]['name'],
          phone: user[uid]['phone'],
          email: user[uid]['email'],
          imageUrl: user[uid]['imageUrl'],
        );
        resultCode = SUCCESS;
      }
    });
    return resultCode;
  }

  //구독 추가 알람보내기
  Future<int> sendSubscribeAlarm(String toUid) async {
    try {
      final uid = getString(UID_KEY);

      if (await alreadySubscribe(uid!, toUid) == true) {
        return FAIL_ONE;
      }

      if (await alreadySend(toUid, uid) == true) {
        return FAIL_SECOND;
      }

      final ref = "$oppositeType/$toUid/alarmList";

      DatabaseReference pushedPostRef = databaseRef.child(ref).push();
      String? pushKey = pushedPostRef.key;

      final alarm = AlarmModel(
        id: pushKey!,
        ref: "$ref/$pushKey",
        toUid: toUid,
        fromUid: uid,
        name: myName!,
        imageUrl: getString(IMAGE_KEY)!,
        read: false,
      );

      pushedPostRef.set(alarm.toJson());

      return SUCCESS;
    } catch (e) {
      log(e.toString());
      return ERROR;
    }
  }

  //이미 알림을 전송했는지
  Future<bool> alreadySend(String toUid, String fromUid) async {
    var result = false;
    try {
      Query query = databaseRef
          .child(oppositeType)
          .child(toUid)
          .child("alarmList")
          .orderByChild("fromUid")
          .equalTo(fromUid);

      await query.once().then((value) {
        final snapshotValue = value.snapshot.value;
        if (snapshotValue == null) return false;
        Map<dynamic, dynamic> user = snapshotValue as Map;

        for (var key in user.keys) {
          log(key);
          log(user[key]["fromUid"]);
          log(fromUid);
          log((user[key]["fromUid"] == fromUid).toString());
          if (user[key]["fromUid"] == fromUid) {
            result = true;
            break;
          }
        }
      });
    } catch (e) {
      result = false;
    }
    return result;
  }

  //이미 구독중인지
  Future<bool> alreadySubscribe(String uid, String toUid) async {
    var result = false;
    try {
      Query query = databaseRef
          .child(userType!)
          .child(uid)
          .child("subscribeList")
          .orderByChild("id")
          .equalTo(toUid);

      await query.once().then((value) {
        final snapshotValue = value.snapshot.value;
        if (snapshotValue == null) return false;
        Map<dynamic, dynamic> user = snapshotValue as Map;

        for (var key in user.keys) {
          if (user[key]["id"] == toUid) {
            result = true;
            break;
          }
        }
      });
    } catch (e) {
      return false;
    }
    return result;
  }
}
