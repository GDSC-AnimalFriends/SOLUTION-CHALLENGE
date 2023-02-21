import 'package:flutter/material.dart';

List todos = ["test1", "test2", "test3", "test4", "test5"];
List done = [];

class TodayTodoPage extends StatefulWidget {
  const TodayTodoPage({super.key});

  @override
  State<TodayTodoPage> createState() => _TodayTodoPageState();
}

class _TodayTodoPageState extends State<TodayTodoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: categoryText("남았어요"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: todoListView(todos, done, checkToDone),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: categoryText("끝났어요"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: doneListView(done, todos, checkToNotDone),
            ),
          ],
        ),
      ),
    );
  }

  Widget todoListView(mainList, subList, onTap) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: mainList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text(
              mainList[index],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              mainList[index],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: const Icon(
              Icons.circle_outlined,
              color: Color.fromARGB(255, 112, 125, 241),
              size: 50.0,
            ),
            onTap: () => onTap(index),
          ),
        );
      },
    );
  }

  Widget doneListView(mainList, subList, onTap) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: mainList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text(
              mainList[index],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 210, 210, 210),
                decoration: TextDecoration.lineThrough,
              ),
            ),
            subtitle: Text(
              mainList[index],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 210, 210, 210),
                decoration: TextDecoration.lineThrough,
              ),
            ),
            onTap: () => onTap(index),
          ),
        );
      },
    );
  }

  Widget categoryText(text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 112, 125, 241),
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }

  void checkToDone(int index) {
    setState(() {
      done.add(todos.removeAt(index));
    });
  }

  void checkToNotDone(int index) {
    setState(() {
      todos.add(done.removeAt(index));
    });
  }
}
