import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/itemType.dart';
import '../../providers/item_provider.dart';

class ItemTypeScreenBean extends GetxController {
  TextEditingController searchController = TextEditingController();

  ItemProvider itemProvider = Get.find();
  //final _box = GetStorage();

  List<ItemTypeModel> listItemType = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllItemTypeWithItemCount();
  }

  Future<void> getAllItemTypeWithItemCount() async {
    listItemType.clear();
    listItemType = await itemProvider.getAllItemTypeWithItemCount();

    update();
  }

  @override
  void onClose() {
    searchController.dispose();
  }
}
