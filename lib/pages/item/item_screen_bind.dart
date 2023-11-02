import 'package:get/get.dart';

import '../../providers/item_provider.dart';
import 'item_screen_bean.dart';

class ItemScreenBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemProvider());
    Get.put(ItemScreenBean());

    // Get.lazyPut(() => ItemScreenBean());
    Get.lazyPut(() => ItemProvider());
  }
}
