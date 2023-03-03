import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/alarm_controller.dart';

class AlarmPage extends StatelessWidget {
  AlarmPage({super.key});

  final AlarmController alarmController = Get.put(AlarmController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            alarmCountText(),
            alarmListView(),
          ],
        ),
      ),
    );
  }

  Widget alarmCountText() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            '읽지 않은 알람이 ${alarmController.alarms.length}개 있어요!',
            style: const TextStyle(
              color: Color.fromARGB(255, 112, 125, 241),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget alarmListView() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: alarmController.alarms.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.notifications,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    alarmController.alarms[index],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                alarmController.checkAlarm(index);
                alarmController.update();
              },
            ),
          );
        },
      ),
    );
  }
}
