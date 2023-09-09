import 'package:get/get.dart';

import 'home_bean.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeBean());
  }
}
