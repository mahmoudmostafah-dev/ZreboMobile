import 'package:flutter/material.dart';

class SpecDividerWidget extends StatelessWidget {
  const SpecDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 2.0,
        color: Colors.grey[500],
      ),
    );
  }
}
