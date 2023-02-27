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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                child: Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFF707DF1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0x3D707DF1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: 390,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                  onPressed: ()=> Get.toNamed(Routes.MYACCOUNT_MANAGE),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text('자기 계정 관리', style: TextStyle(fontSize: 22, color: Colors.black),),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                    ],
                  )
              ),
            ),
            Container(
              height: 81,
              width: 390,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                  onPressed: () => Get.toNamed(Routes.SUBSCRIBER_MANAGE),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text('구독 관리',
                          style: TextStyle(fontSize: 22, color: Colors.black),),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                    ],
                  )
              ),
            ),
            Container(
              height: 81,
              width: 390,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.INFO_CARE_APPLY),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: Text('돌봄신청 안내',
                        style: TextStyle(fontSize: 22, color: Colors.black),),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                  ],
                ),
              ),
            ),
            Container(
              height: 81,
              width: 390,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.SETTING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
