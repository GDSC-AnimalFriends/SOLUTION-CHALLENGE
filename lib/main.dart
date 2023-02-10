import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/view/theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // 프로젝트 루트입니다
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      theme: appThemeData,
      defaultTransition: Transition.fade, //전환 효과
    );
  }
}



