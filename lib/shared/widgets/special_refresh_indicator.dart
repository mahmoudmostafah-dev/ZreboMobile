import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SpecRefreshIndicator extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  const SpecRefreshIndicator(
      {Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: SharedColor.primary,
      color: SharedColor.getLogoColorSecond,
      strokeWidth: 5,
      child: child,
    );
  }
}
