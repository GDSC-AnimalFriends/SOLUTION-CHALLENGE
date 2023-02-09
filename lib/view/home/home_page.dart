import 'package:flutter/material.dart';
import 'package:solution_challenge/view/home/home_subpages/today_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("AppName"),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4,
                    color: Colors.black,
                  ),
                ),
                isScrollable: true,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(child: Text("오늘의 할 일")),
                  Tab(child: Text("전체 보기")),
                  Tab(child: Text("알림")),
                  Tab(child: Text("마이페이지")),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              TodayTodoPage(),
              TodayTodoPage(),
              TodayTodoPage(),
              TodayTodoPage(),
            ],
          ),
        ));
  }
}
