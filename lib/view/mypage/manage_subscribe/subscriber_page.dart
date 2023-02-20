import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class SubscriberManage extends StatefulWidget {
  const SubscriberManage({super.key});

  @override
  State<SubscriberManage> createState() => _SubscriberManageState();
}

class _SubscriberManageState extends State<SubscriberManage> {

  @override
  final List<String> subscribers = <String>['여경','지수'];


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
                height: 600,
                width: 354,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(9)
                ),
                child: Column(
                  children: [
                    subscriberListView(),
                  ],
                )
              )
            ],
          ),
        )
      )
    );
  }

  Widget subscriberListView() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8),
          itemCount: subscribers.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                  color: lightPrimaryColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Text('${subscribers[index]}'),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 39,
                      width: 95,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.9), blurRadius: 5.0,spreadRadius: 1.5, offset: const Offset(1,3))
                        ]
                      ),
                      child: Center(child: Text('권한 부여',style: TextStyle(color: Colors.white),)),
                        ),
                       ),
              ]
            )
            );
          }
      ),
    );
  }
}
