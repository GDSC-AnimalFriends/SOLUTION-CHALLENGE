import 'package:flutter/material.dart';
import 'today_todo_page.dart';

class AllTodoPage extends StatefulWidget {
  const AllTodoPage({super.key});

  @override
  State<AllTodoPage> createState() => _AllTodoPageState();
}

class _AllTodoPageState extends State<AllTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          Column(
            children: [
              todoListView(todos, done, checkToDone),
              doneListView(done, todos, checkToNotDone),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 5,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 112, 125, 241),
              onPressed: () {},
              label: const Text('할 일 추가'),
              icon: const Icon(Icons.edit),
            ),
          )
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
