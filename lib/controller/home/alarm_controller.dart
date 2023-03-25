import 'dart:developer';

import 'package:get/get.dart';
import 'package:solution_challenge/data/model/alarm_model.dart';
import 'package:solution_challenge/data/provider/firebase_client.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';

class AlarmController extends GetxController {
  RxList<AlarmModel> alarmList = <AlarmModel>[].obs;
  final client = FirebaseClient();

  @override
  void onInit() {
    _getRemoteAlarmList();
    super.onInit();
  }

  void _getRemoteAlarmList() async {
    alarmList.value = client.remoteAlarmList;
  }

  void subscribeUser(int index) async {
    if (await client.subscribeUser(alarmList[index]) == SUCCESS) {
      alarmList[index].read = true;
      alarmList.refresh();
    } else {
      Get.snackbar("실패", "구독을 실패했어요");
    }
  }

  void deleteAlarm(int index) async {
    if (await client.deleteAlarm(alarmList[index].ref) == SUCCESS) {
      alarmList.removeAt(index);
    }
  }
}
