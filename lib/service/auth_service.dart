import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/model/user_model.dart';

class AuthService {
  //회원가입
  Future<bool> register(UserModel userModel) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password);

      DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");
      ref.child(credential.user!.uid).set(userModel.toJson());

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("6자이상 비밀번호가 필요합니다");
      } else if (e.code == 'email-already-in-use') {
        log("가입된 이메일 입니다");
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  //로그인
  Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("가입된 이메일이 아닙니다");
      } else if (e.code == 'wrong-password') {
        log("비밀번호가 틀렸습니다");
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //로그아웃
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
