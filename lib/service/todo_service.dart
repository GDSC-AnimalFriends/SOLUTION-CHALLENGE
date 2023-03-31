import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/storage_util.dart';
import 'package:solution_challenge/util/const_key.dart';

class TodoService with StorageUtil {
  Future<DataSnapshot> readTodo({required String userId}) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$userType/$userId/todos/");
    final snapshot = await ref.child("").get();
    return snapshot;
  }

  void addTodo({required TodoModel todo}) {
    DatabaseReference ref = FirebaseDatabase.instance.ref(
        "$userType/${getString(UID_KEY)!}/todos/${todo.todoid.toString().replaceAll('.', '_')}");
    ref.set(todo.toJson());
  }

  TodoModel getTodo({required TodoModel todo}) {
    DatabaseReference ref = FirebaseDatabase.instance.ref(
        "$userType/${getString(UID_KEY)!}/todos/${todo.todoid.toString().replaceAll('.', '_')}");
    ref.get();
    todo.user = ref.child("user") as String;
    todo.complete = ref.child("complete") as bool;
    todo.creator = ref.child("creator") as String;
    todo.date = ref.child("date") as DateTime;
    todo.description = ref.child("description") as String;
    todo.title = ref.child("title") as String;
    todo.todoid = ref.child("todoid") as String;
    return todo;
  }

  void deleteTodo({required String todoid, required String userid}) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$userType/$userid/todos/$todoid");
    ref.remove();
  }

  void updateTodo(
      {required userid, required String todoid, required TodoModel todo}) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$userType/$userid/todos/");
    ref.update({todoid: todo});
  }
}
