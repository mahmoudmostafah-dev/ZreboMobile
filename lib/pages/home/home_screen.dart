import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/app_utils/size_config.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/search_widget.dart';
import '../home_search_screen/home_search_screen.dart';
import 'home_bean.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';
  HomeBean bean = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: GetBuilder<HomeBean>(
        builder: (bean) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      Expanded(
                        child: SpecSearchWidget(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 40,
                            color: Get.isDarkMode
                                ? Colors.white
                                : SharedColor.primary,
                          ),
                          controller: bean.searchController,
                          textInputType: TextInputType.text,
                          labelText: 'labelText',
                          onTab: () => Get.toNamed(HomeSearchScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: bean.screenList[bean.currentIndex]),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
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
