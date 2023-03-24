//파이어베이스와 통신용
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/alarm_model.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class FirebaseClient with StorageUtil {
  //내 이미지 가져오기
  // String getImgUrl() {
  //   final uid = getString(UID_KEY);
  //   databaseRef.child('$userType/$uid').once().then((value) {
  //     Map<dynamic, dynamic> user = value.snapshot.value as Map;
  //     print(user["imageUrl"]);
  //     return user["imageUrl"];
  //   });
  //   return DEFUALT_URL;
  // }

  //유저 검색 (구독자 찾기)
  Future<UserModel?> searchUser(String email) async {
    if (email == firebaseAuth.currentUser?.email) {
      Get.snackbar("검색오류", "본인 아이디는 구독할 수 없습니다");
      return null;
    }
    late UserModel result;
    Query query =
        databaseRef.child(oppositeType).orderByChild("email").equalTo(email);
    await query.once().then((value) {
      final snapshotValue = value.snapshot.value;
      if (snapshotValue == null) return null;
      Map<dynamic, dynamic> user = snapshotValue as Map;
      final uid = user.keys.first;
      print(uid);
      result = UserModel(
        id: uid,
        name: user[uid]['name'],
        phone: user[uid]['phone'],
        email: user[uid]['email'],
        imageUrl: user[uid]['imageUrl'],
      );
    });
    return result;
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

      DatabaseReference pushedPostRef = databaseRef
          .child(oppositeType)
          .child(toUid)
          .child("alarmList")
          .push();
      String? pushKey = pushedPostRef.key;

      final alarm = AlarmModel(
        id: pushKey!,
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
