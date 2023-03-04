import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final DateTime? date;
  final String? title;
  final List<Map<String, bool>>? repeat;
  final String? user;
  final String? creator;
  final bool? alarm;
  final String? description;
  final bool? complete;

  Todo({
    this.date,
    this.title,
    this.repeat,
    this.user,
    this.creator,
    this.alarm,
    this.description,
    this.complete,
  });

  factory Todo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Todo(
      date: data?['date'],
      title: data?['title'],
      repeat: data?['repeat'],
      user: data?['user'],
      creator: data?['creator'],
      alarm: data?['alarm'],
      description: data?['description'],
      complete: data?['complete'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (date != null) "date": date,
      if (title != null) "title": title,
      if (repeat != null) "repeat": repeat,
      if (user != null) "user": user,
      if (creator != null) "creator": creator,
      if (alarm != null) "alarm": alarm,
      if (description != null) "description": description,
      if (complete != complete) "alarm": complete,
    };
  }
}
