import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_utils/size_config.dart';
import 'text_utils.dart';

class AlertDialogWidget extends StatelessWidget {
  AlertDialogWidget({
    Key? key,
    required this.middleText,
    required this.onConfirm,
    required this.onCancel,
    this.backgroundColor,
  }) : super(key: key);

  final String middleText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  Color? backgroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      title: TextUtils(
        text: 'confirm'.tr,
        textAlign: TextAlign.center,
        color: Colors.black,
      ),
      content: TextUtils(
        text: middleText,
        color: Colors.black,
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
              onPressed: onConfirm,
              child: TextUtils(
                text: 'accept'.tr,
                color: Colors.green,
              ),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
              onPressed: onCancel,
              child: TextUtils(
                text: 'cancel'.tr,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
