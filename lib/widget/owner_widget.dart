import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_button.dart';
import 'package:ldi/components/custom_sliver_persistent_headerdelegate.dart';
import 'package:ldi/utils/common_util.dart';

import '../components/base_tabbar.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/bsns/lp_controller.dart';
import '../screens/bsns/select/lp_screen.dart';
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
                        //lpScreen().buildOwnerMngRadio(),
                        //SizedBox(width: 32.w),
                        Expanded(child: CustomTextField(controller: controller.ownerNameSearchController, hintText: '소유자명을 입력해주세요', onChanged: (value) {
                          controller.searchOwnerName(value);
                        })),
                        SizedBox(width: 12.w),
                        Expanded(child: CustomTextField(controller: controller.ownerRegisterNoSearchController, hintText: '등록번호', onChanged: (value) {
                          controller.searchOwnerRrnEnc(value);
                        })),
                      ],
                    ),
                    //SizedBox(height: 32.h),
                    /*Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: '조회',
                          color: Color(0xFF1D1D1D),
                          prefixIcon: SvgPicture.asset('assets/icons/ic_search.svg', width: 32.w, height: 32.h),
                          onPressed: () {},
                        ),
                        SizedBox(width: 12.w),
                        CustomButton().refreshButton()
                      ],
                    ),*/
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
                child: lpScreen().buildOwnerListDataGrid()
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
      child: Column(
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
        ],
      ),
    );
  }

  /// 소유자관리 -> 지장물정보
  static buildOwnerObstInfoContainer(LpController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child: Column(
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
    );
  }

  /// 소유자관리 -> 정보변경
  static buildOwnerInfoChangeContainer(LpController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child:
      /*Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              // 소유자명, 소유자구분
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 80.h,
                        alignment: Alignment.center,
                        child: Center(
                            child: AutoSizeText('소유자명',
                                style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20.r),
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: AutoSizeText(controller.selectedOwner.value.ownerNm ?? '',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 80.h,
                        alignment: Alignment.center,
                        child: Center(
                            child: AutoSizeText('소유자구분',
                                style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20.r),
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: AutoSizeText(controller.selectedOwner.value.ownerDivCd ?? '',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                  ],
                ),
              ),
              // 등록번호
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 80.h,
                        alignment: Alignment.center,
                        child: Center(
                            child: AutoSizeText('등록번호',
                                style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 80.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: AutoSizeText(controller.selectedOwner.value.ownerRrnEnc ?? '',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                  ],
                ),
              ),
              // 전화번호
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 80.h,
                        alignment: Alignment.center,
                        child: Center(
                            child: AutoSizeText('전화번호',
                                style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: AutoSizeText(controller.selectedOwner.value.ownerTelno ?? '',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 80.h,
                        alignment: Alignment.center,
                        child: Center(
                            child: AutoSizeText('휴대폰번호',
                                style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: AutoSizeText(controller.selectedOwner.value.ownerMbtlnum?? '',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                  ],
                ),
              ),
              // 특이사항
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 256.h,
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        alignment: Alignment.center,
                        child: Center(
                            child: AutoSizeText('특이사항',
                                style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 256.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: AutoSizeText(controller.selectedOwner.value.accdtInvstgRm ?? '',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 1.w > 1.h ? 144.w : 14.h,
                  height: 1.w > 1.h ? 72.h : 92.w,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: ShapeDecoration(
                    color: Color(0xFF2287EF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '저장',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),*/
      Container(
        width: double.infinity,
        child: Column(
          children: [
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
                          child: AutoSizeText(CommonUtil.maskOwnerRegisterNo(controller.selectedOwner.value.ownerRrnEnc ?? ''),
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
                          child: AutoSizeText(CommonUtil.phoneHyphen(controller.selectedOwner.value.ownerTelno ?? ''),
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
                          child: AutoSizeText(CommonUtil.phoneHyphen(controller.selectedOwner.value.ownerMbtlnum ?? ''),
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
                        child: Center(
                          child: AutoSizeText(controller.selectedOwner.value.accdtInvstgRm ?? '',
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
            )
          ],
        ),
      )
    );
  }
}
