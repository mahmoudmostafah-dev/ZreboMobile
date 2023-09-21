import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class CustomNavDestIcon extends StatelessWidget {
  CustomNavDestIcon(
      {super.key, required this.iconData, this.isSelected = false});

  final IconData iconData;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 50,
      color: isSelected ? SharedColor.primary : Colors.grey.shade400,
    );
  }
}
