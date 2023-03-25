import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';
import '../../../controller/home/alarm_controller.dart';

class AlarmPage extends GetView<AlarmController> {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => Column(
            children: [
              alarmCountText(),
              alarmListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget alarmCountText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          '읽지 않은 알람이 ${controller.alarmList.length}개 있어요!',
          style: const TextStyle(
            color: Color.fromARGB(255, 112, 125, 241),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget alarmListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.alarmList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: buttonDisabled,
              radius: 30,
              child: Image.network(controller.alarmList[index].imageUrl),
            ),
            title: Text(
              controller.alarmList[index].name,
              style: bold18,
            ),
            subtitle: const Text("구독 요청이 왔어요"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {},
                  child: AlarmButton(
                    text: "구독하기",
                    textColor: primaryColor,
                    isRead: controller.alarmList[index].read,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const AlarmButton(
                    text: "삭제",
                    textColor: grey,
                    isRead: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AlarmButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool isRead;
  const AlarmButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: isRead ? buttonDisabled : textColor),
    );
  }
}
