import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stt_demo/item.dart';
import 'package:stt_demo/item_datasource.dart';

class BsnsController extends GetxController {

  late SearchController searchController;

  // obx
  final dataSource = ItemDataSource(items: []).obs;

  // radio value
  RxInt radioValue = 0.obs;

  RxBool isExpanded = false.obs;


  @override
  void onInit() {
    super.onInit();
    searchController = SearchController();
    fetchItems();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  /// 사업 목록 조회
  fetchBsnsPlan() async {
    var items = <Item>[];
  }

  // fetch
  fetchItems() async {
    var items = <Item>[];
    for (var i = 0; i < 100; i++) {
      items.add(Item(
          no: i,
          areaNo: i,
          bizName: 'bizName $i',
          bizCount: 'bizCount $i',
          bizArea: 'bizArea $i',
          bizDate: DateTime.now().toString()
      ));
    }
    dataSource.value = ItemDataSource(items: items);
  }

  // search datasource value
  void searchDataSourceValue(String value) {
    dataSource.value = ItemDataSource(
        items: dataSource.value.rows
            .map((e) => e.getCells())
            .where((element) => element.any((element) => element.value.toString().contains(value)))
            .map((e) => Item(
            no: e[0].value,
            areaNo: e[1].value,
            bizName: e[2].value,
            bizCount: e[3].value,
            bizArea: e[4].value,
            bizDate: e[5].value
        ))
            .toList()
    );
  }

  // radio
  void changeRadioValue(int value) {
    radioValue.value = value;
  }



}