import 'package:vortex_zrebo_mobile/models/auth/user_model.dart';

import '../shared/network/end_points.dart';
import '../shared/network/remote/dio_helper.dart';

class UserProvider {
  Future<UserModel> loginOnline(String userName, String password) async {
    var value = await DioHelper.postData(url: EndPoint.apiLogin, data: {
      'username': userName,
      'password': password,
    });

    print('$userName $password');
    if (value!.statusCode == 200 || value!.statusCode == 201) {
      return UserModel.fromJson(value.data);
    } else {
      return throw Exception("Failed to load Users");
    }
  }
}
