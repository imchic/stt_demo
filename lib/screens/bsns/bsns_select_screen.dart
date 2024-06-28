import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/utils/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bsns_select_controller.dart';

/// [BsnsSelectScreen] 사업선택 화면
class BsnsSelectScreen extends GetView<BsnsController> {
  const BsnsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BsnsController());

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: SvgPicture.asset('assets/images/ic_kwater_logo.svg', color: Colors.white),
        ),
        title: Obx(() => Text(controller.navItems[controller.selectedIndex.value])),
        centerTitle: true,
      ),
      body: Obx(
        () => SafeArea(
          child: Row(
            children: <Widget>[
              IntrinsicWidth(
                child: NavigationRail(
                  selectedIndex: controller.selectedIndex.value,
                  onDestinationSelected: (int index) {
                    controller.selectedIndex.value = index;
                    print(controller.selectedIndex.value);
                  },
                  //extended: controller.isNavOpen.value,
                  extended: controller.isNavOpen.value,
                  labelType: NavigationRailLabelType.none,
                  leading: controller.isNavOpen.value
                      ? Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 16),
                            onPressed: () {
                              controller.isNavOpen.toggle();
                            },
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {
                            controller.isNavOpen.toggle();
                          },
                        ),
                  groupAlignment: -0.9,
                  minExtendedWidth: 200,
                  minWidth: 56,
                  destinations: [
                    NavigationRailDestination(
                      padding: const EdgeInsets.all(8),
                      icon: const Icon(Icons.note_alt_rounded, size: 30),
                      //selectedIcon: const Icon(Icons.info),
                      label: const Text('사업관리', style: TextStyle(fontSize: 16)),
                    ),
                    NavigationRailDestination(
                      padding: const EdgeInsets.all(8),
                      icon: const Icon(Icons.people, size: 30),
                      //selectedIcon: const Icon(Icons.settings),
                      label: const Text('소유자관리', style: TextStyle(fontSize: 16)),
                    ),
                    NavigationRailDestination(
                      padding: const EdgeInsets.all(8),
                      icon: const Icon(Icons.note_add_outlined, size: 30),
                      //selectedIcon: const Icon(Icons.question_answer),
                      label: const Text('실태조사', style: TextStyle(fontSize: 16)),
                    ),
                    NavigationRailDestination(
                      padding: const EdgeInsets.all(8),
                      icon: const Icon(Icons.info_outlined, size: 30),
                      //selectedIcon: const Icon(Icons.info),
                      label: const Text('통계정보', style: TextStyle(fontSize: 16)),
                    ),
                    NavigationRailDestination(
                      padding: const EdgeInsets.all(8),
                      icon: const Icon(Icons.dashboard, size: 30),
                      //selectedIcon: const Icon(Icons.settings),
                      label: const Text('고객카드', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              VerticalDivider(thickness: 1, width: 1),
              // This is the main content.
              Expanded(
                child: IndexedStack(
                  index: controller.selectedIndex.value,
                  children: <Widget>[
                    buildRow1(),
                    buildRow2(),
                    buildRow2(),
                    buildRow2(),
                    buildRow2(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: gray300, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      // border line color
      shadowColor: Colors.grey[200],
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffeff5ff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: const Text('댐',
                          style: TextStyle(
                              color: Color(0xff1d56bc),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xfffff1e4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: const Text('건설',
                          style: TextStyle(
                              color: Color(0xffff7f00), fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: const Text(
                      '(5101102)대교천 재해예상사업(차수 : ㅇ)',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                '장군면 도계리 340~ 연기면 세종리 금강합류점검',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff0f0f0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    //controller.search();
                  },
                  child: const Text('주관부서',
                      style: TextStyle(fontSize: 16, color: Color(0xff1d1d1d))),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '수도개발처 수도개발부 수도개발팀 홍길동',
                style: TextStyle(fontSize: 16),
              ),
              //more button
              const SizedBox(height: 20),
              Container(
                width: Get.width - 20,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff246beb),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('사업선택', style: TextStyle(fontSize: 20))),
              ),
              SizedBox(height: 10),
              Obx(
                () => Container(
                    width: Get.width - 20,
                    height: 60,
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '상세내용',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              // controller.isExpanded.value = !controller.isExpanded.value;
                              // print(controller.isExpanded.value);
                              controller.isExpanded.toggle();
                            },
                            icon: controller.isExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up, size: 24)
                                : const Icon(Icons.keyboard_arrow_down,
                                    size: 24),
                            iconSize: 24,
                          ),
                        ],
                      ),
                    )),
              ),
              Obx(() {
                if (controller.isExpanded.value) {
                  return Card(
                    color: Color(0xfff8f8f8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: gray300, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border line color
                    shadowColor: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('사업시작일',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              const Text('2021-01-01',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('사업종료일',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              const Text('2021-12-31',
                                  style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 10),
                              // 승인일
                              const Text('승인일',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              const Text('2021-01-01',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: [
                              // 관보고시일
                              const Text('관보고시일',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              const Text('2021-01-01',
                                  style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 10),
                              // 열람공고일
                              const Text('준공일',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              const Text('2021-01-01',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          buildTable(),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
              SizedBox(height: 10),
              // dropdown
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                InputDecorator(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: '1차 고시문',
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      style: const TextStyle(
                          color: gray600,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      items: const <String>['1차 고시문', '2차 고시문', '3차 고시문', '4차 고시문']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        //controller.changeDropdownValue(value);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavigationRail() {
    return NavigationRail(
      selectedIndex: 0,
      onDestinationSelected: (index) {
        //controller.changeNavigationIndex(index);
      },
      labelType: NavigationRailLabelType.selected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.info),
          selectedIcon: Icon(Icons.info),
          label: Text('Info'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
    );
  }

  Widget buildRow1() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 드롭다운
          Row(
            children: [
              //const Text('사업명', style: TextStyle(fontSize: 16)),
              //const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  child: DropdownButton(
                    isExpanded: true,
                    disabledHint: const Text('사업명'),
                    elevation: 5,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    value: '사업명',
                    items: const <String>['사업명', '사업명1', '사업명2', '사업명3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      //controller.changeDropdownValue(value);
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width - 20,
            child: buildRadio(),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width - 20,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2d2d2d),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                //controller.getBusinessList();
              },
              child: const Text('조회', style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow2() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
          ),
        ];
      },
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사업구역명',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          //controller.search();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xffeff5ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Color(0xff1d56bc)),
                          ),
                        ),
                        child: const Text('선택', style: TextStyle(color: Color(0xff1d56bc), fontSize: 20)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: gray300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '선택 된 사업구역명이 표시',
                            hintStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // radio
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {
                        //controller.changeRadioValue(value);
                      },
                    ),
                    const Text('수용', style: TextStyle(fontSize: 18)),
                    Radio(
                      value: 1,
                      groupValue: 0,
                      onChanged: (value) {
                        //controller.changeRadioValue(value);
                      },
                    ),
                    const Text('사용', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                const Text(
                  '소재지',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: gray300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '읍면동',
                            hintStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: gray300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '본번',
                            hintStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: gray300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '부번',
                            hintStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  '실태조사 차수 선택',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          //controller.search();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xffeff5ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Color(0xff1d56bc)),
                          ),
                        ),
                        child: const Text('선택', style: TextStyle(color: Color(0xff1d56bc), fontSize: 20)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: gray300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '선택 된 차수 표시',
                            hintStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // radio
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {
                        //controller.changeRadioValue(value);
                      },
                    ),
                    const Text('소유자', style: TextStyle(fontSize: 18)),
                    Radio(
                      value: 1,
                      groupValue: 0,
                      onChanged: (value) {
                        //controller.changeRadioValue(value);
                      },
                    ),
                    const Text('관계인', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: Get.width - 20,
                  height: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: '이름을 입력해주세요',
                      hintStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: Get.width - 20,
                  height: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: '등록번호를 입력해주세요',
                      hintStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.width - 20,
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2d2d2d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      //controller.getBusinessList();
                    },
                    child: const Text('조회', style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),

          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildTable() {
    return SizedBox(
      // height: 200,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(0.55),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(2),
        },
        defaultColumnWidth: const FlexColumnWidth(1),
        border: TableBorder.all(color: gray300),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Color(0xffedf1f5),
                  child: Center(
                      child: const Text('관련고시번호',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: const Text('세종특별자치시 고시 2022호 2021-01-01',
                          style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Color(0xffedf1f5),
                  child: Center(
                      child: const Text('시행방법',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: const Text('-', style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(8.0),
                  color: Color(0xffedf1f5),
                  child: Center(
                      child: const Text('사업목적',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: const Text('홍수 범람 및 피해 등 재해발생 위험성이 높은 하천(대교천)에 대하여 제방축조 및 호안정비 등 하천정비를 시행하여 재해를 사전에 예방하고자 함',
                          style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Color(0xffedf1f5),
                  child: Center(
                      child: const Text('사업규모',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: const Text('-',
                          style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Color(0xffedf1f5),
                  child: Center(
                      child: const Text('근거법령',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: const Text('-',
                          style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 300,
                  padding: const EdgeInsets.all(8.0),
                  color: Color(0xffedf1f5),
                  child: Center(
                      child: const Text('사업구역정보',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: buildSfDataGrid(),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget buildSfDataGrid() {
    return SfDataGrid(
      source: controller.dataSource.value,
      columnWidthMode: ColumnWidthMode.fill,
      showHorizontalScrollbar: true,
      showVerticalScrollbar: true,
      allowColumnsDragging: true,
      highlightRowOnHover: true,
      selectionMode: SelectionMode.single,
      headerGridLinesVisibility: GridLinesVisibility.both,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'no',
            width: 100.0,
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  'NO.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
        GridColumn(
            columnName: 'areaNo',
            width: 100.0,
            autoFitPadding: const EdgeInsets.all(8.0),
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('구역번호', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizName',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('사업구역명', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizCount',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('필지수', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizArea',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('면적', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizDate',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('열람공고일', style: TextStyle(fontWeight: FontWeight.bold)))),
      ],
    );
  }

  Widget buildSfDataGrid2() {
    return SfDataGrid(
      source: controller.dataSource.value,
      columnWidthMode: ColumnWidthMode.fill,
      showHorizontalScrollbar: true,
      showVerticalScrollbar: true,
      allowColumnsDragging: true,
      highlightRowOnHover: true,
      selectionMode: SelectionMode.single,
      headerGridLinesVisibility: GridLinesVisibility.both,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'no',
            width: 100.0,
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  'NO.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
        GridColumn(
            columnName: 'areaNo',
            width: 100.0,
            autoFitPadding: const EdgeInsets.all(8.0),
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('소유자번호', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizName',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('소유자명', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizCount',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('소유자구분', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizArea',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('등록번호', style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizDate',
            label: Container(
                color: Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('핸드폰번호', style: TextStyle(fontWeight: FontWeight.bold)))),
      ],
    );
  }

  Widget buildRadio() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('사업구분(대)', style: TextStyle(fontSize: 16)),
        Radio(
          value: 0,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('댐', style: TextStyle(fontSize: 16)),
        Radio(
          value: 1,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('수도용지', style: TextStyle(fontSize: 16)),
        Radio(
          value: 2,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('택지개발', style: TextStyle(fontSize: 16)),
        Radio(
          value: 3,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('기타', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
