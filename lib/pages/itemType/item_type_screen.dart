import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vortex_zrebo_mobile/pages/itemType/item_type_screen_bean.dart';
import 'package:vortex_zrebo_mobile/shared/widgets/text_utils.dart';

import '../../shared/app_utils/size_config.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/search_widget.dart';
import 'widgets/item_type_count_widget.dart';

class ItemTypeScreen extends StatelessWidget {
  static String routeName = '/ItemTypeScreen';

  const ItemTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ItemTypeScreenBean>(
          builder: (bean) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextUtils(
                  text: 'allFoods'.tr,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Container(
                  height: SizeConfig.safeBlockVertical * 8,
                  color: Colors.grey.shade100,
                  child: SpecSearchWidget(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 40,
                      color:
                          Get.isDarkMode ? Colors.white : SharedColor.primary,
                    ),
                    controller: bean.searchController,
                    textInputType: TextInputType.text,
                    labelText: 'findFood'.tr,
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Expanded(
                  child: ItemTypeCountWidget(listItemType: bean.listItemType),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
