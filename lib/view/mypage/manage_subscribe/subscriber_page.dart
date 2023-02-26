import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/subscriber_manage_controller.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class SubscriberManage extends GetView<SubscriberManageController> {
  const SubscriberManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '구독 관리',
        ),
        body: subscriberListView(),
      ),
    );
  }

  Widget subscriberListView() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        itemCount: controller.subscribers.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(9.0)
                ),
                child: ExpansionTile(
                  title: Container(
                    height: 75,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(18, 18, 0, 0),
                          child: Column(
                            children: [
                              Text('${controller.subscribers[index]}'),
                              Text('mail'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: [
                    Text('권한 설정'),
                    Obx(
                      () => FlutterToggleTab(
                        width: 50,
                        borderRadius: 15,
                        selectedBackgroundColors: const [
                          primaryColor,
                          lightPrimaryColor
                        ],
                        selectedTextStyle: const TextStyle(color: Colors.white),
                        unSelectedTextStyle: const TextStyle(color: Colors.black),
                        labels: controller.listTextTabToggle,
                        selectedLabelIndex: (buttonIndex) {//buttonIndex가 togglebutton(0,1) 중 index
                          controller.subscriberButtonIndex[index].value = buttonIndex;
                          },
                        selectedIndex:
                            controller.subscriberButtonIndex[index].value,
                        isScroll: true,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                    onPressed: () => controller.openDialog(index),
                    child: Text('구독 취소'),
                  ),
                ],
                ),
              ),
          );
        });
  }
}

