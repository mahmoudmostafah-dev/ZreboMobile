import 'package:get/get.dart';

import 'item_type_screen_bean.dart';

class ItemTypeScreenBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemTypeScreenBean());
  }
}
