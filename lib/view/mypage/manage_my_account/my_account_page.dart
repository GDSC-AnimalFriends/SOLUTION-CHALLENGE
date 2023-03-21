import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
//import 'package:get/get.dart';

class MyAccountManage extends StatelessWidget {
  const MyAccountManage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '자기 계정 관리',
        ),
      ),
    );
  }
}
