import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/screens/bsns/bsns_model.dart';
import 'package:stt_demo/utils/colors.dart';
import 'package:stt_demo/utils/custom_sliver_persistent_headerdelegate.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../components/base_tabbar.dart';
import 'bsns_select_controller.dart';

/// [BsnsSelectScreen] 사업선택 화면
class BsnsSelectScreen extends GetView<BsnsController> {
  const BsnsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BsnsController());

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // 왼쪽 메뉴 버튼
            Expanded(flex: 1, child: Container(child: buildLeftVerticalMenu())),
            // 메인 뷰
            Expanded(
              flex: 7,
              child: FutureBuilder(
                future: controller.fetchBsnsList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return buildCenterView();
                },
              ),
            ),
            SizedBox(width: 10.w),
            VerticalDivider(
              width: 1,
              color: gray200.withOpacity(0.5),
            ),
            // 오른쪽 뷰
            Expanded(
              flex: 2,
              child: SizedBox(
                child: Center(
                    child: Text('선택된 사업구역이 표시됩니다.',
                        style: TextStyle(fontSize: 8.sp, color: gray600))),
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }

  /// [buildLeftVerticalMenu] 왼쪽 메뉴 버튼
  Widget buildLeftVerticalMenu() {
    return Container(
      color: Theme.of(Get.context!).colorScheme.primary,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: SvgPicture.asset(
              'assets/images/ic_kwater_logo.svg',
              width: 100.w,
              height: 60.h,
              colorFilter: ColorFilter.mode(
                  Colors.white, BlendMode.srcIn), // svg color change
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.navItems.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return ListTile(
                    title: Center(
                        child: Text(controller.navItems[index],
                            style: TextStyle(
                                color: controller.selectedIndex.value == index
                                    ? Colors.white
                                    : gray400,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold))),
                    onTap: () {
                      controller.selectedIndex.value = index;
                    },
                    selected: controller.selectedIndex.value == index,
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  /// [buildBsnsCard] 사업목록 카드
  Widget buildBsnsCard(BsnsModel bsns) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: gray300, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      // border line color
      shadowColor: Colors.grey[200],
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffeff5ff),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: Text('댐',
                          style: TextStyle(
                              color: Color(0xff1d56bc), fontSize: 8.sp)),
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xfffff1e4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: Text('건설',
                          style: TextStyle(
                              color: Color(0xffff7f00), fontSize: 8.sp)),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      bsns.title ?? '',
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Divider(color: gray300),
              SizedBox(height: 10.h),
              Text(
                bsns.bizArea ?? '',
                style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    color: gray600),
              ),
              SizedBox(height: 20.h),
              /*Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xfff0f0f0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    //controller.search();
                  },
                  child: Text('주관부서',
                      style:
                          TextStyle(color: Color(0xff1d1d1d), fontSize: 10.sp)),
                ),
              ),*/
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xfff0f0f0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {
                    //controller.search();
                  },
                  child: Text('주관부서',
                      style:
                          TextStyle(color: Color(0xff1d1d1d), fontSize: 8.sp)),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                '수도개발처 수도개발부 수도개발팀 홍길동',
                style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    color: gray600),
              ),
              SizedBox(height: 10.h),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '상세내용',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: gray600,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        // controller.isExpanded.value = !controller.isExpanded.value;
                        // print(controller.isExpanded.value);
                        controller.isExpanded.toggle();
                      },
                      icon: controller.isExpanded.value
                          ? Icon(Icons.keyboard_arrow_up,
                              size: 14.sp, color: gray500)
                          : Icon(Icons.keyboard_arrow_down,
                              size: 14.sp, color: gray500),
                      iconSize: 14.sp,
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.isExpanded.value) {
                  return Card(
                    color: const Color(0xfff8f8f8),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: gray300, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border line color
                    shadowColor: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text('사업시작일',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('2021-01-01',
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text('사업종료일',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('2021-12-31',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(width: 10),
                              // 승인일
                              Text('승인일',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('2021-01-01',
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              // 관보고시일
                              Text('관보고시일',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('2021-01-01',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(width: 10),
                              // 열람공고일
                              Text('준공일',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Text('2021-01-01',
                                  style: TextStyle(fontSize: 14)),
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
              const SizedBox(height: 10),
              // dropdown
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: gray300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: '1차 고시문',
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (String? newValue) {
                          //controller.changeDropdownValue(newValue);
                        },
                        items: <String>[
                          '1차 고시문',
                          '2차 고시문',
                          '3차 고시문',
                          '4차 고시문',
                          '5차 고시문'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value,
                                  style: const TextStyle(fontSize: 14)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
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

  Widget buildCenterView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTabBar(
            tabItems: controller.tabItems,
            controller: controller.tabController,
          ),
          Expanded(
            child: TabBarView(
              physics: ClampingScrollPhysics(),
              controller: controller.tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.bsnsList.length,
                          itemBuilder: (context, index) {
                            return buildBsnsCard(controller.bsnsList[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                buildRow2(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow2() {
    return CustomScrollView(
      slivers: <Widget>[
        // 고정헤더
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: CustomSliverPersistentHeaderDelegate(
            minHeight: 80.0,
            maxHeight: 80.0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffeff5ff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: const Text('댐',
                          style: TextStyle(
                              color: Color(0xff1d56bc),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfffff1e4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: const Text('건설',
                          style: TextStyle(
                              color: Color(0xffff7f00), fontSize: 14)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      '(5101102)대교천 재해예상사업(차수 : ㅇ)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // SliverAppBar(
        //   pinned: true,
        //   floating: false,
        //   expandedHeight: 200.0,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: const Text('사업관리'),
        //     background: SvgPicture.asset(
        //       'assets/images/ic_kwater_logo.svg',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '사업구역명',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getBusinessList();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xffeff5ff),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    const BorderSide(color: Color(0xff1d56bc)),
                              ),
                            ),
                            child: const Text('선택',
                                style: TextStyle(
                                    color: Color(0xff1d56bc), fontSize: 20)),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                                hintStyle: const TextStyle(fontSize: 14),
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
                    const SizedBox(height: 10),
                    const Text(
                      '소재지',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
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
                                hintStyle: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                                hintStyle: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                                hintStyle: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '실태조사 차수 선택',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getSelectOrder();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xffeff5ff),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    const BorderSide(color: Color(0xff1d56bc)),
                              ),
                            ),
                            child: const Text('선택',
                                style: TextStyle(
                                    color: Color(0xff1d56bc), fontSize: 20)),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                                hintStyle: const TextStyle(fontSize: 14),
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
                    const SizedBox(height: 10),
                    Container(
                      width: Get.width - 20,
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: '이름을 입력해주세요',
                          hintStyle: const TextStyle(fontSize: 14),
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
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width - 20,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2d2d2d),
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //controller.search();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(color: Color(0xff2d2d2d)),
                        elevation: 0,
                      ),
                      child: Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Row(
                          children: [
                            Text('소유자등록',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: gray700)),
                            Icon(Icons.add, color: gray700),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildSfDataGrid2()
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTable() {
    return SizedBox(
      // height: 200,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(0.35),
          1: FlexColumnWidth(2),
        },
        defaultColumnWidth: const FlexColumnWidth(1),
        border: TableBorder.all(color: gray300),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xffedf1f5),
                  child: Center(
                      child: Text('관련고시번호',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: Text('세종특별자치시 고시 2022호 2021-01-01',
                          style: TextStyle(fontSize: 8.sp))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xffedf1f5),
                  child: Center(
                      child: Text('시행방법',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: Text('-', style: TextStyle(fontSize: 8.sp))),
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
                  color: const Color(0xffedf1f5),
                  child: Center(
                      child: Text('사업목적',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: Text(
                          '홍수 범람 및 피해 등 재해발생 위험성이 높은 하천(대교천)에 대하여 제방축조 및 호안정비 등 하천정비를 시행하여 재해를 사전에 예방하고자 함',
                          style: TextStyle(fontSize: 8.sp))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xffedf1f5),
                  child: Center(
                      child: Text('사업규모',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: Text('-', style: TextStyle(fontSize: 8.sp))),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xffedf1f5),
                  child: Center(
                      child: Text('근거법령',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp))),
                ),
              ),
              TableCell(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: Text('-', style: TextStyle(fontSize: 8.sp))),
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
                  color: const Color(0xffedf1f5),
                  child: Center(
                      child: Text('사업구역정보',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp))),
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
        // select
        GridColumn(
            columnName: 'select',
            width: 30.0,
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.sp),
                ))),
        GridColumn(
            columnName: 'no',
            width: 60.0,
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'NO.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.sp),
                ))),
        GridColumn(
            columnName: 'areaNo',
            width: 80.0,
            autoFitPadding: const EdgeInsets.all(8.0),
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('구역번호',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 8.sp)))),
        GridColumn(
            columnName: 'bizName',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('사업구역명',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 8.sp)))),
        GridColumn(
            columnName: 'bizCount',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('필지수',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 8.sp)))),
        GridColumn(
            columnName: 'bizArea',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('면적',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 8.sp)))),
        GridColumn(
            columnName: 'bizDate',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('열람공고일',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 8.sp)))),
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
        // select
        GridColumn(
            columnName: 'select',
            width: 100.0,
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  '선택',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
        GridColumn(
            columnName: 'no',
            width: 100.0,
            label: Container(
                color: const Color(0xffedf1f5),
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
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('소유자번호',
                    style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizName',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('소유자명',
                    style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizCount',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('소유자구분',
                    style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizArea',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('등록번호',
                    style: TextStyle(fontWeight: FontWeight.bold)))),
        GridColumn(
            columnName: 'bizDate',
            label: Container(
                color: const Color(0xffedf1f5),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('핸드폰번호',
                    style: TextStyle(fontWeight: FontWeight.bold)))),
      ],
    );
  }

  Widget buildRadio() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('사업구분(대)', style: TextStyle(fontSize: 14)),
        Radio(
          value: 0,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('댐', style: TextStyle(fontSize: 14)),
        Radio(
          value: 1,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('수도용지', style: TextStyle(fontSize: 14)),
        Radio(
          value: 2,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('택지개발', style: TextStyle(fontSize: 14)),
        Radio(
          value: 3,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('기타', style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
