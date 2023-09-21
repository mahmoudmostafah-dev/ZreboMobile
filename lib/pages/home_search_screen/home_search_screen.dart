import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/search_widget.dart';
import '../home/home_screen.dart';
import 'home_search_bean.dart';

class HomeSearchScreen extends StatelessWidget {
  static String routeName = '/homeSearch';
  HomeSearchBean bean = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SpecSearchWidget(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 40,
                    color: Get.isDarkMode ? Colors.white : SharedColor.primary,
                  ),
                  controller: bean.searchController,
                  focusNode: bean.focusNode,
                  autofocus: true,
                  textInputType: TextInputType.text,
                  labelText: 'labelText',
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(HomeScreen.routeName);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }
}
