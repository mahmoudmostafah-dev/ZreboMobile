import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/text_utils.dart';
import '../item/item_screen.dart';
import '../order/order_screen.dart';
import '../profile/profile_screen.dart';
import 'widgets/Nav_Dest_Icon.dart';

class HomeBean extends GetxController {
  int currentIndex = 0;

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
    print(index);

    switch (index) {
      case 0:
        // Get.put(ItemScreenBind());
        print(index);

      case 1:
        print(index);
      case 2:
        print(index);
    }

    currentIndex = index;
    update();
  }
}
