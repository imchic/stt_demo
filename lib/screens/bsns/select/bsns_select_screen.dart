import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../components/base_tabbar.dart';
import '../../../components/base_header.dart';
import '../../../components/custom_tab.dart';
import '../../../utils/custom_textfiled.dart';
import '../../../utils/dialog_util.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_grid.dart';
import '../../../utils/custom_sliver_persistent_headerdelegate.dart';
import '../bsns_controller.dart';
import '../datasource/model/bsns_select_area_datasource_model.dart';
import 'bsns_select_model.dart';

/// [BsnsSelectScreen] 사업선택 화면
class BsnsSelectScreen extends GetView<BsnsController> {

  const BsnsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BsnsController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BaseHeader(),
            Expanded(
              child: Row(
                children: [
                  // 왼쪽 메뉴 버튼
                  Container(child: buildLeftVerticalMenu()),
                  // 메인 뷰
                  Expanded(
                    flex: 8,
                    child: FutureBuilder(
                      future: controller.fetchBsnsList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Obx(
                          () => IndexedStack(
                            index: controller.selectedIndex.value,
                            children: [
                              // 사업선택
                              RefreshIndicator(
                                onRefresh: () async {
                                  await controller.fetchBsnsList();
                                },
                                child: Container(
                                  color: Color(0xffF6F7FB),
                                  child: Expanded(child: buildBsnsListView()),
                                ),
                              ),
                              // 소유자관리
                              RefreshIndicator(
                                onRefresh: () async {
                                  await controller.fetchBsnsList();
                                },
                                child: Expanded(child: buildOwnerListView()),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // 오른쪽 뷰
                  Obx(
                    () => controller.isRightSideExpanded.value
                        ? Expanded(
                            flex: 4,
                            child: InkWell(
                                onTap: () {
                                  if (controller.isRightSideExpanded.value) {
                                    controller.isRightSideExpanded.toggle();
                                  }
                                },
                                child: // fade out effect
                                    // flutter animate slide
                                    AnimatedContainer(
                                  duration: const Duration(milliseconds: 5000),
                                  curve: Curves.easeInOut,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('지도영역'),
                                  ),
                                )),
                          )
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.easeInOut,
                            child: Container(
                              width: 0,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            // right drawer
          ],
        ),
      ),
      endDrawer: Drawer(
        width: Get.width * 0.85,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 지도 부분
            Container(
              height: Get.height,
              color: Theme.of(Get.context!).colorScheme.primary,
              child: Column(
                children: [
                  // 지도 영역
                  Container(
                    height: Get.height,
                    color: Colors.white,
                    child: Center(
                      child: Text('지도영역'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }

  ///
  Widget buildSelectBsnsContainer() {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF246AEA)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: controller.selectedBsns.value.title == null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '선택된 사업명이 없습니다.',
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      controller.selectedBsns.value.title ?? '',
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ) :
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFEFF5FF),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '댐',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF1D56BC),
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFFF1E3),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '건설',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFFF7F00),
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  controller.selectedBsns.value.title ?? '',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// [buildBsnsSelectContainer] 선택된 사업명 컨테이너
  Widget buildBsnsSelectContainer() {
    return SizedBox(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:
                                                  const Color(0xffeff5ff),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            child: Text('댐',
                                                style: TextStyle(
                                                    color: Color(0xff1d56bc),
                                                    fontSize: 12.sp))),
                                        SizedBox(width: 10.h),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:
                                                  const Color(0xfffff1e4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            child: Text('건설',
                                                style: TextStyle(
                                                    color: Color(0xffff7f00),
                                                    fontSize: 12.sp))),
                                        SizedBox(width: 10.w),
                                        Text('사업명',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: gray800,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        SizedBox(width: 10.w),
                                        Text(
                                          controller.selectedBsns.value.title ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(width: 10.w),
                                        Text('사업구역명',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: gray800,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        SizedBox(width: 10.w),
                                        Text(
                                          controller
                                                  .selectedBsns.value.bizName ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Divider(color: gray300),
                              ],
                            ),
                          ),
                        ),

                        /// GIS 버튼
                        Builder(builder: (context) {
                          return IconButton(
                            onPressed: () {
                              // drawer open
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: controller.isRightSideExpanded.value
                                ? Icon(Icons.keyboard_arrow_left,
                                    size: 24.sp, color: gray500)
                                : Icon(Icons.keyboard_arrow_right,
                                    size: 24.sp, color: gray500),
                            iconSize: 24.sp,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              // Divider(color: gray200),
            ],
          ),
        ),
      ),
    );
  }

  /// [buildRightSideView] 오른쪽 뷰
  Widget buildRightSideView() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRect(
          child: Container(
            // round
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: gray400.withOpacity(0.1)),
            ),
            child: null != controller.selectedBsns.value
                ? buildBsnsDetailGridView(controller.selectedBsns.value)
                : const SizedBox(
                    height: 100,
                    child: Center(
                      child: Text('사업을 선택해주세요.'),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  /// [buildLeftVerticalMenu] 왼쪽 메뉴 버튼
  Widget buildLeftVerticalMenu() {
    return Obx(
      () => Container(
        width: 120.w,
        decoration: BoxDecoration(
          color: Color(0xff264DB1),
          // bottom border line
          border: Border(
           bottom: BorderSide(color: Color(0x4dffffff), width: 2.w),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.leftNavItems.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                      child: Container(
                        width: 120.w,
                        height: 80.h,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0x4dffffff),
                              width: 1.w,
                            ),
                            right: BorderSide(
                                color: controller.selectedIndex.value == index
                                    ? Color(0xff246BEB)
                                    : Colors.transparent,
                                width: 4.w),
                          ),
                          color: controller.selectedIndex.value == index
                              ? Color(0xff246BEB)
                              : Colors.transparent,
                        ),
                        // color: controller.selectedIndex.value == index
                        //     ? Color(0xff246BEB)
                        //     : Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/ic_menu_${index + 1}.svg',
                                width: 24.w,
                                height: 24.h,
                                color: Colors.white),
                                // color: controller.selectedIndex.value == index
                                //     ? Colors.white
                                //     : gray300.withOpacity(0.5)),
                            SizedBox(height: 4.h),
                            Text(controller.leftNavItems[index],
                                style: TextStyle(
                                  color: Colors.white,
                                    // color:
                                    //     controller.selectedIndex.value == index
                                    //         ? Colors.white
                                    //         : gray300.withOpacity(0.5),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [buildBsnsCard] 사업목록 카드
  Widget buildBsnsCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.all(20.r),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0, color: borderLine),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 40.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('사업명',
                                    style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 16.sp, fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CustomTextFiled(
                                      controller: controller.bsnsNameSearchController,
                                      hintText: '사업명을 입력해주세요',
                                      onChanged: (value) {
                                        controller.searchBsnsName(value);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Container(
                                    width: 52.w,
                                    height: 40.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFEFF5FF),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.w, color: Color(0xFF246AEA)),
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '조회',
                                          style: TextStyle(
                                            color: Color(0xFF1D56BC),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            // height: 0.09,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('사업번호',
                                    style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 16.sp, fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CustomTextFiled(
                                      controller: controller.bsnsNoSearchController,
                                      hintText: '사업번호를 입력해주세요',
                                      onChanged: (value) {
                                        controller.searchBsnsName(value);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Container(
                                    width: 52.w,
                                    height: 40.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFEFF5FF),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.w, color: Color(0xFF246AEA)),
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '조회',
                                          style: TextStyle(
                                            color: Color(0xFF1D56BC),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            // height: 0.09,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildBsnsRadio(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(child: Container(
          width: Get.width,
          padding: EdgeInsets.all(20.r),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '전체',
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' ${controller.searchBsnsList.length}',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: '건',
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.searchBsnsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        DialogUtil.showAlertDialog(context, '사업구역 선택', '${controller.searchBsnsList[index].title} \n사업을 선택하시겠습니까?',
                            () {
                          controller.selectedBsns.value = controller.searchBsnsList[index];
                          controller.bsnsTabController.animateTo(1);
                          controller.handleBsnsSelectListTab(1);
                          Get.back();
                        }, () {
                          Get.back();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xffD8D8D8)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child:
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                                        decoration: ShapeDecoration(
                                                          color: Color(0xFFEFF5FF),
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '댐',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Color(0xFF1D56BC),
                                                                fontSize: 13.sp,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                                        decoration: ShapeDecoration(
                                                          color: Color(0xFFFFF1E3),
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '건설',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Color(0xFFFF7F00),
                                                                fontSize: 13.sp,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Expanded(
                                                  child: SizedBox(
                                                    child: Text(
                                                      controller.searchBsnsList[index].title ?? '',
                                                      style: TextStyle(
                                                        color: Color(0xFF1D1D1D),
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            controller.searchBsnsList[index].bizArea ?? '',
                                            style: TextStyle(
                                              color: Color(0xFF555555),
                                              fontSize: 14.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(height: 10.w),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFF0F0F0),
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '주관부서',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Color(0xFF1D1D1D),
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 23.h,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          '수도개발처',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Container(
                                                          width: 1.w,
                                                          height: 16.h,
                                                          decoration: BoxDecoration(color: Color(0xFFC6C6C6)),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '수도개발부',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Container(
                                                          width: 1,
                                                          height: 16,
                                                          decoration: BoxDecoration(color: Color(0xFFC6C6C6)),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '수도개발팀',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '홍길동',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                    InkWell(
                                      onTap: () {

                                        controller.searchBsnsList.forEach((element) {
                                          element.isExpand = false;
                                        });

                                        controller.searchBsnsList[index].isExpand = !controller.searchBsnsList[index].isExpand!;

                                        controller.selectedBsns.value = controller.searchBsnsList[index];


                                      },
                                      child: Container(
                                        width: 96.w,
                                        height: 40.h,
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF246AEA),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '상세정보',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Obx(() {
                              if (controller.searchBsnsList[index].isExpand == true) {
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
                                        Row(
                                          children: [
                                            Text('사업시작일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text('사업종료일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-12-31',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight: FontWeight.w500)),
                                            SizedBox(width: 10),
                                            // 승인일
                                            Text('승인일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            // 관보고시일
                                            Text('관보고시일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight: FontWeight.w500)),
                                            SizedBox(width: 10),
                                            // 열람공고일
                                            Text('준공일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        buildTable(),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
        ),
      ],
    );
  }

  /// [buildBsnsListView] 사업목록 리스트뷰
  Widget buildBsnsListView() {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          children: [
            buildSelectBsnsContainer(),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() =>
                      TabBar(
                        controller: controller.bsnsTabController,
                        isScrollable: true,
                        padding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        indicatorWeight: 0.0,
                        indicatorColor: Colors.transparent,
                        indicatorPadding: EdgeInsets.zero,
                        dividerColor: Colors.transparent,
                        tabs: [
                          CustomTab(title: '사업선택',
                              isSelected: controller.bsnsSelectTabIsSelected[0],
                              onTap: () {
                                controller.bsnsTabController.animateTo(0);
                                controller.handleBsnsSelectListTab(0);

                          }),
                          CustomTab(title: '사업구역',
                              isSelected: controller.bsnsSelectTabIsSelected[1],
                              onTap: () {
                                controller.bsnsTabController.animateTo(1);
                                controller.handleBsnsSelectListTab(1);
                              }),
                          CustomTab(title: '조사차수',
                              isSelected: controller.bsnsSelectTabIsSelected[2],
                              onTap: () {
                                controller.bsnsTabController.animateTo(2);
                                controller.handleBsnsSelectListTab(2);
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: TabBarView(
              controller: controller.bsnsTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildBsnsCard(),
                Expanded(child: buildBsnsSelectAreaListDataGrid()),
                Expanded(child: Column(
                  children: [
                    Expanded(child: buildBsnsSqncDataGrid()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.getSelectOrder();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xff2d2d2d),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('차수등록',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  /// [buildOwnerListView] 사업소유자 리스트뷰
  Widget buildOwnerListView() {
    return Column(
      children: [
        BaseTabBar(
          tabItems: controller.bsnsOwnerTabItems,
          controller: controller.bsnsOwnerTabController,
          activeColor: Color(0xff00163D),
          unActiveColor: Color(0xff1D1D1D),
          activeTextColor: Colors.white,
          unActiveTextColor: Colors.white,
        ),
        Expanded(
            child: TabBarView(
          controller: controller.bsnsOwnerTabController,
          children: [
            // 소유자 검색
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildOwnerMngSearch(),
                    Expanded(child: buildBsnsOwnerDataGrid())
                  ],
                )),
            // 토지정보
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: buildOwnerLadInfoDataGrid()),
                  ],
                )),
            // 지장물정보
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('3'),
                  ],
                )),
            // 정보변경
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('4'),
                  ],
                )),
          ],
        )),
      ],
    );
  }

  /// [buldAccdtlnvstgListView] 실태조사 리스트뷰
  Widget buldAccdtlnvstgListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTabBar(
            tabItems: controller.accdtlnvstgTabItems,
            controller: controller.accdtlnvstgTabController,
            activeColor: Color(0xff1D1D1D),
            activeTextColor: Colors.white,
            unActiveTextColor: Colors.white,
          ),
          // 사업명
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('사업명',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: gray800)),
                          SizedBox(width: 10.w),
                          Text(
                            controller.searchBsnsList[0].title ?? '',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                          SizedBox(width: 10.w),
                          Text('사업구역명',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: gray800)),
                          SizedBox(width: 10.w),
                          Text(
                            controller.searchBsnsList[0].bizName ?? '',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ],
                      ),
                      // Divider(color: gray300),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller.accdtlnvstgTabController,
              children: [
                //  탭바 중첩
                Column(
                  children: [
                    BaseTabBar(
                      tabItems: controller.accdtlnvstgLadTabItems,
                      controller: controller.accdtlnvstgLadTabController,
                      activeColor: Color(0xff1D1D1D),
                      activeTextColor: Colors.white,
                      unActiveTextColor: Colors.white,
                    ),
                    Divider(color: gray300),
                    Expanded(
                      child: TabBarView(
                        controller: controller.accdtlnvstgLadTabController,
                        children: [
                          buildAccdtlnvstgLadDataGrid(),
                          // Text('2'),
                          // Text('3'),
                          // Text('4'),
                          // buildBsnsListDataGrid(),
                          // buildBsnsListDataGrid(),
                          // buildBsnsListDataGrid(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// [buildBsnsDetailGridView] 실태조사 그리드 뷰
  Widget buildBsnsDetailGridView(BsnsSelectModel bsns) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: CustomSliverPersistentHeaderDelegate(
            minHeight: 70.0,
            maxHeight: 70.0,
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 58.h,
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
                                color: Color(0xff1d56bc), fontSize: 12.sp)),
                      ),
                    ),
                    SizedBox(width: 10.h),
                    Container(
                      height: 58.h,
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
                                color: Color(0xffff7f00), fontSize: 12.sp)),
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
                    const Divider(color: gray300),
                  ],
                )),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사업구역명',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: gray800),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 58.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            hintText: '${bsns.bizName}',
                            hintStyle: TextStyle(fontSize: 12.sp),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  '소재지',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: gray800),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 58.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            hintText: '읍면동',
                            hintStyle: TextStyle(fontSize: 12.sp),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        height: 58.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            hintText: '본번',
                            hintStyle: TextStyle(fontSize: 12.sp),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        height: 58.h,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            hintText: '부번',
                            hintStyle: TextStyle(fontSize: 12.sp),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  '실태조사 차수 선택',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: gray800),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(
                      height: 58.h,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.getSelectOrder();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffeff5ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: const BorderSide(color: Color(0xff1d56bc)),
                          ),
                        ),
                        child: Text('선택',
                            style: TextStyle(
                                color: Color(0xff1d56bc), fontSize: 12.sp)),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        height: 58.h,
                        child: TextField(
                          controller: controller.orderController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            hintText: '선택된 차수 표시',
                            hintStyle: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // 조회 버튼
                SizedBox(
                  width: Get.width,
                  height: 58.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2d2d2d),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      //controller.getBusinessList();
                    },
                    child: Text('조회',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20.h),
                buildBsnsOwnerDataGrid(),
              ],
            ),
          )
        ])),
      ],
    );
  }

  /// [buildTable] 테이블
  Widget buildTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.35),
        1: FlexColumnWidth(2),
      },
      //defaultColumnWidth: const FlexColumnWidth(1),
      border: TableBorder.all(color: gray300),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: AutoSizeText('관련고시번호',
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Center(
                    child: Text('세종특별자치시 고시 2022호 2021-01-01',
                        style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('시행방법',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child:
                    Center(child: Text('-', style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 120,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('사업목적',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2)),
              ),
            ),
            TableCell(
              child: Container(
                // height: 120,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Center(
                    child: Text(
                        '홍수 범람 및 피해 등 재해발생 위험성이 높은 하천(대교천)에 대하여 제방축조 및 호안정비 등 하천정비를 시행하여 재해를 사전에 예방하고자 함',
                        style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('사업규모',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child:
                    Center(child: Text('-', style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('근거법령',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child:
                    Center(child: Text('-', style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        /*TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('사업구역정보',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp)),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: buildBsnsListDataGrid(),
                ),
              ),
            ),
          ],
        ),*/
      ],
    );
  }

  ///  사업선택 -> 사업구역 선택
  /// [buildBsnsSelectAreaListDataGrid] 데이터그리드
  Widget buildBsnsSelectAreaListDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsListDataSource.value,
      controller: controller.bsnsListDataGridController,
      columns: [
        GridColumn(
            width: controller.columnWidths['bsnsZoneNo']!,
            columnName: 'bsnsZoneNo',
            autoFitPadding: const EdgeInsets.all(8.0),
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '사업구역번호',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['bsnsZoneNm']!,
            columnName: 'bsnsZoneNm',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '사업구역명',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['lotCnt']!,
            columnName: 'lotCnt',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '필지수',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['bsnsAra']!,
            columnName: 'bsnsAra',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '면적',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['bsnsReadngPblancDe']!,
            columnName: 'bsnsReadngPblancDe',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '열람공고일',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) async {
        final index =
            controller.bsnsListDataSource.value.rows.indexOf(addedRows.first);
        var getRow = controller.bsnsListDataSource.value.rows[index];

        var bsnsZoneNo = getRow.getCells()[0].value;
        var bsnsZoneNm = getRow.getCells()[1].value;
        var lotCnt = getRow.getCells()[2].value;
        var bsnsAra = getRow.getCells()[3].value;
        var bsnsReadngPblancDe = getRow.getCells()[4].value;

        controller.bsnsSelectAreaDataSource.value =
            BsnsSelectAreaDataSourceModel(
                bsnsZoneNo: bsnsZoneNo,
                bsnsZoneNm: bsnsZoneNm,
                lotCnt: lotCnt,
                bsnsAra: bsnsAra,
                bsnsReadngPblancDe: bsnsReadngPblancDe);

        print(
            '사업구역 선택: $bsnsZoneNo, $bsnsZoneNm, $lotCnt, $bsnsAra, $bsnsReadngPblancDe');

        DialogUtil.showAlertDialog(
          Get.context!,
          '사업 구역 선택',
          '${controller.bsnsSelectAreaDataSource.value.bsnsZoneNm} 사업을 선택하시겠습니까?',
          () {
            controller.bsnsTabController.animateTo(2);
            controller.handleBsnsSelectListTab(2);
            Get.back();
          },
          () {
            Get.back();
          },
        );
      }),
    );
  }

  // 사업선택 -> 조사 차수
  /// [buildBsnsSqncDataGrid] 데이터그리드
  Widget buildBsnsSqncDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsSqncDataSource.value,
      controller: controller.bsnsOrderDataGridController,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        GridColumn(
            columnName: 'no',
            label: Container(
                alignment: Alignment.center,
                child: Text('NO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'bsnsSqnc',
            label: Container(
                alignment: Alignment.center,
                child: Text('차수',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'bsnsStrtDe',
            label: Container(
                alignment: Alignment.center,
                child: Text('시작날짜',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'bsnsEndDe',
            label: Container(
                alignment: Alignment.center,
                child: Text('종료날짜',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
      ],
    );
  }

  /// 소유자관리 -> 소유자검색
  /// [buildBsnsOwnerDataGrid] 데이터그리드
  Widget buildBsnsOwnerDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsOwnerDataSource.value,
      controller: controller.bsnsOwnerDataGridController,
      isShowCheckbox: false,
      columnWidthMode: ColumnWidthMode.fill,
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        print('선택된 소유자: ${addedRows.first.getCells()[2].value}');
      }),
      columns: [
        GridColumn(
            columnName: 'no',
            label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text('NO.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ownerNo',
            autoFitPadding: const EdgeInsets.all(8.0),
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('소유자번호',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ladLdgrOwnerNm',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('소유자명',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ladLdgrPosesnDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('소유자구분',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ownerRegisterNo',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('등록번호',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ownerTelNo',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('전화번호',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ownerPhoneNo',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('핸드폰번호',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
      ],
    );
  }

  /// [buildOwnerMngSearch] 소유자 관리 -> 토지정보 검색
  Widget buildOwnerLadInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerLadInfoDataSource.value,
      controller: controller.ownerLadInfoDataGridController,
      isSort: false,
      //columnWidthMode: ColumnWidthMode.fill,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['ofcbkLndcgrDivCd', 'sttusLndcgrDivCd'],
              child: Container(
                  alignment: Alignment.center,
                  child: Text('지목',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: gray700)))),
          StackedHeaderCell(
              columnNames: ['ofcbkAra', 'incrprAra', 'cmpnstnInvstgAra'],
              child: Container(
                  alignment: Alignment.center,
                  child: Text('면적',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: gray700)))),
        ]),
      ],
      columns: [
        GridColumn(
            columnName: 'lgdongNm',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('소재지',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'lcrtsDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('특지',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'mlnoLtno',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('본번',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'slnoLtno',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('부번',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ofcbkLndcgrDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('공부',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'sttusLndcgrDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('현황',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'ofcbkAra',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('공부',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'incrprAra',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('편입',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'cmpnstnInvstgAra',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('조사',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'acqsPrpDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('취득용도',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'aceptncPrpDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('수용/사용',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'accdtInvstgSqnc',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('조사차수',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'invstgDt',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('조사일자',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'cmpnstnDtaChnStatDivCd',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('보상진행단계',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
        GridColumn(
            columnName: 'etc',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('비고',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700)))),
      ],
    );
  }

  /// [buildAccdtlnvstgLadDataGrid] 데이터그리드
  Widget buildAccdtlnvstgLadDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgLadDataSource.value,
      controller: controller.accdtlnvstgLadDataGridController,
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      columns: [
        GridColumn(
            width: controller.columnWidths['surveyDate']!,
            columnName: 'surveyDate',
            label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  '조사일자',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['surveyOrder']!,
            columnName: 'surveyOrder',
            autoFitPadding: const EdgeInsets.all(8.0),
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '조사차수',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['location']!,
            columnName: 'location',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '소재지',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ))),
        GridColumn(
            width: controller.columnWidths['mainNumber']!,
            columnName: 'mainNumber',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '본번',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['subNumber']!,
            columnName: 'subNumber',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '부번',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            width: controller.columnWidths['publicLandType']!,
            columnName: 'publicLandType',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  '공부지목',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: gray700),
                  overflow: TextOverflow.ellipsis,
                ))),
      ],
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['surveyDate', 'surveyOrder', 'location'],
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    '토지기본정보',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700),
                    overflow: TextOverflow.ellipsis,
                  ))),
          StackedHeaderCell(
              columnNames: ['mainNumber', 'subNumber', 'publicLandType'],
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    '지번',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: gray700),
                    overflow: TextOverflow.ellipsis,
                  ))),
        ]),
      ],
    );
  }

  /// [buildBsnsSearch] 검색
  Widget buildBsnsSearch() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('사업명',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: gray600)),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: gray300),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    controller: controller.bsnsNameSearchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '사업명을 입력하세요',
                      hintStyle: TextStyle(fontSize: 12.sp, color: gray500),
                      // contentPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.all(12.r),
                      suffixIcon: IconButton(
                        onPressed: () {
                          //controller.search();
                        },
                        icon: Icon(Icons.search, size: 20.sp, color: gray500),
                      ),
                    ),
                    onChanged: (value) {
                      controller.searchBsnsName(value);
                    },
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 1,
                child: Text('사업번호',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: gray600)),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: gray300),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    controller: controller.bsnsNoSearchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '사업번호를 입력하세요',
                      hintStyle: TextStyle(fontSize: 12.sp, color: gray500),
                      contentPadding: EdgeInsets.all(12.r),
                      suffixIcon: IconButton(
                        onPressed: () {
                          //controller.search();
                        },
                        icon: Icon(Icons.search, size: 20.sp, color: gray500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          buildBsnsRadio(),
        ],
      ),
    );
  }

  /// [buildOwnerMngSearch] 소유자관리 검색
  Widget buildOwnerMngSearch() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('소재지',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: gray600)),
              ),
              Expanded(
                flex: 8,
                child: CustomTextFiled(
                  controller: controller.ownerNameSearchController,
                  hintText: '소유자명을 입력하세요',
                  onChanged: (value) {
                    //controller.searchOwnerName(value);
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Text('본번',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: gray600)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextFiled(
                        controller: controller.ownerRegisterNoSearchController,
                        hintText: '본번',
                        onChanged: (value) {
                          //controller.searchOwnerName(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Text('부번',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: gray600)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextFiled(
                        controller: controller.ownerRegisterNoSearchController,
                        hintText: '부번',
                        onChanged: (value) {
                          //controller.searchOwnerName(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          buildOwnerMngRadio(),
        ],
      ),
    );
  }

  /// [buildBsnsRadio] 라디오 버튼
  Widget buildBsnsRadio() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('사업구분',
            style: TextStyle(
                fontSize: 15.sp, fontWeight: FontWeight.w500, color: Color(0xff1D1D1D))),
        Radio(
          value: 0,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            controller.handleRadioValueChange(value ?? 0);
          },
        ),
        Text('댐',
            style: TextStyle(
                fontSize: 13.sp, fontWeight: FontWeight.w400, color: Color(0xff1D1D1D))),
        Radio(
          value: 1,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            controller.handleRadioValueChange(value ?? 0);
          },
        ),
        Text('수도용지',
            style: TextStyle(
                fontSize: 13.sp, fontWeight: FontWeight.w400, color: Color(0xff1D1D1D))),
        Radio(
          value: 2,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            controller.handleRadioValueChange(value ?? 0);
          },
        ),
        Text('택지개발',
            style: TextStyle(
                fontSize: 13.sp, fontWeight: FontWeight.w400, color: Color(0xff1D1D1D))),
        Radio(
          value: 3,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            controller.handleRadioValueChange(value ?? 0);
          },
        ),
        Text('기타',
            style: TextStyle(
                fontSize: 13.sp, fontWeight: FontWeight.w400, color: Color(0xff1D1D1D))),
      ],
    );
  }

  /// [buildOwnerMngRadio] 라디오 버튼
  Widget buildOwnerMngRadio() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('소유자구분',
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.w500, color: gray600)),
        Radio(
          value: 0,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        Text('소유자',
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.w500, color: gray600)),
        Radio(
          value: 1,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        Text('관계인',
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.w500, color: gray600)),
      ],
    );
  }
}
