import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/app_utils/size_config.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/search_widget.dart';
import '../../home_search_screen/home_search_screen.dart';

class ItemSearchWidget extends StatelessWidget {
  const ItemSearchWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 8,
      color: Colors.grey.shade100,
      child: SpecSearchWidget(
        prefixIcon: Icon(
          Icons.search,
          size: 40,
          color: Get.isDarkMode ? Colors.white : SharedColor.primary,
        ),
        controller: controller,
        textInputType: TextInputType.text,
        labelText: 'findRestOrFood'.tr,
        onTab: () => Get.toNamed(HomeSearchScreen.routeName),
      ),
    );
  }
}
