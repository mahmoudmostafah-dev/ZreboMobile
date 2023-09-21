import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vortex_zrebo_mobile/pages/home/widgets/Nav_Dest_Icon.dart';

import '../../../shared/widgets/text_utils.dart';
import '../item/item_screen.dart';
import '../order/order_screen.dart';
import '../profile/profile_screen.dart';

class HomeBean extends GetxController {
  int currentIndex = 0;

  TextEditingController searchController = TextEditingController();
  List<NavigationDestination> barItemList = [
    NavigationDestination(
      selectedIcon:
          CustomNavDestIcon(iconData: Icons.delivery_dining, isSelected: true),
      icon: CustomNavDestIcon(iconData: Icons.delivery_dining),
      label: 'item'.tr,
    ),
    NavigationDestination(
      selectedIcon: CustomNavDestIcon(
          iconData: Icons.shopping_cart_checkout, isSelected: true),
      icon: CustomNavDestIcon(iconData: Icons.shopping_cart_checkout),
      label: 'order'.tr,
    ),
    NavigationDestination(
      selectedIcon: CustomNavDestIcon(
          iconData: Icons.supervised_user_circle, isSelected: true),
      icon: CustomNavDestIcon(iconData: Icons.supervised_user_circle),
      label: 'profile'.tr,
    ),
  ];

  List<Widget> screenList = [
    ItemScreen(), //index 0
    OrderScreen(),
    ProfileScreen(),
  ];

  List<Widget> titleList = [
    TextUtils(text: 'carDefine'.tr),
    TextUtils(text: 'customerDefine'.tr),
    TextUtils(text: 'expenseDefine'.tr),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    update();
  }
}
