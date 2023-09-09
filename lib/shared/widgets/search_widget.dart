import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';

class SpecSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged? onChanged;
  final IconData? prefixIcon;
  final FormFieldValidator validate;
  final String labelText;
  final TextInputAction? textInputAction;
  final Color? labelColor;
  final Widget? suffixIcon;
  final bool readOnly;

  const SpecSearchWidget({
    Key? key,
    required this.controller,
    required this.textInputType,
    this.onChanged,
    this.prefixIcon,
    required this.validate,
    required this.labelText,
    this.textInputAction,
    this.labelColor,
    this.suffixIcon,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Get.isDarkMode ? Colors.white : SharedColor.primary,
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: InputDecoration(
        fillColor: Get.isDarkMode ? SharedColor.getLogoColorFive : Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : SharedColor.primary,
          fontSize: 16,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Get.isDarkMode ? Colors.white : SharedColor.primary,
        ),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
      validator: validate,
      style: TextStyle(
        color: Get.isDarkMode ? Colors.white : SharedColor.primary,
        fontSize: 20,
      ),
      textInputAction: textInputAction,
    );
  }
}
