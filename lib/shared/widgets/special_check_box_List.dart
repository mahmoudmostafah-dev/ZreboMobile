import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';
import 'text_utils.dart';

class SpecialCheckBoxList extends StatelessWidget {
  const SpecialCheckBoxList({
    Key? key,
    required this.text,
    this.fontSize = 14,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: TextUtils(
        text: text,
        fontSize: fontSize,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      tileColor: Get.isDarkMode ? SharedColor.darkGreyClr : Colors.white,
      value: value,
      onChanged: onChanged,
      checkColor: Get.isDarkMode ? Colors.black : Colors.white,
      activeColor:
          Get.isDarkMode ? SharedColor.primaryDark : SharedColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.grey),
      ),
      controlAffinity: ListTileControlAffinity.platform,
      side: const BorderSide(color: Colors.black),
      visualDensity: VisualDensity.standard,
    );
  }
}
