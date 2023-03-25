import 'dart:developer';

import 'package:get/get.dart';
import 'package:solution_challenge/data/model/alarm_model.dart';
import 'package:solution_challenge/data/provider/firebase_client.dart';

class AlarmController extends GetxController {
  RxList<AlarmModel> alarmList = <AlarmModel>[].obs;

  @override
  void onInit() {
    log("컨트롤러 시작");
    _getRemoteAlarmList();
    super.onInit();
  }

  void _getRemoteAlarmList() async {
    await FirebaseClient().getMyAlarmList();
    alarmList.value = FirebaseClient().remoteAlarmList;
    log(FirebaseClient().remoteAlarmList.length.toString());
  }

  void checkAlarm(String id) {
    refresh();
  }
}
