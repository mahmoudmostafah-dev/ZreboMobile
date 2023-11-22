import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/RestaurantItem.dart';
import '../../models/itemType.dart';
import '../../providers/item_provider.dart';

class ItemScreenBean extends GetxController {
  TextEditingController searchController = TextEditingController();
  final CarouselController carouselController = CarouselController();
  // final pageController = PageController(viewportFraction: 0.8, keepPage: true);

  // ScrollController scrollController = ScrollController();

  ItemProvider itemProvider = Get.find();
  //final _box = GetStorage();

  List<ItemTypeModel> listItemType = [];
  List<RestaurantItemResult> listRestaurantItem = [];

  int restaurantItemIndex = 0;

  @override
  Future<void> onInit() async {
    await getAllItemTypePag();
    await getAllRestWithItemsPaginated(firstTime: true);

    // TODO: implement onInit

    super.onInit();
  }

  Future<void> getAllItemTypePag() async {
    listItemType.clear();

    ItemTypePaginated paginated =
        await itemProvider.getAllItemTypePaginated(pageSize: 9);

    listItemType = paginated.results;

    listItemType.add(ItemTypeModel(id: -1, name: 'all'.tr, image: ''));

    update();
  }

  int page = 0;
  String? nextUrl;

  Future<void> getAllRestWithItemsPaginated({bool firstTime = false}) async {
    page++;
    if (firstTime) {
      listRestaurantItem.clear();

      RestaurantItemPaginated paginated =
          await itemProvider.getAllRestWithItemsPaginated(page: page);

      nextUrl = paginated.next;

      listRestaurantItem = paginated.results;
    } else {
      if (nextUrl != null) {
        RestaurantItemPaginated paginated =
            await itemProvider.getAllRestWithItemsPaginated(page: page);

        nextUrl = paginated.next;

        listRestaurantItem.addAll(paginated.results);
      }
    }

    update();
  }

  void restaurantItemChange(int index) {
    restaurantItemIndex = index;
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    // TODO: implement onClose
  }
}
