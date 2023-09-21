import 'package:get/get.dart';

import 'home_search_bean.dart';

class HomeSearchBind extends Bindings {
  @override
  void dependencies() {
    // Get.put(HomeSearchBean());

    Get.lazyPut(() => HomeSearchBean());
  }
}
