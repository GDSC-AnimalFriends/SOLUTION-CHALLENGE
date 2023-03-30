import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/storage_util.dart';
import 'package:solution_challenge/util/const_key.dart';

class TodoService with StorageUtil {
  void readTodo({required String userId}) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("young/$userId/todos/");
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
    });
    final snapshot = await ref.child('users/$userId').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  void addTodo({required TodoModel todo}) {
    DatabaseReference ref = FirebaseDatabase.instance.ref(
        "$userType/${getString(UID_KEY)!}/todos/${todo.todoid.toString().replaceAll('.', '_')}");
    ref.set(todo.toJson());
  }

  void deleteTodo({required String todoid, required String userid}) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("young/$userid/todos/$todoid");
    ref.remove();
  }

  void updateTodo({required String todouid, required TodoModel todo}) {}
}
