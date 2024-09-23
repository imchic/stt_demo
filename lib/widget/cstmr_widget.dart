import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_button.dart';
import 'package:ldi/components/custom_chip.dart';
import 'package:ldi/components/custom_sliver_persistent_headerdelegate.dart';
import 'package:ldi/components/custom_textfield.dart';
import 'package:ldi/screens/bsns/select/lp_screen.dart';
import 'package:ldi/utils/colors.dart';

import '../screens/bsns/lp_controller.dart';

/// 고객카드 위젯

class CstmrCardWidget {
  static Widget buildCstmrCard(LpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Container(
        margin: EdgeInsets.only(top: 64.h),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                /*SliverPersistentHeader(
                    pinned: false,
                    floating: true,
                    delegate: CustomSliverPersistentHeaderDelegate(
                        minHeight: 250.h,
                        maxHeight: 250.h,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2.w, color: Color(0xFFD8D8D8)),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 100.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 140.w,
                                              height: 100.h,
                                              child: Center(
                                                  child: AutoSizeText(
                                                '사업구역명',
                                                style: TextStyle(
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 1,
                                              ))),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            child: CustomTextField(
                                              controller: controller
                                                  .sqncController,
                                              hintText: '',
                                              onChanged: (value) {},
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          CustomButton(
                                            color: Color(0XFFE5E8ED),
                                            text: '조회',
                                            textColor: Color(0xFF1D1D1D),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    )),
                                    SizedBox(width: 80.w),
                                    Expanded(
                                        child: Container(
                                      height: 100.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 140.w,
                                              height: 100.h,
                                              child: Center(
                                                  child: AutoSizeText(
                                                '소유자명',
                                                style: TextStyle(
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 1,
                                              ))),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            child: CustomTextField(
                                              controller: controller
                                                  .sqncController,
                                              hintText: '',
                                              onChanged: (value) {},
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          CustomButton(
                                            color: Color(0XFFE5E8ED),
                                            text: '조회',
                                            textColor: Color(0xFF1D1D1D),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 100.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 140.w,
                                              child: AutoSizeText(
                                                '등록번호',
                                                style: TextStyle(
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 1,
                                              )),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            child: CustomTextField(
                                              controller: controller
                                                  .sqncController,
                                              hintText: '',
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                    SizedBox(width: 80.w),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))),*/
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '소유자 정보',
                          style: TextStyle(
                              fontSize: 36.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 500.h,
                          color: Colors.white,
                          child: lpScreen().buildOwnerListDataGrid(),
                        ),
                        SizedBox(height: 64.h),
                        Row(children: [
                          CustomChip(
                            title: '토지내역',
                            isSelected: controller.customerCardTabIsSelected[0],
                            onTap: () {
                              controller.handleCustomerCardTabSelected(0);
                            },
                          ),
                          SizedBox(width: 12.w),
                          CustomChip(
                            title: '지장물내역',
                            isSelected: controller.customerCardTabIsSelected[1],
                            onTap: () {
                              controller.handleCustomerCardTabSelected(1);
                            },
                          ),
                        ]),
                        SizedBox(height: 20.h),
                        Visibility(
                          visible: controller.customerCardTabIsSelected[0],
                          child: controller.ownerLadInfoDataSource.value.rows.length == 0
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '조회된 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              height: 350.h,
                              child: lpScreen().buildOwnerLadInfoDataGrid()),
                        ),
                        Visibility(
                          visible: controller.customerCardTabIsSelected[1],
                          child: controller.ownerObstInfoDataSource.value.rows.length == 0
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '조회된 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              height: 350.h,
                              child: lpScreen().buildOwnerObstInfoDataGrid()),
                        ),
                        SizedBox(height: 48.h),
                        Row(
                          children: [
                            CustomChip(
                              title: '관계인',
                              isSelected: controller.customerCardDetailTabIsSelected[0],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(0);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '협의내역',
                              isSelected: controller.customerCardDetailTabIsSelected[1],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(1);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '수용재결',
                              isSelected: controller.customerCardDetailTabIsSelected[2],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(2);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '이의재결',
                              isSelected: controller.customerCardDetailTabIsSelected[3],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(3);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '소송',
                              isSelected: controller.customerCardDetailTabIsSelected[4],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(4);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '환매',
                              isSelected: controller.customerCardDetailTabIsSelected[5],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(5);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '토지수용확인원',
                              isSelected: controller.customerCardDetailTabIsSelected[6],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(6);
                              },
                            ),
                            SizedBox(width: 12.w),
                            CustomChip(
                              title: '이의신청',
                              isSelected: controller.customerCardDetailTabIsSelected[7],
                              onTap: () {
                                controller.handleCustomerCardDetailTabSelected(7);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        // 관계인 (토지)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[0],
                          child: controller.cstmrcardLadPartcpntDataSource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '토지정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              height: 200.h,
                              child: lpScreen().buildCstmrcardLadParcpntDataGrid()),
                        ),
                        SizedBox(height: 20.h),
                        // 관계인 (지장물)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[0],
                          child: controller.cstmrcardObstPartcpntDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '지장물정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              height: 200.h,
                              child: Column(
                                children: [
                                  lpScreen().buildCstmrcardObstParcpntDataGrid(),
                                ],
                              )),
                        ),
                        // 협의내역
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[1],
                          child: controller.cstrmcardCmpnstnDatSource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '협의내역 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              height: 200.h,
                              child: Column(
                                children: [
                                  lpScreen().buildCstmrcardCmpnstnDataGrid(),
                                ],
                              )),
                        ),
                        // 수용재결 (토지)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[2],
                          child: controller.cstmrcardLadAceptncDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '토지정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  lpScreen().buildCstmrcardLadAceptncDataGrid(),
                                ],
                              )),
                        ),
                        SizedBox(height: 20.h),
                        // 수용재결 (지장물)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[2],
                          child: controller.cstmrcardObstAceptncDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '지장물정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  lpScreen().buildCstmrcardObstAceptncDataGrid(),
                                ],
                              )),
                        ),
                        // 이의재결 (토지)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[3],
                          child: controller.cstmrcardLadObjcDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '토지정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  lpScreen().buildCstmrcardLadObjcDataGrid(),
                                ],
                              )),
                        ),
                        SizedBox(height: 20.h),
                        // 이의재결 (지장물)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[3],
                          child: controller.cstmrcardObstObjcDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '지장물정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  lpScreen().buildCstmrcardObstObjcDataGrid(),
                                ],
                              )),
                        ),
                        // 소송 (토지)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[4],
                          child: controller.cstmrcardLadLwstDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '토지정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 300.h,
                                      child: lpScreen().buildCstmrcardLadLwstDataGrid()
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: 20.h),
                        // 소송 (지장물)
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[4],
                          child: controller.cstmrcardObstLwstDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '지장물정보 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 300.h,
                                      child: lpScreen().buildCstmrcardObstLwstDataGrid()
                                  ),
                                ],
                              )),
                        ),
                        // 환매
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[5],
                          child: controller.cstmrcardReprchsDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '환매 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 300.h,
                                      child: lpScreen().buildCstmrcardReprchstDataGrid()
                                  ),
                                ],
                              )),
                        ),
                        // 토지수용확인원
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[6],
                          child: controller.cstmrcardConfirmDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '토지수용확인원 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 300.h,
                                      child: lpScreen().buildCstmrcardConfirmDataGrid()
                                  ),
                                ],
                              )),
                        ),
                        // 이의신청
                        Visibility(
                          visible: controller.customerCardDetailTabIsSelected[7],
                          child: controller.cstmrcardFobjctDatasource.value.rows.isEmpty
                              ? Container(
                            width: Get.width,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '이의신청 데이터가 없습니다.',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                              : SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 300.h,
                                      child: lpScreen().buildCstmrcardFobjctDataGrid()
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
