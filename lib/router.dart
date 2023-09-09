import 'package:get/get.dart';

import 'pages/auth/home/home_bind.dart';
import 'pages/auth/home/home_screen.dart';
import 'pages/auth/login/login_bind.dart';
import 'pages/auth/login/login_screen.dart';

class AppRouter {
  static List<GetPage> pages = [
    GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
      binding: LoginBind(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
      bindings: [HomeBind()],
    ),
  ];
}
