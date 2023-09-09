import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';

class SpecQtyTextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? initValue;
  final TextInputType? textInputType;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final IconData? prefixIcon;
  final FormFieldValidator? validate;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? suffixPressed;
  final GestureTapCallback? onTap;
  final bool readonly;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;
  final double fontSize;

  const SpecQtyTextFormWidget({
    Key? key,
    required this.controller,
    this.textInputType,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.validate,
    this.labelText,
    this.suffixIcon,
    this.suffixPressed,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction,
    this.focusNode,
    this.initValue,
    this.autofocus = false,
    this.obscureText = false,
    this.readonly = false,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initValue,
      keyboardType: textInputType,
      cursorColor: SharedColor.primary,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validate,
      onTap: onTap,
      readOnly: readonly,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      autofocus: autofocus,
      focusNode: focusNode,
      style: TextStyle(
        color: Get.isDarkMode ? Colors.white : SharedColor.primary,
        fontSize: fontSize,
        //fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
