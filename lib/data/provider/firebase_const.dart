import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/util/const_key.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
bool isOldUser = firebaseAuth.currentUser!.photoURL == TYPE_OLD; // 노인 유저인지?
DatabaseReference database = FirebaseDatabase.instance.ref();
