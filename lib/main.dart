import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // 프로젝트 루트입니다
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      theme: appThemeData,
      defaultTransition: Transition.fade, //전환 효과
      home: MyPage(), //이거 일단 시험
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                      child: Text('오늘의 할일',style: TextStyle(color: Colors.grey),),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                      child: Text('전체보기',style: TextStyle(color: Colors.grey)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                      child: Text('알림',style: TextStyle(color: Colors.grey)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                      child: Text('마이페이지',style: TextStyle(color: Colors.black)),
                    ),
                  ]
              )
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.fromLTRB(17, 50, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF707DF1),
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 237,
                    margin: EdgeInsets.fromLTRB(22, 50, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0x3D707DF1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: 390,
              margin: EdgeInsets.fromLTRB(0, 41, 0, 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: TextButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text('자기 계정 관리',style: TextStyle(fontSize: 22, color: Colors.black),),
                      ),
                      Spacer(),
                      Container(
                          child: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                      ),
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
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text('구독 관리',style: TextStyle(fontSize: 22, color: Colors.black),),
                      ),
                      Spacer(),
                      Container(
                          child: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,)
                      ),
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
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: Text('돌봄신청 안내',style: TextStyle(fontSize: 22, color: Colors.black),),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,),
                    ),
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
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: Text('설정',style: TextStyle(fontSize: 22, color: Colors.black),),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

