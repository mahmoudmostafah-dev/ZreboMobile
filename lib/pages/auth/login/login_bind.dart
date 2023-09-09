import 'package:get/get.dart';

import '../../../providers/user_provider.dart';
import 'login_bean.dart';

class LoginBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginBean());
    Get.lazyPut(() => UserProvider());
  }
}
