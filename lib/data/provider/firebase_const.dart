// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/util/const_key.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
bool isOldUser = firebaseAuth.currentUser!.photoURL == TYPE_OLD; // 노인 유저인지?
String? userType = firebaseAuth.currentUser!.photoURL; // 나의 타입 (노인,보호자)
String? myName = firebaseAuth.currentUser!.displayName;
String oppositeType = isOldUser ? TYPE_YOUNG : TYPE_OLD; //나와 반대의 타입
DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

const int SUCCESS = 0;
const int ERROR = 999;
const int FAIL_ONE = 1;
const int FAIL_SECOND = 2;
