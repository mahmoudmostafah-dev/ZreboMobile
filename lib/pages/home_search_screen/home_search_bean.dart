import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchBean extends GetxController {
  TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    searchController.dispose();
  }
}
