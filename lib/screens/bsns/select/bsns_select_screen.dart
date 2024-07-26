import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../components/base_header.dart';
import '../../../components/base_tabbar.dart';
import '../../../components/custom_tab.dart';
import '../../../utils/custom_textfiled.dart';
import '../../../utils/dialog_util.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_grid.dart';
import '../bsns_controller.dart';
import '../datasource/model/bsns_select_area_datasource_model.dart';

/// [BsnsSelectScreen] 사업선택 화면
class BsnsSelectScreen extends GetView<BsnsController> {
  const BsnsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BsnsController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // BaseHeader(),
            Expanded(
              child: Row(
                children: [
                  // 왼쪽 메뉴 버튼
                  Container(child: lnbWidget()),
                  // 메인 뷰
                  Expanded(
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
                              /// [사업선택] 화면
                              Column(
                                children: [
                                  BaseHeader(),
                                  Expanded(child: buildBsnsListView()),
                                ],
                              ),
                              /// [소유자관리] 화면
                              Column(
                                children: [
                                  BaseHeader(),
                                  Expanded(child: buildOwnerView()),
                                ],
                              ),
                              /// [실태조사] 화면
                              Column(
                                children: [
                                  BaseHeader(),
                                  Expanded(child: buildAccdtInvstgView()),
                                ],
                              ),
                              /// [통계정보] 화면
                              Center(child: Text('통계정보')),
                              /// [고객카드] 화면
                              Center(child: Text('고객카드')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // 오른쪽 뷰
                  Obx(
                    () => controller.isRightSideExpanded.value
                        ? InkWell(
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
                            ))
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

  /// [buildRightSideView] 오른쪽 뷰
  /*Widget buildRightSideView() {
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
  }*/

  /// [lnbWidget] 왼쪽 메뉴 버튼
  Widget lnbWidget() {
    return Obx(
      () => Container(
        width: 104.w,
        decoration: BoxDecoration(
          color: lnbBg,
        ),
        child: Column(
          children: [
            Container(
              width: 104.w,
              height: 84.h,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0XFF667185),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                child: SvgPicture.asset(
                  'assets/images/ic_kwater_logo.svg',
                  width: 68.w,
                  height: 48.h,
                ),
              ),
            ),
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
                          color: controller.selectedIndex.value == index
                              ? Color(0xFF2287EF)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/ic_menu_${index + 1}.svg',
                                width: 20.w,
                                height: 20.h,
                                color: Colors.white),
                            SizedBox(height: 4.h),
                            Text(controller.leftNavItems[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700),
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
          margin: EdgeInsets.only(top: 14.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0, color: borderLine),
              borderRadius: BorderRadius.circular(8.r),
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
                                  Text(
                                    '사업명',
                                    style: TextStyle(
                                      color: Color(0xFF1D1D1D),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
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
                                      controller:
                                          controller.bsnsNameSearchController,
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
                                      color: Color(0xFFD2D6DF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '조회',
                                          style: TextStyle(
                                            color: Color(0xFF1D1D1D),
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
                                  Text(
                                    '사업번호',
                                    style: TextStyle(
                                      color: Color(0xFF1D1D1D),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
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
                                      controller:
                                          controller.bsnsNoSearchController,
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
                                      color: Color(0xFFD2D6DF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '조회',
                                          style: TextStyle(
                                            color: Color(0xFF1D1D1D),
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
              SizedBox(height: 20.h),
              buildBsnsRadio(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: SizedBox(
          width: Get.width,
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
                  padding: EdgeInsets.zero,
                  itemCount: controller.searchBsnsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        DialogUtil.showAlertDialog(context, '사업구역 선택',
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${controller.searchBsnsList[index].title}',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n사업을 선택하시겠습니까?',
                                    style: TextStyle(
                                      color: Color(0xFF1D1D1D),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            () {
                          controller.selectedBsns.value = controller.searchBsnsList[index];
                          controller.bsnsTabController.animateTo(1);
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 20.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 34.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            Color(0xFFEFF5FF),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '댐',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF1D58BC),
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Container(
                                                      height: 34.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            Color(0xFFFFF1E3),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '건설',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFFFF7F00),
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10.w),
                                                Expanded(
                                                  child: SizedBox(
                                                    child: Text(
                                                      controller
                                                              .searchBsnsList[
                                                                  index]
                                                              .title ??
                                                          '',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF1D1D1D),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            controller.searchBsnsList[index]
                                                    .bizArea ??
                                                '',
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFF0F0F0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '주관부서',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF1D1D1D),
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '수도개발처',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        Container(
                                                          width: 1.w,
                                                          height: 16.h,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      0xFFC6C6C6)),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '수도개발부',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Container(
                                                          width: 1,
                                                          height: 16,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      0xFFC6C6C6)),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '수도개발팀',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                          '홍길동',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF555555),
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                      controller.searchBsnsList
                                          .forEach((element) {
                                        element.isExpand = false;
                                      });

                                      controller
                                              .searchBsnsList[index].isExpand =
                                          !controller
                                              .searchBsnsList[index].isExpand!;

                                      controller.selectedBsns.value =
                                          controller.searchBsnsList[index];
                                    },
                                    child: Container(
                                      width: 96.w,
                                      height: 40.h,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF246AEA),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                              if (controller.searchBsnsList[index].isExpand ==
                                  true) {
                                return Card(
                                  color: const Color(0xfff8f8f8),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: gray300, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // border line color
                                  shadowColor: Colors.grey[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('사업시작일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text('사업종료일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-12-31',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(width: 10),
                                            // 승인일
                                            Text('승인일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            // 관보고시일
                                            Text('관보고시일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(width: 10),
                                            // 열람공고일
                                            Text('준공일',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            SizedBox(width: 10),
                                            Text('2021-01-01',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: gray600,
                                                    fontWeight:
                                                        FontWeight.w500)),
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
        )),
      ],
    );
  }

  /// [buildBsnsListView] 사업목록 리스트뷰
  Widget buildBsnsListView() {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child:
                      TabBar(
                        controller: controller.bsnsTabController,
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        isScrollable: true,
                        tabs: controller.bsnsSelectTabItems
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: tabBarDivider,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.bsnsTabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [

                // [사업선택 -> 사업목록]
                buildBsnsCard(),

                // [사업선택 -> 사업구역]
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: 24.h),
                  padding: EdgeInsets.all(10.r),
                  child: SizedBox(
                    width: Get.width,
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
                                text:
                                ' ${controller.searchBsnsList.length}',
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
                        Expanded(child: buildBsnsSelectAreaListDataGrid())
                      ],
                    ),
                  ),
                ),

                // [사업선택 -> 조사차수]
                Expanded(
                    child: Column(
                  children: [
                    //Expanded(child: buildBsnsSqncDataGrid()),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: 24.h),
                        padding: EdgeInsets.all(20.r),
                        child: SizedBox(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*RichText(
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
                                      text:
                                      ' ${controller.searchBsnsList.length}',
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
                              SizedBox(height: 20.h),*/
                              //Expanded(child: buildBsnsSqncDataGrid())
                              // 스텝퍼
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Stepper(
                                        type: StepperType.vertical,
                                        currentStep: 1,
                                        controlsBuilder: (context, controller) {
                                          return const SizedBox.shrink();
                                        },
                                        steps: [
                                          Step(
                                            isActive: false,
                                            state: StepState.disabled,
                                            title: Text('1차'),
                                            subtitle: Text('2024.01.01 ~ 2024.06.30'),
                                            content: Text('1차'),
                                          ),
                                          Step(
                                            isActive: false,
                                            state: StepState.disabled,
                                            title: Text('2차'),
                                            subtitle: Text('2024.07.01 ~ 2024.12.31'),
                                            content: Text(''),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                ),
                              ),
                            ],
                          ),
                        ),
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

  /// [buildOwnerView] 사업소유자 리스트뷰
  Widget buildOwnerView() {
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
                      BaseTabBar(tabItems: [
                        CustomTab(
                            title: '소유자검색',
                            isSelected: controller.bsnsOwnerTabIsSelected[0],
                            onTap: () {
                              controller.bsnsOwnerTabController.animateTo(0);
                              controller.handleSelectListTab(
                                  controller.bsnsOwnerTabIsSelected, 0);
                            },
                            selectedColor: tabSelectColor,
                            unselectedColor: tabUnSelectColor),
                        CustomTab(
                            title: '토지정보',
                            isSelected: controller.bsnsOwnerTabIsSelected[1],
                            onTap: () {
                              controller.bsnsOwnerTabController.animateTo(1);
                              controller.handleSelectListTab(
                                  controller.bsnsOwnerTabIsSelected, 1);
                            },
                            selectedColor: tabSelectColor,
                            unselectedColor: tabUnSelectColor),
                        CustomTab(
                            title: '지장물정보',
                            isSelected: controller.bsnsOwnerTabIsSelected[2],
                            onTap: () {
                              controller.bsnsOwnerTabController.animateTo(2);
                              controller.handleSelectListTab(
                                  controller.bsnsOwnerTabIsSelected, 2);
                            },
                            selectedColor: tabSelectColor,
                            unselectedColor: tabUnSelectColor),
                        CustomTab(
                            title: '정보변경',
                            isSelected: controller.bsnsOwnerTabIsSelected[3],
                            onTap: () {
                              controller.bsnsOwnerTabController.animateTo(3);
                              controller.handleSelectListTab(
                                  controller.bsnsOwnerTabIsSelected, 3);
                            },
                            selectedColor: tabSelectColor,
                            unselectedColor: tabUnSelectColor),
                      ], controller: controller.bsnsOwnerTabController),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
              controller: controller.bsnsOwnerTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
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
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 24.h,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '소재지',
                                                style: TextStyle(
                                                  color: Color(0xFF1D1D1D),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: CustomTextFiled(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '소재지를 입력해주세요',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                // 본번
                                Flexible(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: CustomTextFiled(
                                      controller: controller
                                          .ownerMlnoLtnoSearchController,
                                      hintText: '본번',
                                      onChanged: (value) {
                                        //controller.searchBsnsName(value);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                // 부번
                                Flexible(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: CustomTextFiled(
                                      controller: controller
                                          .ownerSlnoLtnoSearchController,
                                      hintText: '부번',
                                      onChanged: (value) {
                                        //controller.searchBsnsName(value);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            buildOwnerMngRadio()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(20.r),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0, color: borderLine),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                      ),
                      child: SizedBox(
                        width: Get.width,
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
                                    text:
                                        ' ${controller.searchBsnsList.length}',
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
                            SizedBox(
                                height: Get.height * 0.45,
                                child: buildBsnsOwnerDataGrid())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /// [소유자관리 -> 토지정보]
                Container(
                  width: Get.width,
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
                  padding: EdgeInsets.all(20.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        Expanded(child: buildOwnerLadInfoDataGrid()),
                      ],
                    )),
                /// [소유자관리 -> 지장물정보]
                //Expanded(child: Container(child: buildOwnerObstInfoDataGrid())),
                Container(
                    width: Get.width,
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
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        Expanded(child: buildOwnerObstInfoDataGrid()),
                      ],
                    )),
                /// [소유자관리 -> 정보변경]
                SingleChildScrollView(
                                  child: Column(
                children: [
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(20.r),
                    decoration: ShapeDecoration(
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
                        // 소유자명, 소유자구분
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Text('소유자명', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFiled(
                                    isReadOnly: true,
                                    hintText: '홍길동',
                                    onChanged: (value) {
                                      //controller.searchBsnsName(value);
                                    },
                                    backgroundColor: Color(0xFFF6F6F6),
                                    textColor: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Text('소유자구분', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFiled(
                                    isReadOnly: true,
                                    hintText: '사유',
                                    onChanged: (value) {
                                      //controller.searchBsnsName(value);
                                    },
                                    backgroundColor: Color(0xFFF6F6F6),
                                    textColor: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 등록번호
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Text('등록번호', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFiled(
                                    isReadOnly: true,
                                    hintText: '70092-1****',
                                    onChanged: (value) {
                                      //controller.searchBsnsName(value);
                                    },
                                    backgroundColor: Color(0xFFF6F6F6),
                                    textColor: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 전화번호, 휴대폰번호
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Text('전화번호', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFiled(
                                    hintText: '전화번호',
                                    onChanged: (value) {
                                      //controller.searchBsnsName(value);
                                    },
                                    backgroundColor: Color(0xFFF6F6F6),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Text('휴대폰번호', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 58.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextFiled(
                                    isReadOnly: true,
                                    hintText: '휴대폰번호',
                                    onChanged: (value) {
                                      //controller.searchBsnsName(value);
                                    },
                                    backgroundColor: Color(0xFFF6F6F6),
                                    textColor: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 특이사항
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Color(0xFFD8D8D8),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 200.h,
                                child: Text('특이사항', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFFD8D8D8),
                                          width: 1,
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFFD8D8D8),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: 200.h,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 44.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFFFFFFF),
                                                    borderRadius: BorderRadius.circular(6.r),
                                                    border: Border.all(color: borderLine)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/ic_microphone.svg',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Container(
                                                width: 44.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFFFFFFF),
                                                    borderRadius: BorderRadius.circular(6.r),
                                                    border: Border.all(color: borderLine)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/ic_pen.svg',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Expanded(
                                            child: CustomTextFiled(
                                              isReadOnly: true,
                                              hintText: '내용을 입력하세요',
                                              onChanged: (value) {
                                                //controller.searchBsnsName(value);
                                              },
                                              backgroundColor: Color(0xFFF6F6F6),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 60.w,
                      height: 40.h,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: ShapeDecoration(
                        color: Color(0xFF246AEA),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '저장',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
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
              ],
            ))
          ],
        ),
      ),
    );
  }

  /// [buildAccdtInvstgView] 실태조사
  Widget buildAccdtInvstgView() {
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
                      BaseTabBar(tabItems: [
                        CustomTab(
                            title: '토지조사',
                            isSelected: controller.accdtlnvstgTabIsSelected[0],
                            onTap: () {
                              controller.accdtlnvstgTabController.animateTo(0);
                              controller.handleSelectListTab(
                                  controller.accdtlnvstgTabIsSelected, 0);
                            },
                            selectedColor: tabSelectColor,
                            unselectedColor: tabUnSelectColor),
                        CustomTab(
                            title: '지장물 조사',
                            isSelected: controller.accdtlnvstgTabIsSelected[1],
                            onTap: () {
                              controller.accdtlnvstgTabController.animateTo(1);
                              controller.handleSelectListTab(
                                  controller.accdtlnvstgTabIsSelected, 1);
                            },
                            selectedColor: tabSelectColor,
                            unselectedColor: tabUnSelectColor),
                      ], controller: controller.accdtlnvstgTabController),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: controller.accdtlnvstgTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    Container(
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
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          children: [
                            // 토지조사 검색
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 24.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '소재지',
                                                  style: TextStyle(
                                                    color: Color(0xFF1D1D1D),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          flex: 5,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: CustomTextFiled(
                                                  controller: controller.ownerLctnSearchController,
                                                  hintText: '소재지를 입력해주세요',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                // 본번
                                Flexible(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: CustomTextFiled(
                                      controller: controller.ownerMlnoLtnoSearchController,
                                      hintText: '본번',
                                      onChanged: (value) {
                                        //controller.searchBsnsName(value);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                // 부번
                                Flexible(
                                  child: SizedBox(
                                    height: 40.h,
                                    child: CustomTextFiled(
                                      controller: controller.ownerSlnoLtnoSearchController,
                                      hintText: '부번',
                                      onChanged: (value) {
                                        //controller.searchBsnsName(value);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            // 취득용도
                            Row(
                              children: [
                                Text(
                                  '취득용도',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  width: 200.w,
                                  height: 40.h,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEFF5FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: controller.selectedPurpose.value,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Theme.of(Get.context!).colorScheme.primary),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (String? newValue) {
                                      controller.selectedPurpose.value = newValue!;
                                    },
                                    items: controller.purposeList
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20.r),
                        decoration: ShapeDecoration(
                          //color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0, color: borderLine),
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                    text:
                                    ' ${controller.searchBsnsList.length}',
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
                            Expanded(child: buildOwnerLadInfoDataGrid())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text('지장물 조사'),
              ],
            )),
          ],
        ),
      ),
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
      ],
    );
  }

  ///  사업선택 -> 사업구역 선택
  /// [buildBsnsSelectAreaListDataGrid] 데이터그리드
  Widget buildBsnsSelectAreaListDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsListDataSource.value,
      controller: controller.bsnsListDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        gridColumn('bsnsZoneNo', 'No.'),
        gridColumn('bsnsZoneNm', '사업구역명'),
        gridColumn('lotCnt', '필지수'),
        gridColumn('bsnsAra', '면적(㎡)'),
        gridColumn('bsnsReadngPblancDe', '열람공고일'),
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
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: '${controller.bsnsSelectAreaDataSource.value.bsnsZoneNm}',
                style: TextStyle(
                  color: Theme.of(Get.context!).colorScheme.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' 사업구역을 선택하시겠습니까?',
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
          () {
            controller.bsnsTabController.animateTo(2);
            controller.handleSelectListTab(controller.bsnsSelectTabIsSelected, 2);
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
      isSort: false,
      columns: [
        gridColumn('bsnsSqnc', '차수'),
        gridColumn('bsnsStrtDe', '시작날짜'),
        gridColumn('bsnsEndDe', '종료날짜'),
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
        gridColumn('ownerNo', '소유자번호'),
        gridColumn('ladLdgrOwnerNm', '소유자명'),
        gridColumn('ladLdgrPosesnDivCd', '소유자구분'),
        gridColumn('ownerRegisterNo', '등록번호'),
        gridColumn('ownerTelNo', '전화번호'),
        gridColumn('ownerPhoneNo', '핸드폰번호'),
      ],
    );
  }

  /// [buildOwnerMngSearch] 소유자 관리 -> 토지정보 검색
  Widget buildOwnerLadInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerLadInfoDataSource.value,
      controller: controller.ownerLadInfoDataGridController,
      isSort: false,
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
        gridColumn('lgdongNm', '소재지'),
        gridColumn('lcrtsDivCd', '특지'),
        gridColumn('mlnoLtno', '본번'),
        gridColumn('slnoLtno', '부번'),
        gridColumn('ofcbkLndcgrDivCd', '공부'),
        gridColumn('sttusLndcgrDivCd', '현황'),
        gridColumn('ofcbkAra', '공부'),
        gridColumn('incrprAra', '편입'),
        gridColumn('cmpnstnInvstgAra', '조사'),
        gridColumn('acqsPrpDivCd', '취득용도'),
        gridColumn('aceptncPrpDivCd', '수용/사용'),
        gridColumn('accdtInvstgSqnc', '조사차수'),
        gridColumn('invstgDt', '조사일'),
        gridColumn('cmpnstnDtaChnStatDivCd', '보상진행단계'),
        gridColumn('etc', '비고'),
      ],
    );
  }

  /// [buildOwnerObstInfoDataGrid] 데이터그리드
  Widget buildOwnerObstInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerObstInfoDataSource.value,
      controller: controller.ownerObstInfoDataGridController,
      isSort: false,
      columns: [
        gridColumn('lgdongNm', '소재지'),
        gridColumn('lcrtsDivCd', '특지'),
        gridColumn('mlnoLtno', '본번'),
        gridColumn('slnoLtno', '부번'),
        gridColumn('obstSeq', '지장물순번'),
        gridColumn('obstDivCd', '지장물구분'),
        gridColumn('cmpnstnThingKndDtls', '물건의종류'),
        gridColumn('obstStrctStndrdInfo', '구조 및 규격'),
        gridColumn('cmpnstnQtyAraVu', '수량(면적)'),
        gridColumn('cmpnstnThingUnitDivCd', '단위'),
        gridColumn('sttusLndcgrDivCd', '현황지목'),
        gridColumn('acqsPrpDivCd', '취득용도'),
        gridColumn('aceptncUseDivCd', '수용용도'),
        gridColumn('accdtInvstgSqnc', '조사차수'),
        gridColumn('invstgDt', '조사일'),
        gridColumn('cmpnstnStepDivCd', '보상진행단계'),
        gridColumn('spcitm', '특이사항'),
      ],
    );
  }

  GridColumn gridColumn(String columnName, String label) {
    return GridColumn(
        width: controller.columnWidths[columnName]!,
        columnName: columnName,
        label: Container(
            height: 48.h,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(label,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    color: Color(0xFF1D1D1D)))));
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
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 0,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 5.w),
        Text('댐',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 1,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 8.w),
        Text('수도용지',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 2,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 5.w),
        Text('택지개발',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 3,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 5.w),
        Text('기타',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
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
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1D1D1D))),
        Radio(
          value: 0,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        Text('소유자',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        Radio(
          value: 1,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        Text('관계인',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
      ],
    );
  }
}
