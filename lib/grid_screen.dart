import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'grid_controller.dart';

class GridScreen extends GetView<GridController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech To Text Test App'),
      ),
      body: Obx(() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        //itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //controller.onItemTap(index);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              //color: controller.items[index].isListening ? Colors.green : Colors.blue,
              child: Center(
                child: Text(
                  //controller.items[index].text,
                  '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}