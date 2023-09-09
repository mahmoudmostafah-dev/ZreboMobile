import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';

class SpecialCheckBox extends StatelessWidget {
  const SpecialCheckBox({
    Key? key,
    this.fontSize = 14,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final double fontSize;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      checkColor: Get.isDarkMode ? Colors.black : Colors.white,
      activeColor:
          Get.isDarkMode ? SharedColor.primaryDark : SharedColor.primary,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8),
      //   side: const BorderSide(color: Colors.grey),
      // ),
      side: BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black),
      visualDensity: VisualDensity.standard,
    );
  }
}
