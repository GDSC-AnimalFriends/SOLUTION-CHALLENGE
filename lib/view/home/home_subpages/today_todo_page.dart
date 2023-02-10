import 'package:flutter/material.dart';

class TodayTodoPage extends StatefulWidget {
  const TodayTodoPage({super.key});

  @override
  State<TodayTodoPage> createState() => _TodayTodoPageState();
}

class _TodayTodoPageState extends State<TodayTodoPage> {
  List todos = [];
  List done = [];

  @override
  void initState() {
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            child: todoListView(todos, done, selectTappedItem),
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
            child: todoListView(done, todos, selectTappedItem),
          ),
        ],
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
            onTap: () => onTap(index, subList),
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

  void selectTappedItem(int index, subList) {}
}
