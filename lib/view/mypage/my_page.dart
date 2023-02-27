import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/my_page_controller.dart';
import 'package:solution_challenge/routes/app_pages.dart';


class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 220,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 8.0),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF707DF1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.MYACCOUNT_MANAGE),
                      child: Text('프로필 사진 변경', style: TextStyle(fontSize: 22, color: Color(0xFF707DF1),))
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
              child: Row(
                children: [
                  Text('계정 정보'),
                  Spacer(),
                  Text('sfdsfwerw@gmail.com')
                ],
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(13, 10, 13, 10),
              child: Row(
                children: [
                  Text('이름'),
                  Spacer(),
                  Text('안승우'),
                ],
              ),
            ),
            Container(
              height: 81,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                  onPressed: () => Get.toNamed(Routes.SUBSCRIBER_MANAGE),
                  child: Row(
                    children: [
                      Text('구독 관리',
                        style: TextStyle(fontSize: 22, color: Colors.black),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                    ],
                  )
              ),
            ),
            Container(
              height: 81,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.INFO_CARE_APPLY),
                child: Row(
                  children: [
                    Text('돌봄신청 안내',
                      style: TextStyle(fontSize: 22, color: Colors.black),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                  ],
                ),
              ),
            ),
            Container(
              height: 81,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.SETTING),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: Text('설정',
                        style: TextStyle(fontSize: 22, color: Colors.black),),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
