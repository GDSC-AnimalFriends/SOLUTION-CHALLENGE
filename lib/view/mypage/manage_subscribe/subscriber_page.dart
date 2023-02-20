import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
//import 'package:solution_challenge/view/common/common_button.dart';
//import 'package:solution_challenge/view/theme/app_colors.dart';

class SubscriberManage extends StatefulWidget {
  const SubscriberManage({super.key});

  @override
  State<SubscriberManage> createState() => _SubscriberManageState();
}

class _SubscriberManageState extends State<SubscriberManage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '구독 관리',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(37, 40, 27, 0),
                child: Row(
                  children: [
                    Text('내 구독자'),
                    Spacer(),
                    Text('000님의 To-do를 응원하고있어요!'),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 354,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(9)
                ),
                child: Column(
                  children: [
                    ListView(
                      padding: EdgeInsets.all(8),
                      children: [

                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}

// class Person extends SubscriberManage{
//   String? name;
//   Person(this.name);
// }

