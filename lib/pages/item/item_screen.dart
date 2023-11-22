import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/app_utils/size_config.dart';
import '../../shared/widgets/text_utils.dart';
import 'item_screen_bean.dart';
import 'widgets/item_carousel_widget.dart';
import 'widgets/item_search_widget.dart';
import 'widgets/item_type_widget.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemScreenBean>(
      builder: (bean) => SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemSearchWidget(controller: bean.searchController),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              TextUtils(
                text: 'findAllFoods'.tr,
                color: Colors.black,
                fontSize: 20,
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              ItemTypeWidget(listItemType: bean.listItemType),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: bean.listRestaurantItem.length,
                  itemBuilder: (context, index) => ItemCarouselWidget(
                    index: index,
                    listRestaurantItem: bean.listRestaurantItem,
                    restaurantItemIndex: bean.restaurantItemIndex,
                    onPageChanged: (index, reason) =>
                        bean.restaurantItemChange(index),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
