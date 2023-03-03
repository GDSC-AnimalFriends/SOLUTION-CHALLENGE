import 'package:get/get.dart';

class AlarmController extends GetxController {
  List alarms = ["hello"].obs;

  @override
  void onInit() {
    alarms.add("test");
    super.onInit();
  }

  void checkAlarm(int index) {
    alarms.removeAt(index);
    refresh();
  }
}
