import 'package:flutter/material.dart';
import 'package:solution_challenge/view/home/home_subpages/alarm_page.dart';
import 'package:solution_challenge/view/home/home_subpages/today_todo_page.dart';
import 'package:solution_challenge/view/home/home_subpages/all_todo_page.dart';
import 'package:solution_challenge/view/mypage/my_page.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: white,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    centerTitle: false,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          splashFactory: NoSplash.splashFactory,
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor:
                              const Color.fromARGB(255, 229, 229, 229),
                          tabs: [
                            textTab("오늘의 할 일", 22),
                            textTab("할 일 전체보기", 22),
                            textTab("알람", 22),
                            textTab("마이페이지", 22),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
            body: TabBarView(
              children: <Widget>[
                TodayTodoPage(),
                AllTodoPage(),
                AlarmPage(),
                const MyPage(),
              ],
            ),
          );
        }));
  }
}

Widget textTab(String text, double textSize) {
  return Tab(
    child: Text(
      text,
      style: TextStyle(
        fontSize: textSize,
      ),
    ),
  );
}
