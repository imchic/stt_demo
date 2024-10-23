import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldm/components/custom_button.dart';
import 'package:ldm/components/custom_sliver_persistent_headerdelegate.dart';
import 'package:ldm/utils/common_util.dart';

import '../components/base_tabbar.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/lp_controller.dart';
import '../screens/lp_screen.dart';
import '../utils/colors.dart';

/// 소유자 위젯
class OwnerWidget {
  static buildOwnerView(LpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 48.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BaseTabBar(
                    controller: controller.bsnsOwnerTabController,
                    tabItems: controller.bsnsOwnerTabItems,
                    labelColor: Color(0xFF2287EF),
                    indicatorColor: Color(0xFF2287EF),
                    isScrollable: true,
                    activeColor: Color(0xFF2287EF),
                    unActiveTextColor: Color(0xFF555555),
                    activeTextColor: Colors.black,
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
              /// [소유자관리 -> 소유자정보]
              buildOwnerSearchContainer(controller),

              /// [소유자관리 -> 토지정보]
              buildOwnerLandInfoContainer(controller),

              /// [소유자관리 -> 지장물정보]
              buildOwnerObstInfoContainer(controller),

              /// [소유자관리 -> 정보변경]
              buildOwnerInfoChangeContainer(controller),
            ],
          ))
        ],
      ),
    );
  }

  /// 소유자관리 -> 소유자검색
  static buildOwnerSearchContainer(LpController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverPersistentHeader(
            pinned: false,
            floating : true,
            delegate: CustomSliverPersistentHeaderDelegate(
              minHeight: 150.h,
              maxHeight: 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Row(
                      children: [
                        Expanded(child: CustomTextField(controller: controller.ownerNameSearchController, hintText: '소유자명을 입력해주세요', onChanged: (value) {
                          controller.searchOwnerName(value);
                        })),
                        SizedBox(width: 12.w),
                        Expanded(child: CustomTextField(controller: controller.ownerRegisterNoSearchController, hintText: '등록번호', onChanged: (value) {
                          controller.searchOwnerRrnEnc(value);
                        })),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(length: controller.ownerListDataSource.value.rows.length),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: controller.ownerListDataSource.value.rows.isEmpty ? Container(
              width: double.infinity,
              child: Center(
                child: AutoSizeText('데이터가 없습니다.',
                    style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ) :
            Container(
                width: double.infinity,
                height: double.infinity,
                child: Obx(() => lpScreen().buildOwnerListDataGrid(controller.ownerListDataSource.value)),
            ),
          ),
        ],
      ),
    );
  }

  /// 소유자관리 -> 토지정보
  static buildOwnerLandInfoContainer(LpController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child: Obx(() =>
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRichText(length: controller.ownerLadInfoDataSource.value.rows.length),
            SizedBox(height: 20.h),
            controller.ownerLadInfoDataSource.value.rows.isEmpty ? Expanded(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: AutoSizeText('데이터가 없습니니다.',
                      style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ) :
            Expanded(child: lpScreen().buildOwnerLadInfoDataGrid()),
            SizedBox(height: 20.h),
            Expanded(child: controller.accdtlnvstgLadOwnerDataSource.value.rows.isEmpty ? Container() : Expanded(child: lpScreen().buildAccdtlnvstgLadOwnerStatusDataGrid())),
            SizedBox(height: 20.h),
            Expanded(child: controller.accdtlnvstgLadPartcpntDataSource.value.rows.isEmpty ? Container() : Expanded(child: lpScreen().buildAccdtlnvstgLadPartcpntStatusDataGrid())),
          ],
        ),
      ),
    );
  }

  /// 소유자관리 -> 지장물정보
  static buildOwnerObstInfoContainer(LpController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child: Obx(() =>
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRichText(length: controller.ownerObstInfoDataSource.value.rows.length),
            SizedBox(height: 20.h),
            controller.ownerObstInfoDataSource.value.rows.isEmpty ? Expanded(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: AutoSizeText('데이터가 없습니다.',
                      style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ) :
            Expanded(child: lpScreen().buildOwnerObstInfoDataGrid()),
          ],
        ),
      ),
    );
  }

  /// 소유자관리 -> 정보변경
  static buildOwnerInfoChangeContainer(LpController controller) {
    return Container(
        width: Get.width,
        padding: EdgeInsets.all(40.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    AutoSizeText('정보변경', style: TextStyle(color: Color(0xFF555555), fontSize: 32.sp, fontWeight: FontWeight.w400)),
                    Switch(
                      value: controller.isOwnerInfoChange.value,
                      onChanged: (value) {
                        controller.isOwnerInfoChange.value = value;
                        controller.ownerInfoChange();
                      },
                      activeColor: Color(0xFF2287EF),
                    ),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              // border: TableBorder.all(color: borderLine),
              border: TableBorder(
                top: BorderSide(color: borderLine),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // 4개의 row
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: tableColor1,
                        child: Center(
                          child: AutoSizeText('소유자명',
                              style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: Colors.white,
                        child: Center(
                          child: AutoSizeText(controller.selectedOwner.value.ownerNm ?? '',
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: tableColor1,
                        child: Center(
                          child: AutoSizeText('소유자구분',
                              style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: Colors.white,
                        child: Center(
                          child: AutoSizeText(controller.selectedOwner.value.ownerDivNm ?? '',
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ],
                ),
                // 2개의 row
              ],
            ),
            //SizedBox(height: 1.h),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
              },
              border: TableBorder(
                top: BorderSide(color: borderLine),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // 4개의 row
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: tableColor1,
                        child: Center(
                          child: AutoSizeText('등록번호',
                              style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: Colors.white,
                        child: Center(
                          child: AutoSizeText(controller.selectedOwner.value.ownerRrnEnc ?? '',
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ],
                ),
                // 2개의 row
              ],
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              border: TableBorder(
                top: BorderSide(color: borderLine),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // 4개의 row
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: tableColor1,
                        child: Center(
                          child: AutoSizeText('전화번호',
                              style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: Colors.white,
                        child: Center(
                          child: Obx(() => controller.isOwnerInfoChange.value == true ? CustomTextField(
                            isNumber: true,
                              controller: controller.ownerEditTelnoController, hintText: '전화번호를 입력해주세요', onChanged: (value) {
                            controller.selectedOwner.value.ownerTelno = value;
                          }) : AutoSizeText(CommonUtil.phoneHyphen(controller.selectedOwner.value.ownerTelno ?? ''),
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: tableColor1,
                        child: Center(
                          child: AutoSizeText('휴대폰번호',
                              style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 80.h,
                        color: Colors.white,
                        child: Center(
                          child: Obx(() => controller.isOwnerInfoChange.value == true ? CustomTextField(
                              isNumber: true,
                              controller: controller.ownerEditMbtlnumController, hintText: '휴대폰번호를 입력해주세요', onChanged: (value) {
                            controller.selectedOwner.value.ownerMbtlnum = value;
                          }) : AutoSizeText(CommonUtil.phoneHyphen(controller.selectedOwner.value.ownerMbtlnum ?? ''),
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // 2개의 row
              ],
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
              },
              border: TableBorder(
                top: BorderSide(color: borderLine),
                bottom: BorderSide(color: borderLine),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // 4개의 row
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        height: 256.h,
                        color: tableColor1,
                        child: Center(
                          child: AutoSizeText('특이사항',
                              style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        height: 256.h,
                        color: Colors.white,
                        child: Obx(() => controller.isOwnerInfoChange.value == true ? CustomTextField(
                            controller: controller.ownerEditAccdtInvstgRmController, hintText: '특이사항을 입력해주세요', onChanged: (value) {
                          controller.selectedOwner.value.accdtInvstgRm = value;
                        }) : AutoSizeText(controller.selectedOwner.value.accdtInvstgRm ?? '',
                            style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w400)),
                      ),
                    )),
                  ],
                ),
                // 2개의 row
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  text: '저장',
                  onPressed: () {
                    controller.saveOwnerInfo();
                    controller.isOwnerInfoChange.value = false;
                  },
                ),
              ],
            ),
          ],
        )
    );
  }
}
