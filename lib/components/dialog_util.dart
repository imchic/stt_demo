import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogUtil {
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
}
