import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/itemType.dart';
import '../../providers/item_provider.dart';

class ItemScreenBean extends GetxController {
  TextEditingController searchController = TextEditingController();

  ItemProvider itemProvider = Get.find();
  //final _box = GetStorage();

  List<ItemTypeModel> listItemType = [];

  int page = 0;
  String? nextUrl;

  @override
  Future<void> onInit() async {
    await getAllItemTypePag(firstTime: true);

    while (nextUrl != null) {
      await getAllItemTypePag(firstTime: false);
    }
    // TODO: implement onInit

    super.onInit();
  }

  Future<void> getAllItemTypePag({bool firstTime = false}) async {
    page++;
    if (firstTime) {
      listItemType.clear();

      ItemTypePaginated paginated =
          await itemProvider.getAllItemTypePaginated(page);

      nextUrl = paginated.next;

      listItemType = paginated.results;
    } else {
      if (nextUrl != null) {
        ItemTypePaginated paginated =
            await itemProvider.getAllItemTypePaginated(page);

        nextUrl = paginated.next;

        listItemType.addAll(paginated.results);
      }
    }

    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    // TODO: implement onClose
  }
}
