import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';

class MyPageController extends GetxController {
  User user = firebaseAuth.currentUser!;
}
