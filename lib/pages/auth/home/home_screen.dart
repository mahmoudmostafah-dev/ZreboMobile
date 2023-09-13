import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/app_utils/size_config.dart';
import 'home_bean.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';
  HomeBean bean = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text('Welcome Home Screen'),
        ),
      ),
    );
  }
}
