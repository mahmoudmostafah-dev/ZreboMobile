import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vortex_zrebo_mobile/pages/item/item_screen_bean.dart';
import 'package:vortex_zrebo_mobile/shared/widgets/text_utils.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/search_widget.dart';
import '../home_search_screen/home_search_screen.dart';
import 'widgets/item_type_widget.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemScreenBean>(
      builder: (bean) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              color: Colors.grey.shade100,
              child: SpecSearchWidget(
                prefixIcon: Icon(
                  Icons.search,
                  size: 40,
                  color: Get.isDarkMode ? Colors.white : SharedColor.primary,
                ),
                controller: bean.searchController,
                textInputType: TextInputType.text,
                labelText: 'labelText',
                onTab: () => Get.toNamed(HomeSearchScreen.routeName),
              ),
            ),
            const SizedBox(height: 10),
            TextUtils(
              text: 'اكتشف كل الاكلات'.tr,
              color: Colors.black,
              fontSize: 20,
            ),
            const SizedBox(height: 10),
            ItemTypeWidget(listItemType: bean.listItemType),
          ],
        ),
      ),
    );
  }
}
