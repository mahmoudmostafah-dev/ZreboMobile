import 'package:get/get.dart';
import 'package:vortex_zrebo_mobile/pages/item/item_screen_bind.dart';
import 'package:vortex_zrebo_mobile/pages/itemType/item_type_screen.dart';

import 'pages/auth/login/login_bind.dart';
import 'pages/auth/login/login_screen.dart';
import 'pages/home/home_bind.dart';
import 'pages/home/home_screen.dart';
import 'pages/home_search_screen/home_search_bind.dart';
import 'pages/home_search_screen/home_search_screen.dart';
import 'pages/itemType/item_type_screen_bind.dart';

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
      bindings: [ItemScreenBind(), HomeBind()],
    ),
    GetPage(
      name: HomeSearchScreen.routeName,
      page: () => HomeSearchScreen(),
      bindings: [HomeSearchBind()],
    ),
    GetPage(
      name: ItemTypeScreen.routeName,
      page: () => ItemTypeScreen(),
      bindings: [ItemTypeScreenBind()],
    ),
  ];
}
