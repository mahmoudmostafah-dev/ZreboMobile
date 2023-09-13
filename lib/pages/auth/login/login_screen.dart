import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../shared/app_utils/size_config.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/button_form_widget.dart';
import '../../../shared/widgets/condition_builder_widget.dart';
import '../../../shared/widgets/login_text_widget.dart';
import '../../../shared/widgets/text_utils.dart';
import 'login_bean.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: SizeConfig.safeBlockVertical * 23, //150.0,
            color: SharedColor.primary,
            child: Center(
              child: TextUtils(
                text: 'Zrebo'.tr,
                fontSize: SizeConfig.safeBlockHorizontal * 7,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.safeBlockHorizontal * 5,
                  end: SizeConfig.safeBlockHorizontal * 5,
                  top: SizeConfig.safeBlockHorizontal * 10,
                ),
                child: Center(
                  child: GetBuilder<LoginBean>(
                    builder: (loginBean) => Form(
                      key: loginBean.formKey,
                      child: Column(
                        children: [
                          Visibility(
                            visible: loginBean.isSignUp,
                            child: Column(
                              children: [
                                LoginTextWidget(
                                  controller: loginBean.emailController,
                                  labelText: 'email'.tr,
                                  textInputType: TextInputType.emailAddress,
                                  prefixIcon: Icons.email,
                                  validate: (value) {
                                    if (value.isEmpty && loginBean.isSignUp) {
                                      return 'emailNEmpty'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                    height: SizeConfig.safeBlockVertical * 2.5),
                              ],
                            ),
                          ),
                          LoginTextWidget(
                            controller: loginBean.userNameController,
                            labelText: 'userName'.tr,
                            textInputType: TextInputType.text,
                            prefixIcon: Icons.email,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'UserNEmpty'.tr;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                          LoginTextWidget(
                            controller: loginBean.passwordController,
                            labelText: 'password'.tr,
                            textInputType: TextInputType.text,
                            obscureText: loginBean.passwordObscureText,
                            prefixIcon: Icons.lock,
                            suffixIcon: loginBean.passwordSuffix,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'PassEmpty'.tr;
                              }
                              return null;
                            },
                            suffixPressed: () {
                              loginBean.changeObscure();
                            },
                            onFieldSubmitted: (value) {
                              loginBean.authAction(context);
                            },
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 6),
                          ConditionBuilderWidget(
                            condition: loginBean.isLoading,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            fallback: (context) => SpecButtonFormWidget(
                              text: loginBean.isSignUp
                                  ? 'signUp'.tr
                                  : 'signIn'.tr,
                              backGround: SharedColor.primary,
                              function: () {
                                loginBean.authAction(context);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                loginBean.isSignUpAction();
                              },
                              child: TextUtils(
                                text: loginBean.isSignUp
                                    ? 'iHaveAccount'.tr
                                    : 'newUser'.tr,
                                color: SharedColor.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2),
                          Visibility(
                            visible: !loginBean.isSignUp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    loginBean.facebookLogin();
                                  },
                                  icon: const Icon(
                                    Icons.facebook,
                                    size: 40,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(
                                    width: SizeConfig.safeBlockVertical * 2.5),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.apple, size: 40),
                                ),
                                SizedBox(
                                    width: SizeConfig.safeBlockVertical * 2.5),
                                IconButton(
                                  padding: const EdgeInsets.only(top: 10),
                                  onPressed: () {
                                    loginBean.signInGoogle();
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/icons8-google-240.svg'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
