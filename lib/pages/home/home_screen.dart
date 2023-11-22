import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            surfaceTintColor: Colors.white,
            selectedIndex: bean.currentIndex,
            indicatorColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior
                .onlyShowSelected, // show selected label
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
