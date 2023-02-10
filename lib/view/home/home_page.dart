import 'package:flutter/material.dart';
import 'package:solution_challenge/view/home/home_subpages/today_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Builder(builder: (context) {
          return Scaffold(
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
            body: const TabBarView(
              children: <Widget>[
                TodayTodoPage(),
                AllTodoPage(),
                TodayTodoPage(),
                MyPage(),
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
