import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'accdtlnvstg_controller.dart';

class AccdtlnvstgScreen extends GetView<AccdtlnvstgController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('실태조사서'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '실태조사서',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}