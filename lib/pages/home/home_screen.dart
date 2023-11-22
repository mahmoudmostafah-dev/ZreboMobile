import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vortex_zrebo_mobile/shared/styles/colors.dart';

import '../../../shared/app_utils/size_config.dart';
import 'home_bean.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: GetBuilder<HomeBean>(
        builder: (bean) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: bean.screenList[bean.currentIndex],
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor:
                Get.isDarkMode ? SharedColor.darkGreyClr : Colors.white,
            surfaceTintColor:
                Get.isDarkMode ? SharedColor.darkGreyClr : Colors.white,
            selectedIndex: bean.currentIndex,
            indicatorColor:
                Get.isDarkMode ? SharedColor.darkGreyClr : Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior
                .alwaysShow, // show selected label

            onDestinationSelected: (index) {
              bean.changeBottom(index);
            },
            destinations: bean.barItemList,
          ),
        ),
      ),
    );
  }
}
