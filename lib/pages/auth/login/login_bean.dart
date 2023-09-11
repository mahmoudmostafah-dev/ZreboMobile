import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vortex_zrebo_mobile/models/auth/user_model.dart';

import '../../../providers/user_provider.dart';
import '../../../shared/app_utils/util.dart';
import '../../../shared/storage_names.dart';
import '../home/home_screen.dart';

class LoginBean extends GetxController {
  final _box = GetStorage();
  final UserProvider userProvider = Get.find();

  var formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var passwordObscureText = true;
  IconData passwordSuffix = Icons.visibility;

  void changeObscure() {
    passwordObscureText = !passwordObscureText;

    passwordSuffix =
        passwordObscureText ? Icons.visibility_off : Icons.visibility;
    //States
    update();
  }

  bool isLoading = false;

  late UserModel userModel;

  void login({
    required BuildContext context,
  }) async {
    isLoading = true;

    try {
      update();

      userModel = await userProvider.loginOnline(
          userNameController.text, passwordController.text);

      _box.write(StorageNames.tokenBox, userModel.token);
      _box.write(StorageNames.userNameBox, userModel.user.username);
      _box.write(StorageNames.userIdBox, userModel.user.id);

      print(userModel.token);
      Get.offAndToNamed(HomeScreen.routeName);
    } catch (e) {
      Util.getToastSnack(
        message: 'userNFound'.tr,
        context: context,
        toastState: ToastState.error,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  GoogleSignInAccount? _googleUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      //clientId: '1072468680137-nm8j6d828j2qrmckgnk5d3asger0tmrl.apps.googleusercontent.com',
      // scopes: [
      //   //'email',
      //   //'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  Future<void> signInGoogle() async {
    try {
      print('done');
      _googleUser = await _googleSignIn.signIn();

      print(_googleUser?.email);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    _googleUser = null;
  }

  Future<void> facebookLogin() async {
    try {
      final FacebookAuth facebookAuth = FacebookAuth.instance;

      final LoginResult result =
          await facebookAuth.login(permissions: ['public_profile', 'email']);

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        print('Logged in successfully!');
        print('User ID: ${accessToken.userId}');
        print('Access Token: ${accessToken.token}');
        // You can use the access token to make Facebook API requests.
      } else {
        print('Facebook login failed.');
      }
    } catch (e) {
      print('Error during Facebook login: $e');
    }
  }
}
