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
    return Scaffold(
      appBar: const AppBarOnlyBack(
        appBarTitle: '구독 관리',
      ),
      body: subscriberListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toAddSubscirber(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget subscriberListView() {
    return Obx(
      () => controller.subscriberList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemCount: controller.subscriberList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(9.0)),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: SizedBox(
                        height: 75,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: todoBorder,
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  controller.subscriberList[index].imageUrl),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(18, 18, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller
                                      .subscriberList[index].name), //구독자 이름
                                  const Text('email'),
                                  //controller.searchSubscriberEmail(controller.subscriberList[index].id)), //구독자 id로 메일찾아와
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        const Text('권한 설정'),
                        Obx(
                          () => FlutterToggleTab(
                            width: 50,
                            borderRadius: 15,
                            selectedBackgroundColors: const [
                              primaryColor,
                              lightPrimaryColor
                            ],
                            selectedTextStyle:
                                const TextStyle(color: Colors.white),
                            unSelectedTextStyle:
                                const TextStyle(color: Colors.black),
                            labels: controller.listTextTabToggle, //수정허용,거부
                            selectedLabelIndex: (buttonIndex) {
                              //buttonIndex가 togglebutton(0,1) 중 index
                              controller.subscriberButtonIndex[index].value =
                                  buttonIndex;
                              controller.isAuthButtonIndex(buttonIndex, index);
                            },
                            selectedIndex:
                                //controller.authBoolToSelectedIndex(index),
                                controller.subscriberButtonIndex[index].value,
                            isScroll: true,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () => controller.openDialog(index),
                          child: const Text('구독 취소'),
                        ),
                      ],
                    ),
                  ),
                );
              })
          //: Text(controller.isSubscriberListExist()), //구독자 있는지 확인
          : const Center(
              child: Text(
              '구독자가 없습니다.\n구독자를 추가해서 나의 할 일을 공유해보세요!',
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            )),
    );
  }
}
