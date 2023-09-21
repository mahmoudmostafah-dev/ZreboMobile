import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../models/auth/user_model.dart';
import '../../../providers/user_provider.dart';
import '../../../shared/app_utils/util.dart';
import '../../../shared/storage_names.dart';
import '../../home/home_screen.dart';

class LoginBean extends GetxController {
  final _box = GetStorage();
  final UserProvider userProvider = Get.find();

  var formKey = GlobalKey<FormState>();

  bool isSignUp = false;

  void isSignUpAction() {
    isSignUp = !isSignUp;
    update();
  }

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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

  void authAction(BuildContext context) {
    if (isSignUp) {
      signUp(context);
    } else {
      signIn(context);
    }
  }

  void signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();

      try {
        UserModel userModel = await userProvider.loginOnline(
          userNameController.text,
          passwordController.text,
        );

        saveBox(userModel);

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
  }

  void signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      try {
        update();

        UserRequest userRequest = UserRequest(
          username: userNameController.text,
          password: passwordController.text,
          email: emailController.text,
        );

        UserModel userModel = await userProvider.signUp(userRequest);

        saveBox(userModel);

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
  }

  saveBox(UserModel userModel) {
    _box.write(StorageNames.tokenBox, userModel.token);
    _box.write(StorageNames.userNameBox, userModel.user.username);
    _box.write(StorageNames.userIdBox, userModel.user.id);
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
