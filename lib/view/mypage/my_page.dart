import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/my_page_controller.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 220,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 8.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: todoBorder,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(controller.imgUrl),
                  ),
                ),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.MYACCOUNT_MANAGE),
                    child: const Text('프로필 사진 변경',
                        style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                        )))
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
            child: Row(
              children: [
                const Text('계정 정보'),
                const Spacer(),
                Text(controller.user.email!),
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
            child: Row(
              children: [
                const Text('이름'),
                const Spacer(),
                Text(controller.user.displayName!),
              ],
            ),
          ),
          Container(
            height: 81,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: TextButton(
                onPressed: () => Get.toNamed(Routes.SUBSCRIBER_MANAGE),
                child: Row(
                  children: const [
                    Text(
                      '구독 관리',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.black,
                    )
                  ],
                )),
          ),
          Container(
            height: 81,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: TextButton(
              onPressed: () => Get.toNamed(Routes.INFO_CARE_APPLY),
              child: Row(
                children: const [
                  Text(
                    '돌봄신청 안내',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 81,
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: TextButton(
              onPressed: () => Get.toNamed(Routes.SETTING),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                    child: const Text(
                      '설정',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 81,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: TextButton(
              onPressed: () => controller.logout(),
              child: Row(
                children: const [
                  Text(
                    '로그아웃',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
