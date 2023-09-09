import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';
import 'text_utils.dart';

class ElevatedButtonIconWidget extends StatelessWidget {
  const ElevatedButtonIconWidget(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Get.isDarkMode ? SharedColor.primaryDark : SharedColor.primary,
        ),
      ),
      onPressed: onPressed,
      icon: icon,
      label: TextUtils(
        text: text,
      ),
    );
  }
}
