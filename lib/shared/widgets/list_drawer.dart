import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';
import 'text_utils.dart';

class SpecListDrawer extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  const SpecListDrawer(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Get.isDarkMode ? SharedColor.primaryDark : SharedColor.primary,
      ),
      title: TextUtils(
        text: text,
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w900,
      ),
      onTap: onTap,
    );
  }
}
