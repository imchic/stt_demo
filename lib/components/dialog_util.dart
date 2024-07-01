import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogUtil {

  /// [showAlertDialog] 알럿창을 띄워줍니다.
  static void showAlertDialog(BuildContext context, String title,
      String message, Function onOk, Function onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Get.back();
                onCancel();
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Get.back();
                onOk();
              },
            ),
          ],
        );
      },
    );
  }

  /// [showBottomSheet] 바텀 시트를 띄워줍니다.
  static void showBottomSheet(BuildContext context, Widget child) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: child),
          ],
        )
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

}
