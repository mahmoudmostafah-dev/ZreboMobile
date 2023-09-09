import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_utils/util.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget(
      {Key? key,
      required this.disKey,
      required this.child,
      this.onConfirm,
      this.onCancel})
      : super(key: key);

  final Key disKey;
  final Widget child;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: disKey,
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: const <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
                size: 50,
              ),
              //Text('Move to favorites', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return Util.getDialog(
          middleText: 'delMessage'.tr,
          onConfirm: onConfirm,
          onCancel: onCancel,
        );
      },
      child: child,
    );
  }
}
