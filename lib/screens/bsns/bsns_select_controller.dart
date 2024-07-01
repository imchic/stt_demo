import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stt_demo/components/dialog_util.dart';

import 'package:stt_demo/item.dart';
import 'package:stt_demo/item_datasource.dart';

import 'bsns_model.dart';

class BsnsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late SearchController searchController;
  late TabController tabController;

  // obx
  final dataSource = ItemDataSource(items: []).obs;

  // radio value
  RxInt radioValue = 0.obs;

  RxBool isExpanded = false.obs;

  RxInt selectedIndex = 0.obs;
  RxBool isNavOpen = false.obs;

  RxList<BsnsModel> bsnsList = <BsnsModel>[].obs;

  RxList<String> navItems = [
    '사업관리',
    '소유자관리',
    '실태조사',
    '통계정보',
    '고객카드',
  ].obs;

  RxList businessList = [].obs;

  // 차수
  RxList<String> orderList = [
    '전체',
    '1차',
    '2차',
    '3차',
    '4차',
    '5차',
    '6차',
    '7차',
    '8차',
    '9차',
    '10차',
  ].obs;

  // tab Items
  final tabItems = [
    Tab(text: '사업목록'),
    Tab(text: '실태조사'),
    // Tab(text: '토지조서'),
    // Tab(text: '지장물조서'),
  ];

  @override
  void onInit() {
    super.onInit();
    searchController = SearchController();
    tabController = TabController(length: tabItems.length, vsync: this);
    fetchItems();
    //fetchBsnsList();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    searchController.dispose();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  // fetchBsnsList
  Future<List<BsnsModel>> fetchBsnsList() async {
    await Future.delayed(Duration(seconds: 2));

    var bsns = <BsnsModel>[];
    for (var i = 0; i < 10; i++) {
      bsns.add(BsnsModel(
          select: false,
          no: i,
          areaNo: i,
          bizName: '사업구역 $i',
          bizCount: 'bizCount $i',
          bizArea: 'bizArea $i',
          bizDate: DateTime.now().toString()));
    }

    print('fetchBsnsList');

    bsnsList.value = bsns;
    return bsnsList;
  }

  /// 사업 목록 조회
  fetchItems() async {
    var items = <Item>[];
    for (var i = 0; i < 10; i++) {
      items.add(Item(
          select: false,
          no: i,
          areaNo: i,
          bizName: 'bizName $i',
          bizCount: 'bizCount $i',
          bizArea: 'bizArea $i',
          bizDate: DateTime.now().toString()));
    }
    dataSource.value = ItemDataSource(items: items);
  }

  /// 검색
  void searchDataSourceValue(String value) {
    dataSource.value = ItemDataSource(
        items: dataSource.value.rows
            .map((e) => e.getCells())
            .where((element) => element
                .any((element) => element.value.toString().contains(value)))
            .map((e) => Item(
                no: e[0].value,
                areaNo: e[1].value,
                bizName: e[2].value,
                bizCount: e[3].value,
                bizArea: e[4].value,
                bizDate: e[5].value))
            .toList());
  }

  /// 라디오 값 변경
  void changeRadioValue(int value) {
    radioValue.value = value;
  }

  /// 사업 선택
  getBusinessList() async {
    for (var i = 0; i < 10; i++) {
      businessList.add('사업 $i');
    }

    DialogUtil.showBottomSheet(
      Get.context!,
      ListView.builder(
        itemCount: businessList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(businessList[index]),
            onTap: () {
              selectedIndex.value = index;
              isNavOpen.value = false;
            },
          );
        },
      ),
    );
  }

  /// 차수 선택
  getSelectOrder() async {
    DialogUtil.showBottomSheet(
      Get.context!,
      ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orderList[index]),
            onTap: () {
              selectedIndex.value = index;
              isNavOpen.value = false;
            },
          );
        },
      ),
    );
  }
}
