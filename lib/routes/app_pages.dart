import 'package:get/get.dart';
import 'package:solution_challenge/bindings/login_binding.dart';
import 'package:solution_challenge/view/login/login_page.dart';
import 'package:solution_challenge/view/login/register/register_complete_page.dart';
import 'package:solution_challenge/view/login/register/register_name_page.dart';
import 'package:solution_challenge/view/login/register/register_number_page.dart';
import 'package:solution_challenge/view/login/register/register_type_page.dart';
part './app_routes.dart';

// 앱 내 페이지를 정의하는 공간, 페이지 만든 후 여기에 정의해주세요
class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: Routes.REGISTER_TYPE,
      page: () => const RegisterTypePage(),
    ),
    GetPage(
      name: Routes.REGISTER_NAME,
      page: () => const RegisterNamePage(),
    ),
    GetPage(
      name: Routes.REGISTER_NUMBER,
      page: () => const RegisterNumberPage(),
    ),
    GetPage(
      name: Routes.REGISTER_COMPLETE,
      page: () => const RegisterCompletePage(),
    ),
  ];
}
