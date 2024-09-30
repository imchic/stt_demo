import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/screens/lp_controller.dart';

import '../components/custom_button.dart';
import '../components/custom_chip.dart';
import '../components/custom_microphonewithpen_button.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/lp_screen.dart';
import '../utils/colors.dart';
import '../utils/dialog_util.dart';

class AccdtInvstgObstWidget {
  static Widget buildAccdtInvstgObstWidget(LpController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 104.h,
          //padding: EdgeInsets.all(40.r),
          margin: EdgeInsets.only(
              top: 40.h, bottom: 0.h, left: 40.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomChip(
                  title: '지장물검색',
                  isSelected: controller
                      .accdtlnvstgTabObstSelected[0] ==
                      true,
                  onTap: () {
                    controller
                        .handleAccdtlnvstgObstTabSelected(0);
                  }),
              SizedBox(width: 12.w),
              CustomChip(
                  title: '조사내용',
                  isSelected: controller
                      .accdtlnvstgTabObstSelected[1] ==
                      true,
                  onTap: () {
                    controller
                        .handleAccdtlnvstgObstTabSelected(1);
                  }),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(
              controller: controller.accdtlnvstgObstTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(40.r),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: controller
                              .accdtlnvstgTabObstSelected[0] ==
                              true,
                          child: Container(
                              width: Get.width,
                              //height: 256.h,
                              padding: EdgeInsets.all(40.r),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0, color: borderLine),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.r)),
                                ),
                              ),
                              child: SizedBox(
                                  width: Get.width,
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        // 지장물검색 탭
                                        Visibility(
                                          visible: controller.accdtlnvstgTabObstSelected[0] == true,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child : Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 140.w,
                                                          child: AutoSizeText(
                                                              '소재지',
                                                              style:
                                                              TextStyle(
                                                                color:
                                                                tableTextColor,
                                                                fontSize: 1.w >
                                                                    1.h
                                                                    ? 32.sp
                                                                    : 52.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              )),
                                                        ),
                                                        Expanded(
                                                          child: CustomTextField(
                                                            controller: controller
                                                                .accdtlnvstgObstAddrController,
                                                            hintText: '소재지를 입력해주세요',
                                                            onChanged: (value) {
                                                              controller.searchAccdtlnvstgObstAddr(value);
                                                            },
                                                          ),
                                                        ),
                                                        // SizedBox(
                                                        //   width: 12.w,
                                                        // ),
                                                        // SizedBox(
                                                        //   width:120.w,
                                                        //   child: CustomTextField(
                                                        //     controller: controller
                                                        //         .accdtlnvstgObstMlnoLtnoController,
                                                        //     hintText: '본번',
                                                        //     onChanged: (value) {
                                                        //       //controller.searchBsnsName(value);
                                                        //     },
                                                        //   ),
                                                        // ),
                                                        // SizedBox(
                                                        //   width: 12.w,
                                                        // ),
                                                        // SizedBox(
                                                        //   width: 120.w,
                                                        //   child: CustomTextField(
                                                        //     controller: controller
                                                        //         .accdtlnvstgObstSlnoLtnoController,
                                                        //     hintText: '부번',
                                                        //     onChanged: (value) {
                                                        //       //controller.searchBsnsName(value);
                                                        //     },
                                                        //   ),
                                                        // ),
                                                        SizedBox(
                                                          width: 20.w,
                                                        ),
                                                      ]
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child : Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 140.w,
                                                          child: AutoSizeText(
                                                              '취득용도',
                                                              style:
                                                              TextStyle(
                                                                color:
                                                                tableTextColor,
                                                                fontSize: 1.w >
                                                                    1.h
                                                                    ? 32.sp
                                                                    : 52.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              )),
                                                        ),
                                                        Expanded(
                                                          child: CustomTextField(
                                                            controller: controller
                                                                .accdtlnvstgObstAcqsPrpDivNmController,
                                                            hintText: '취득용도를 입력해주세요',
                                                            onChanged: (value) {},
                                                            isReadOnly: true,
                                                            onTap: () {
                                                              DialogUtil.showBottomSheet(
                                                                  Get.context!,
                                                                  '취득용도를 선택해주세요',
                                                                  Container(
                                                                    padding: EdgeInsets.all(20.r),
                                                                    child: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child: ListView.builder(
                                                                            shrinkWrap: true,
                                                                            physics: NeverScrollableScrollPhysics(),
                                                                            itemCount: controller.accdtlnvstgAcqstnPrpsList.length,
                                                                            itemBuilder: (context, index) {
                                                                              return ListTile(
                                                                                title: AutoSizeText(controller.accdtlnvstgAcqstnPrpsList[index],
                                                                                    style: TextStyle(
                                                                                      color: tableTextColor,
                                                                                      fontSize: 32.sp,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    )),
                                                                                onTap: () {
                                                                                  controller.accdtlnvstgObstAcqsPrpDivNmController.text = controller.accdtlnvstgAcqstnPrpsList[index];
                                                                                  Get.back();
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ));
                                                            }
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 12.w,
                                                        ),
                                                        SizedBox(
                                                          child: CustomButton(
                                                            color: Color(0XFFE5E8ED),
                                                            text: '조회',
                                                            textColor: Color(0xFF1D1D1D),
                                                            onPressed: () {
                                                              controller.searchAccdtlnvstgObstPurps(controller.accdtlnvstgObstAcqsPrpDivNmController.text);
                                                            },
                                                          ),
                                                        )
                                                      ]
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]))),
                        ),
                        SizedBox(height: 20.h),
                        Visibility(
                            visible: controller
                                .accdtlnvstgTabObstSelected[
                            0] ==
                                true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                CustomRichText(
                                    length: controller
                                        .accdtlnvstgObstDataSource
                                        .value
                                        .rows
                                        .length),
                                SizedBox(height: 20.h),
                                Obx(() {
                                  return controller
                                      .accdtlnvstgObstDataSource.value.rows
                                      .isEmpty
                                      ? Center(
                                    child: AutoSizeText(
                                        '검색된 데이터가 없습니다.',
                                        style: TextStyle(
                                            color: tableTextColor,
                                            fontSize: 1.w > 1.h
                                                ? 36.sp
                                                : 56.sp,
                                            fontWeight: FontWeight.w700)),
                                  )
                                      : lpScreen()
                                      .buildLadAccdtlnvstgSearchDataGrid();
                                }),
                              ],
                            )),
                        // 조사내용
                        Visibility(
                            visible: controller
                                .accdtlnvstgTabObstSelected[
                            1] ==
                                true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('토지 정보',
                                    style: TextStyle(
                                        fontSize: 36.sp,
                                        fontWeight:
                                        FontWeight.w700)),
                                SizedBox(height: 20.h),
                                Obx(() {
                                  return controller
                                      .accdtlnvstgObstDataSource.value.rows
                                      .isEmpty
                                      ? Center(
                                    child: AutoSizeText(
                                        '검색된 데이터가 없습니다.',
                                        style: TextStyle(
                                            color: tableTextColor,
                                            fontSize: 1.w > 1.h
                                                ? 36.sp
                                                : 56.sp,
                                            fontWeight: FontWeight.w700)),
                                  )
                                      : lpScreen()
                                      .buildLadAccdtlnvstgSearchDataGrid();
                                }),
                                SizedBox(height: 20.h),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        AutoSizeText('소유자 현황',
                                            style: TextStyle(
                                                fontSize: 36.sp,
                                                fontWeight:
                                                FontWeight
                                                    .w700)),
                                        Row(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          children: [
                                            Container(
                                                height: 72.h,
                                                alignment: Alignment
                                                    .center,
                                                padding: EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    24.w),
                                                decoration:
                                                ShapeDecoration(
                                                  color:
                                                  Colors.white,
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 2.r,
                                                        color: Color(
                                                            0xFFD8D8D8)),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12.r),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      6.w),
                                                  child: InkWell(
                                                    onTap: () {
                                                      DialogUtil.showAlertDialog(
                                                          Get.context!,
                                                          2040,
                                                          '지장물 소유자 추가',
                                                          widget:
                                                          Container(
                                                            width: double
                                                                .infinity,
                                                            child:
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize.min,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                    width: double.infinity,
                                                                    height: 104.h,
                                                                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: borderLine), borderRadius: BorderRadius.circular(6.r)),
                                                                    child: Container(
                                                                      height: 72.h,
                                                                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                                                                      child: Row(
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child: Container(
                                                                              width: double.infinity,
                                                                              child: Row(
                                                                                children: [
                                                                                  SizedBox(width: 60.w, child: AutoSizeText('성명', style: TextStyle(color: tableTextColor, fontSize: 30.sp, fontWeight: FontWeight.w700))),
                                                                                  Expanded(
                                                                                    child: CustomTextField(
                                                                                        controller: controller
                                                                                            .accdtlnvstgSearchNmController,
                                                                                        hintText: '',
                                                                                        onChanged: (value) {
                                                                                          controller.searchOwnerName(value);
                                                                                        }),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(width: 40.w),
                                                                          Expanded(
                                                                            child: Container(
                                                                              width: double.infinity,
                                                                              child: Row(
                                                                                children: [
                                                                                  SizedBox(width: 60.w, child: AutoSizeText('등록번호', style: TextStyle(color: tableTextColor, fontSize: 30.sp, fontWeight: FontWeight.w700))),
                                                                                  Expanded(
                                                                                    child: CustomTextField(
                                                                                        controller: controller
                                                                                            .accdtlnvstgSearchNoController,
                                                                                        hintText: '',
                                                                                        onChanged: (value) {
                                                                                          controller.searchOwnerRrnEnc(value);
                                                                                        }),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                                SizedBox(height: 16.h),
                                                                SizedBox(
                                                                  height: 400.h,
                                                                  child: SingleChildScrollView(
                                                                    child: Obx(() => lpScreen().buildOwnerListDataGrid(controller.ownerListDataSource.value)),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 16.h),
                                                                SizedBox(
                                                                  width: double.infinity,
                                                                  height: 400.h,
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                          height: 104.h,
                                                                          child: Row(
                                                                            children: [
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '소유자번호',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {

                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '소유자명',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '소유구분',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(width: 6.w),
                                                                                        CustomButton(
                                                                                          color: Color(0xFFE5E8ED),
                                                                                          textColor: Color(0xFF1D1D1D),
                                                                                          text: '조회',
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )),
                                                                      SizedBox(height: 1.h),
                                                                      Container(
                                                                          height: 104.h,
                                                                          child: Row(
                                                                            children: [
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '소유자구분',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(width: 6.w),
                                                                                        CustomButton(
                                                                                          color: Color(0xFFE5E8ED),
                                                                                          textColor: Color(0xFF1D1D1D),
                                                                                          text: '조회',
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '등록번호',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '전화번호',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )),
                                                                      SizedBox(height: 1.h),
                                                                      Container(
                                                                          height: 104.h,
                                                                          child: Row(
                                                                            children: [
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '핸드폰번호',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '지분분자',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 176.w,
                                                                                height: 104.h,
                                                                                color: Color(0XFFE5E8ED),
                                                                                child: Center(
                                                                                  child: AutoSizeText(
                                                                                    '지분분모',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 30.sp,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.symmetric(
                                                                                      horizontal: BorderSide(
                                                                                        color: Color(0XFFE5E8ED),
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 72.h,
                                                                                            child: CustomTextField(
                                                                                              controller: controller.sqncController,
                                                                                              hintText: '',
                                                                                              isPassword: false,
                                                                                              isReadOnly: false,
                                                                                              onChanged: (value) {
                                                                                                print('orderController : $value');
                                                                                              },
                                                                                            ),
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
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          textOk:
                                                          '저장',
                                                          onOk: () {
                                                            print('추가');
                                                          }, onCancel:
                                                          () {
                                                        print('취소');
                                                      });
                                                    },
                                                    child: InkWell(
                                                      child: AutoSizeText(
                                                          '추가',
                                                          style: TextStyle(
                                                              color:
                                                              tableTextColor,
                                                              fontSize: 32
                                                                  .sp,
                                                              fontWeight:
                                                              FontWeight.w500)),
                                                    ),
                                                  ),
                                                )),
                                            SizedBox(width: 10.w),
                                            Container(
                                                height: 72.h,
                                                alignment: Alignment
                                                    .center,
                                                padding: EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    24.w),
                                                decoration:
                                                ShapeDecoration(
                                                  color:
                                                  Colors.white,
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 2.r,
                                                        color: Color(
                                                            0xFFD8D8D8)),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12.r),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      6.w),
                                                  child: InkWell(
                                                    onTap: () {
                                                      DialogUtil.showAlertDialog(
                                                          Get
                                                              .context!,
                                                          0,
                                                          '지장물 소유자 수정',
                                                          widget:
                                                          Container(),
                                                          onOk: () {
                                                            print('수정');
                                                          }, onCancel:
                                                          () {
                                                        print('취소');
                                                      });
                                                    },
                                                    child: AutoSizeText(
                                                        '수정',
                                                        style: TextStyle(
                                                            color:
                                                            tableTextColor,
                                                            fontSize: 32
                                                                .sp,
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  ),
                                                )),
                                            SizedBox(width: 10.w),
                                            Container(
                                                height: 72.h,
                                                alignment: Alignment
                                                    .center,
                                                padding: EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    24.w),
                                                decoration:
                                                ShapeDecoration(
                                                  color:
                                                  Colors.white,
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 2.r,
                                                        color: Color(
                                                            0xFFD8D8D8)),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12.r),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      6.w),
                                                  child: InkWell(
                                                    onTap: () {
                                                      DialogUtil.showAlertDialog(
                                                          Get.context!,
                                                          1440,
                                                          '토지 소유자 불러오기',
                                                          widget:
                                                          Container(
                                                            child: Obx(() => lpScreen().buildOwnerListDataGrid(controller.ownerListDataSource.value)),
                                                          ),
                                                          onOk: () {
                                                            print(
                                                                '토지소유자 불러오기');
                                                          }, onCancel:
                                                          () {
                                                        print('취소');
                                                      });
                                                    },
                                                    child: AutoSizeText(
                                                        '토지소유자 불러오기',
                                                        style: TextStyle(
                                                            color:
                                                            tableTextColor,
                                                            fontSize: 32
                                                                .sp,
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40.h),
                                    Container(
                                        width: double.infinity,
                                        height: 300.h,
                                        child: lpScreen()
                                            .buildAccdtlnvstgObstOwnerStatusDataGrid()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      '지장물 등록 현황',
                                      style: TextStyle(
                                          fontSize: 36.sp,
                                          fontWeight:
                                          FontWeight.w700),
                                      maxLines: 1,
                                    ),
                                    Container(
                                        height: 72.h,
                                        alignment: Alignment.center,
                                        padding:
                                        EdgeInsets.symmetric(
                                            horizontal: 24.w),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape:
                                          RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 2.w,
                                                color: Color(
                                                    0xFFD8D8D8)),
                                            borderRadius:
                                            BorderRadius
                                                .circular(12.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsets.all(8.r),
                                          child: AutoSizeText(
                                              '신규등록',
                                              style: TextStyle(
                                                  color:
                                                  tableTextColor,
                                                  fontSize: 30.sp,
                                                  fontWeight:
                                                  FontWeight
                                                      .w500)),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(
                                  children: [
                                    // 조사차수, 조사일자
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '조사차수',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child:
                                              CustomTextField(
                                                controller: controller
                                                    .accdtlnvstgAcqstnPrpsController,
                                                isReadOnly: true,
                                                hintText:
                                                '선택/저장된 정보',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                                backgroundColor:
                                                tableColor1,
                                                textColor:
                                                Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '조사일자',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child:
                                              CustomTextField(
                                                controller: controller
                                                    .accdtlnvstgAcqstnPrpsController,
                                                isReadOnly: true,
                                                hintText:
                                                '선택/저장된 정보',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                                backgroundColor:
                                                tableColor1,
                                                textColor:
                                                Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 조사자, 지장물순번
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '조사자',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                // bottom: BorderSide(
                                                //   color: Color(0xFFD8D8D8),
                                                //   width: 1,
                                                // ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize
                                                    .min,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '사번',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '직급',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '성명',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '지장물순번',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                top: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child:
                                              CustomTextField(
                                                controller: controller
                                                    .accdtlnvstgAcqstnPrpsController,
                                                isReadOnly: true,
                                                hintText: '',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                                backgroundColor:
                                                tableColor1,
                                                textColor:
                                                Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 지장물구분, 수량, 단위
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '지장물구분',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child:
                                              CustomTextField(
                                                controller: controller
                                                    .accdtlnvstgAcqstnPrpsController,
                                                isReadOnly: true,
                                                hintText: '선택된 정보',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                                backgroundColor:
                                                tableColor1,
                                                textColor:
                                                Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '수량',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child:
                                              CustomTextField(
                                                controller: controller
                                                    .accdtlnvstgAcqstnPrpsController,
                                                isReadOnly: true,
                                                hintText: '',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                                backgroundColor:
                                                tableColor1,
                                                textColor:
                                                Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '단위',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child:
                                              CustomTextField(
                                                controller: controller
                                                    .accdtlnvstgAcqstnPrpsController,
                                                isReadOnly: true,
                                                hintText: '',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                                backgroundColor:
                                                tableColor1,
                                                textColor:
                                                Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 물건종류
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '물건종류',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '내용을 입력하세요.',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(controller
                                                      .accdtlnvstgAcqstnPrpsController),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 구조 및 규격
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '구조 및 규격',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '내용을 입력하세요.',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(
                                                    controller
                                                        .accdtlnvstgAcqstnPrpsController,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 상황
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '상황',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '내용을 입력하세요.',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(controller
                                                      .accdtlnvstgAcqstnPrpsController),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 특이사항
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '특이사항',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '내용을 입력하세요.',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(controller
                                                      .accdtlnvstgAcqstnPrpsController),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 지장물 비고사항
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '지장물 비고사항',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '내용을 입력하세요.',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(controller
                                                      .accdtlnvstgAcqstnPrpsController),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 입회자
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '입회자',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '입회자',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(controller
                                                      .accdtlnvstgAcqstnPrpsController),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: AutoSizeText(
                                                '주소',
                                                style: TextStyle(
                                                    color:
                                                    tableTextColor,
                                                    fontSize: 30.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 104.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                    CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgAcqstnPrpsController,
                                                      isReadOnly:
                                                      true,
                                                      hintText:
                                                      '주소',
                                                      onChanged:
                                                          (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor:
                                                      tableColor1,
                                                      textColor:
                                                      Colors
                                                          .red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 10.w),
                                                  CustomMicrophonewithpenButton(controller
                                                      .accdtlnvstgAcqstnPrpsController),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 사진촬영
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 192.h,
                                            decoration:
                                            BoxDecoration(
                                              color: tableColor1,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(
                                                    height: 10.h),
                                                AutoSizeText('사진촬영',
                                                    style: TextStyle(
                                                        color:
                                                        tableTextColor,
                                                        fontSize:
                                                        30.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700)),
                                                SizedBox(
                                                    height: 10.h),
                                                Container(
                                                  width: 72.w,
                                                  height: 72.h,
                                                  margin: EdgeInsets
                                                      .only(
                                                      bottom:
                                                      10.h),
                                                  decoration: BoxDecoration(
                                                      color: Color(
                                                          0xFFFFFFFF),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(6
                                                          .r),
                                                      border: Border
                                                          .all(
                                                          color:
                                                          borderLine)),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(
                                                        8.0),
                                                    child:
                                                    SvgPicture
                                                        .asset(
                                                      'assets/icons/ic_camera.svg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            decoration:
                                            BoxDecoration(
                                              color:
                                              Color(0xFFFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                                right: BorderSide(
                                                  color: Color(
                                                      0xFFD8D8D8),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            alignment:
                                            Alignment.center,
                                            height: 192.h,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  Image.asset(
                                                      'assets/images/sample.png'),
                                                  SizedBox(
                                                      width: 10.w),
                                                  AutoSizeText(
                                                      '...',
                                                      style: TextStyle(
                                                          color:
                                                          tableTextColor,
                                                          fontSize:
                                                          30.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w700)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}