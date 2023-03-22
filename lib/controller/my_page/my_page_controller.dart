import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/provider/firebase_client.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/service/auth_service.dart';

class MyPageController extends GetxController {
  User user = firebaseAuth.currentUser!;
  String imgUrl = FirebaseClient().getImgUrl();

  void logout() {
    AuthService().logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
