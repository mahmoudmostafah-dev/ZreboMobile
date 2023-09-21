import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';

class SpecSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged? onChanged;
  final Widget? prefixIcon;
  final FormFieldValidator? validate;
  final String labelText;
  final TextInputAction? textInputAction;
  final Color? labelColor;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTab;
  final FocusNode? focusNode;
  final bool autofocus;

  const SpecSearchWidget({
    Key? key,
    required this.controller,
    required this.textInputType,
    this.onChanged,
    this.prefixIcon,
    this.validate,
    required this.labelText,
    this.textInputAction,
    this.labelColor,
    this.suffixIcon,
    this.readOnly = false,
    this.onTab,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Get.isDarkMode ? Colors.white : SharedColor.primary,
      onChanged: onChanged,
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autofocus,
      decoration: InputDecoration(
        fillColor:
            Get.isDarkMode ? SharedColor.getLogoColorFive : Colors.grey.shade50,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 16,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        floatingLabelBehavior:
            FloatingLabelBehavior.never, // Hide label when focused
      ),
      validator: validate,
      style: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 20,
      ),
      textInputAction: textInputAction,
      onTap: onTab,
    );
  }
}
