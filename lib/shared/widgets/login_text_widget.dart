import 'package:flutter/material.dart';

import '../styles/colors.dart';

class LoginTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final IconData? prefixIcon;
  final FormFieldValidator validate;
  final String labelText;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final GestureTapCallback? onTap;
  final bool readonly;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;

  const LoginTextWidget({
    Key? key,
    required this.controller,
    required this.textInputType,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefixIcon,
    required this.validate,
    required this.labelText,
    this.suffixIcon,
    this.suffixPressed,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction,
    this.focusNode,
    this.obscureText = false,
    this.autofocus = false,
    this.readonly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Colors.black,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: SharedColor.primary,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: SharedColor.primary,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: SharedColor.primary,
          ),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
      validator: validate,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onTap: onTap,
      readOnly: readonly,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      autofocus: autofocus,
      focusNode: focusNode,
    );
  }
}
