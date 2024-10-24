import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ldm/screens/lp_controller.dart';

import '../components/custom_chip.dart';
import '../components/custom_microphonewithpen_button.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/lp_screen.dart';
import '../utils/applog.dart';
import '../utils/colors.dart';
import '../utils/dialog_util.dart';

class AccdtInvstgLadWidget {
  static Widget buildAccdtInvstgLadWidget(LpController controller) {
    return Obx(() =>
      Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 40.h, bottom: 0.h, left: 40.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomChip(
                      title: '토지검색',
                      isSelected: controller.accdtlnvstgTabLadSelected[0] == true,
                      onTap: () {
                        controller.handleAccdtlnvstgLadTabSelected(0);
                      }),
                  SizedBox(width: 12.w),
                  CustomChip(
                      title: '소유자/관계인',
                      isSelected: controller.accdtlnvstgTabLadSelected[1] == true,
                      onTap: () {
                        if(controller.accdtlnvstgLadSearchDataSource.value.rows.isNotEmpty){
                          controller.handleAccdtlnvstgLadTabSelected(1);
                        } else {
                          DialogUtil.showSnackBar(Get.context!, '알림', '토지검색을 먼저 진행해주세요.');
                        }
                      }),
                  SizedBox(width: 12.w),
                  CustomChip(
                      title: '조사내용',
                      isSelected: controller.accdtlnvstgTabLadSelected[2] == true,
                      onTap: () {
                        if(controller.accdtlnvstgLadSearchDataSource.value.rows.isNotEmpty){
                          controller.handleAccdtlnvstgLadTabSelected(2);
                        } else {
                          DialogUtil.showSnackBar(Get.context!, '알림', '토지검색을 먼저 진행해주세요.');
                        }
                      }),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: controller.accdtlnvstgTabLadSelected[0] == true,
                        child: Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: SizedBox(
                                width: Get.width,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // 토지검색 탭
                                      Visibility(
                                        visible: controller
                                            .accdtlnvstgTabLadSelected[0] ==
                                            true,
                                        child:
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Row(children: [
                                                  SizedBox(
                                                    //width: 140.w,
                                                    child: AutoSizeText('소재지',
                                                        style: TextStyle(
                                                          color: tableTextColor,
                                                          fontSize: 1.w > 1.h
                                                              ? 32.sp
                                                              : 52.sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgLadAddrController,
                                                      hintText: '소재지를 입력해주세요',
                                                      onChanged: (value) {
                                                        controller
                                                            .searchAccdtlnvstgLadAddr(
                                                            value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  SizedBox(
                                                    width: 160.w,
                                                    child: CustomTextField(
                                                      controller: controller.accdtlnvstgLadMlnoLtnoController,
                                                      hintText: '본번',
                                                      onChanged: (value) {
                                                        controller
                                                            .searchAccdtlnvstgLadMlnoLtno(
                                                            value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  SizedBox(
                                                    width: 160.w,
                                                    child: CustomTextField(
                                                      isReadOnly: false,
                                                      controller: controller
                                                          .accdtlnvstgLadSlnoLtnoController,
                                                      hintText: '부번',
                                                      onChanged: (value) {
                                                        controller
                                                            .searchAccdtlnvstgSlnoLtno(
                                                            value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                ])),
                                            Expanded(
                                                flex: 1,
                                                child: Row(children: [
                                                  SizedBox(
                                                    width: 140.w,
                                                    child: AutoSizeText('취득용도',
                                                        style: TextStyle(
                                                          color: tableTextColor,
                                                          fontSize: 1.w > 1.h
                                                              ? 32.sp
                                                              : 52.sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        )),
                                                  ),
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller
                                                          .accdtlnvstgLadAcqsPrpDivNmController,
                                                      hintText: '취득용도를 입력해주세요',
                                                      onChanged: (value) {},
                                                      isReadOnly: true,
                                                      onTap: () {
                                                        DialogUtil
                                                            .showBottomSheet(
                                                            Get.context!,
                                                            '취득용도를 선택해주세요',
                                                            Container(
                                                              padding:
                                                              EdgeInsets
                                                                  .all(20
                                                                  .r),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SingleChildScrollView(
                                                                    child: ListView
                                                                        .builder(
                                                                      shrinkWrap:
                                                                      true,
                                                                      physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                      itemCount: controller
                                                                          .accdtlnvstgAcqstnPrpsList
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                          index) {
                                                                        return ListTile(
                                                                          title: AutoSizeText(controller.accdtlnvstgAcqstnPrpsList[index],
                                                                              style: TextStyle(
                                                                                color: tableTextColor,
                                                                                fontSize: 32.sp,
                                                                                fontWeight: FontWeight.w500,
                                                                              )),
                                                                          onTap:
                                                                              () {
                                                                            controller.accdtlnvstgLadAcqsPrpDivNmController.text = controller.accdtlnvstgAcqstnPrpsList[index];
                                                                            controller
                                                                                .searchAccdtlnvstgLadPurps(
                                                                                controller
                                                                                    .accdtlnvstgLadAcqsPrpDivNmController
                                                                                    .text);
                                                                            Get.back();
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ));
                                                      },
                                                    ),
                                                  ),
                                                ])),
                                          ],
                                        ),
                                      ),
                                    ]))),
                      ),
                      SizedBox(height: 20.h),
                      Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[0] == true,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRichText(
                                      length: controller.accdtlnvstgLadDataSource
                                          .value.rows.length),
                                  Row(
                                    children: [
                                      // 초기화
                                      InkWell(
                                          onTap: () {
                                            controller.clearAccdtlnvstgLad();
                                          },
                                          child: Container(
                                              width: 72.w,
                                              height: 72.h,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(12.r),
                                                    side: BorderSide(
                                                        color: borderLine)),
                                              ),
                                              child: Icon(Icons.refresh,
                                                  color: Colors.black))),
                                      SizedBox(width: 20.w),
                                      // 복사
                                      InkWell(
                                        onTap: () {
                                          controller.copyAccdtlnvstgLad();
                                        },
                                        child: Container(
                                          width: 72.w,
                                          height: 72.h,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(12.r),
                                                side: BorderSide(
                                                    color: borderLine)),
                                          ),
                                          child: Icon(Icons.copy,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Obx(() {
                                return controller
                                    .accdtlnvstgLadDataSource.value.rows
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
                                    .buildLadAccdtlnvstgDataGrid();
                              }),
                            ],
                          )),
                      // 소유자 / 관계인
                      Visibility(
                          visible:
                          controller.accdtlnvstgTabLadSelected[1] == true,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('토지 정보',
                                    style: TextStyle(
                                      color: tableTextColor,
                                      fontSize: 1.w > 1.h ? 36.sp : 56.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                SizedBox(height: 20.h),
                                Obx(() {
                                  return controller
                                      .accdtlnvstgLadSearchDataSource.value.rows
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
                                      : SizedBox(
                                    height: 300.h,
                                    child: lpScreen()
                                        .buildLadAccdtlnvstgSearchDataGrid(),
                                  );
                                }),
                                SizedBox(height: 40.h),
                                AutoSizeText('소유자 현황',
                                    style: TextStyle(
                                      color: tableTextColor,
                                      fontSize: 1.w > 1.h ? 36.sp : 56.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                                SizedBox(height: 20.h),
                                lpScreen().buildAccdtlnvstgLadOwnerStatusDataGrid(),
                                SizedBox(height: 40.h),
                                controller.accdtlnvstgLadPartcpntDataSource.value
                                    .rows.isEmpty
                                    ? Container()
                                    : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText('소유자별 관계인 현황',
                                        style: TextStyle(
                                          color: tableTextColor,
                                          fontSize:
                                          1.w > 1.h ? 36.sp : 56.sp,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 20.h),
                                    Container(
                                      height: 200.h,
                                      child: lpScreen()
                                          .buildAccdtlnvstgLadPartcpntStatusDataGrid(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      // 조사내용
                      Visibility(
                          visible:
                          controller.accdtlnvstgTabLadSelected[2] == true,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 300.h,
                                  child: lpScreen()
                                      .buildLadAccdtlnvstgSearchDataGrid()),
                              /*SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText('현실이용 현황 조사 내용',
                                        style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 72.w,
                                        height: 72.h,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12.r),
                                              side:
                                              BorderSide(color: borderLine)),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.addBsns();
                                          },
                                          child: SvgPicture.asset(
                                              'assets/icons/ic_add.svg'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                              // Obx(() =>
                              //     Container(
                              //       color: Color(0xFFE5E8ED),
                              //       child: Table(
                              //         columnWidths: {
                              //           0: FlexColumnWidth(0.15),
                              //           1: FlexColumnWidth(1),
                              //           2: FlexColumnWidth(0.15),
                              //         },
                              //         border: TableBorder.all(color: borderLine),
                              //         children: [
                              //           TableRow(children: [
                              //             TableCell(
                              //               verticalAlignment:
                              //               TableCellVerticalAlignment.middle,
                              //               child: SizedBox(
                              //                 height: 104.h,
                              //                 child: Center(
                              //                     child: AutoSizeText('현실이용현황',
                              //                         style: TextStyle(
                              //                             fontSize: 30.sp,
                              //                             fontWeight:
                              //                             FontWeight.w700))),
                              //               ),
                              //             ),
                              //             TableCell(
                              //               verticalAlignment:
                              //               TableCellVerticalAlignment.middle,
                              //               child: SizedBox(
                              //                 height: 104.h,
                              //                 child: Center(
                              //                     child: AutoSizeText('용지지구 및 지역',
                              //                         style: TextStyle(
                              //                             fontSize: 30.sp,
                              //                             fontWeight:
                              //                             FontWeight.w700))),
                              //               ),
                              //             ),
                              //             TableCell(
                              //               verticalAlignment:
                              //               TableCellVerticalAlignment.middle,
                              //               child: SizedBox(
                              //                 height: 104.h,
                              //                 child: Center(
                              //                     child: AutoSizeText('면적(㎡)',
                              //                         style: TextStyle(
                              //                             fontSize: 30.sp,
                              //                             fontWeight:
                              //                             FontWeight.w700))),
                              //               ),
                              //             ),
                              //           ]),
                              //           for (var i = 0; i < 1; i++)
                              //             TableRow(children: [
                              //               TableCell(
                              //                 verticalAlignment:
                              //                 TableCellVerticalAlignment.middle,
                              //                 child: Container(
                              //                   color: Colors.white,
                              //                   height: 104.h,
                              //                   child: Center(
                              //                       child: AutoSizeText(controller.selectedLadRealUse.value ?? '',
                              //                           style: TextStyle(
                              //                               fontSize: 32.sp))),
                              //                 ),
                              //               ),
                              //               TableCell(
                              //                 verticalAlignment:
                              //                 TableCellVerticalAlignment.middle,
                              //                 child: Container(
                              //                   color: Colors.white,
                              //                   height: 104.h,
                              //                   child: Center(
                              //                       child: AutoSizeText(controller.selectedLadRealAra.value ?? '',
                              //                           style: TextStyle(
                              //                               fontSize: 32.sp))),
                              //                 ),
                              //               ),
                              //               TableCell(
                              //                 verticalAlignment:
                              //                 TableCellVerticalAlignment.middle,
                              //                 child: Container(
                              //                   color: Colors.white,
                              //                   height: 104.h,
                              //                   child: Center(
                              //                       child: AutoSizeText(controller.selectedLadRealPurpose.value ?? '',
                              //                           style: TextStyle(
                              //                               fontSize: 32.sp))),
                              //                 ),
                              //               ),
                              //             ]),
                              //           /*TableRow(children: [
                              //           TableCell(
                              //             verticalAlignment:
                              //                 TableCellVerticalAlignment.middle,
                              //             child: SizedBox(
                              //               height: 104.h,
                              //               child: Center(
                              //                   child: AutoSizeText('소계',
                              //                       style: TextStyle(
                              //                           fontSize: 30.sp,
                              //                           fontWeight:
                              //                               FontWeight.w700))),
                              //             ),
                              //           ),
                              //           TableCell(
                              //             verticalAlignment:
                              //                 TableCellVerticalAlignment.middle,
                              //             child: SizedBox(
                              //               height: 104.h,
                              //               child: Center(
                              //                   child: AutoSizeText('',
                              //                       style: TextStyle(
                              //                           fontSize: 30.sp,
                              //                           fontWeight:
                              //                               FontWeight.w700))),
                              //             ),
                              //           ),
                              //           TableCell(
                              //             verticalAlignment:
                              //                 TableCellVerticalAlignment.middle,
                              //             child: SizedBox(
                              //               height: 104.h,
                              //               child: Center(
                              //                   child: AutoSizeText('',
                              //                       style: TextStyle(
                              //                           fontSize: 30.sp,
                              //                           fontWeight:
                              //                               FontWeight.w700))),
                              //             ),
                              //           ),
                              //         ])*/
                              //         ],
                              //       ),
                              //     ),
                              // ),
                              SizedBox(height: 40.h),
                              Column(
                                children: [
                                  // 입회자
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: tableColor1,
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
                                          height: 104.h,
                                          child: AutoSizeText('입회자(이,통장) / 소유자 등',
                                              maxFontSize: 20,
                                              maxLines: 4,
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  color: tableTextColor,
                                                  fontSize: 30.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
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
                                          height: 104.h,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomTextField(
                                                    controller: controller
                                                        .accdtlnvstgLadPartcpntController,
                                                    hintText: '입회자명',
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                    backgroundColor: tableColor1,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                CustomMicrophonewithpenButton(
                                                  controller
                                                      .accdtlnvstgLadPartcpntController,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: tableColor1,
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
                                          height: 104.h,
                                          child: AutoSizeText('주소',
                                              style: TextStyle(
                                                  color: tableTextColor,
                                                  fontSize: 30.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
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
                                          height: 104.h,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomTextField(
                                                    controller: controller
                                                        .accdtlnvstgLadPartcpntAddrController,
                                                    hintText: '주소',
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                    backgroundColor: tableColor1,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                CustomMicrophonewithpenButton(
                                                  controller
                                                      .accdtlnvstgLadPartcpntAddrController,
                                                ),
                                              ],
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
                                            color: tableColor1,
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
                                          height: 104.h,
                                          child: AutoSizeText('특이사항',
                                              style: TextStyle(
                                                  color: tableTextColor,
                                                  fontSize: 30.sp,
                                                  fontWeight: FontWeight.w700)),
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
                                          height: 104.h,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomTextField(
                                                    controller: controller
                                                        .accdtlnvstgLadPartcpntRmController,
                                                    hintText: '특이사항',
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                    backgroundColor: tableColor1,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                CustomMicrophonewithpenButton(
                                                  controller
                                                      .accdtlnvstgLadPartcpntRmController,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // 사진촬영
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 192.h,
                                          decoration: BoxDecoration(
                                            color: tableColor1,
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
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 10.h),
                                              AutoSizeText('사진촬영',
                                                  style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                      FontWeight.w700)),
                                              SizedBox(height: 10.h),
                                              InkWell(
                                                onTap: () {
                                                  controller.takePhoto('lad');
                                                },
                                                child: Container(
                                                  width: 72.w,
                                                  height: 72.h,
                                                  margin:
                                                  EdgeInsets.only(bottom: 10.h),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFFFFFFF),
                                                      borderRadius:
                                                      BorderRadius.circular(6.r),
                                                      border: Border.all(
                                                          color: borderLine)),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/icons/ic_camera.svg',
                                                    ),
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
                                          height: 192.h,
                                          child: Obx(() =>
                                              Row(
                                                children: [
                                                  for (var i = 0; i < controller.ladImages.length; i++)
                                                    Container(
                                                      height: 300.h,
                                                      margin: EdgeInsets.only(right: 10.w),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFFFFFF),
                                                          borderRadius: BorderRadius.circular(6.r),
                                                          border: Border.all(color: borderLine)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          AppLog.i('사진 클릭');
                                                          controller.previewImage(controller.ladImages[i]);
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Image.file(controller.files[i]),
                                                        ),
                                                      ),
                                                    ),
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
                )
            ),
            // 조사내용 저장
            Container(
              width: double.infinity,
              height: 100.h,
              margin: EdgeInsets.only(top: 40.h, bottom: 0.h, left: 40.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //controller.saveAccdtlnvstgLad();

                    // AppLog.i('실태조사 토지 > 현실이용현황 > ${controller.accdtlnvstgLadRealUseEditController.text}');
                    // AppLog.i('실태조사 토지 > 용지지구 및 지역 > ${controller.accdtlnvstgLadRealUseEdit2Controller.text}');
                    // AppLog.i('실태조사 토지 > 면적 > ${controller.accdtlnvstgLadRealUseEdit3Controller.text}');
                    AppLog.i('실태조사 토지 > 입회자 > ${controller.accdtlnvstgLadPartcpntController.text}');
                    AppLog.i('실태조사 토지 > 주소 > ${controller.accdtlnvstgLadPartcpntAddrController.text}');
                    AppLog.i('실태조사 토지 > 특이사항 > ${controller.accdtlnvstgLadPartcpntRmController.text}');

                    AppLog.i('실태조사 토지 > 사업정보 > ${controller.selectedBsnsSelectArea.value.toJson()}');
                    AppLog.i('실태조사 토지 > 토지정보 > ${controller.selectedLadData.value.toJson()}');



                    // controller.tempInsertPhoto();

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Container(
                      width: 200.w,
                      height: 72.h,
                      alignment: Alignment.center,
                      child: AutoSizeText('사진저장(임시)',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
