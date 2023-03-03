import 'package:get/get.dart';
import 'package:solution_challenge/bindings/home_binding.dart';
import 'package:solution_challenge/bindings/login_binding.dart';
import 'package:solution_challenge/bindings/mypage_binding.dart';
import 'package:solution_challenge/bindings/register_binding.dart';
import 'package:solution_challenge/bindings/todo_binding.dart';
import 'package:solution_challenge/view/home/home_page.dart';
import 'package:solution_challenge/view/home/home_subpages/alarm_page.dart';
import 'package:solution_challenge/view/login/login_page.dart';
import 'package:solution_challenge/view/mypage/info_care_apply/info_care_apply_page.dart';
import 'package:solution_challenge/view/mypage/manage_my_account/my_account_page.dart';
import 'package:solution_challenge/view/mypage/manage_subscribe/subscribe_add_page.dart';
import 'package:solution_challenge/view/mypage/manage_subscribe/subscriber_page.dart';
import 'package:solution_challenge/view/mypage/setting_app/setting_page.dart';
import 'package:solution_challenge/view/todo/todo_page.dart';
import 'package:solution_challenge/view/login/register/register_complete_page.dart';
import 'package:solution_challenge/view/login/register/register_name_page.dart';
import 'package:solution_challenge/view/login/register/register_number_page.dart';
import 'package:solution_challenge/view/login/register/register_type_page.dart';
import 'package:solution_challenge/view/mypage/my_page.dart';

part './app_routes.dart';

// 앱 내 페이지를 정의하는 공간, 페이지 만든 후 여기에 정의해주세요
class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER_TYPE,
      page: () => const RegisterTypePage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.REGISTER_NAME,
      page: () => const RegisterNamePage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.REGISTER_NUMBER,
      page: () => const RegisterNumberPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.REGISTER_COMPLETE,
      page: () => const RegisterCompletePage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.TODO,
      page: () => const TodoPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: Routes.MYPAGE,
      page: () => const MyPage(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.MYACCOUNT_MANAGE,
      page: () => const MyAccountManage(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.SUBSCRIBER_MANAGE,
      page: () => const SubscriberManage(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.INFO_CARE_APPLY,
      page: () => const InfoCareApply(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingPage(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.SUBSCRIBE_ADD,
      page: () => const SubscribeAddPage(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.ALARM,
      page: () => AlarmPage(),
      binding: MyPageBinding(),
    ),
  ];
}
