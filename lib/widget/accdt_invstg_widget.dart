import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/screens/bsns/bsns_controller.dart';
import 'package:stt_demo/screens/bsns/select/bsns_select_screen.dart';

import '../utils/colors.dart';
import '../utils/custom_textfiled.dart';

class AccdtInvstgWidget {

  /// [buildAccdtInvstgView] 실태조사
  static buildAccdtInvstgView(BsnsController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: TabBar(
                    tabs: controller.accdtlnvstgTabItems,
                    controller: controller.accdtlnvstgTabController,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    isScrollable: true,
                  )),
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
                  controller: controller.accdtlnvstgTabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.only(top: 24.h),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.handleAccdtlnvstgLadTabSelected(0);
                                      },
                                      child: Chip(
                                        label: Text('토지검색',
                                            style: TextStyle(
                                                color: Color(0XFF555555),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500)),
                                        backgroundColor:
                                        controller.accdtlnvstgTabLadSelected[0] == true
                                            ? Color(0XFFE4E4E4)
                                            : Colors.white,
                                        side: BorderSide(
                                          color: borderLine,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    InkWell(
                                      onTap: () {
                                        controller.handleAccdtlnvstgLadTabSelected(1);
                                      },
                                      child: Container(
                                        child: Chip(
                                          label: Text('소유자/관계인',
                                              style: TextStyle(
                                                  color: Color(0XFF555555),
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500)),
                                          backgroundColor:
                                          controller.accdtlnvstgTabLadSelected[1] == true
                                              ? Color(0XFFE4E4E4)
                                              : Colors.white,
                                          side: BorderSide(
                                            color: borderLine,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    InkWell(
                                      onTap: () {
                                        controller
                                            .handleAccdtlnvstgLadTabSelected(2);
                                      },
                                      child: Container(
                                        child: Chip(
                                          label: Text('조사내용',
                                              style: TextStyle(
                                                  color: Color(0XFF555555),
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500)),
                                          backgroundColor:
                                          controller.accdtlnvstgTabLadSelected[
                                          2] ==
                                              true
                                              ? Color(0XFFE4E4E4)
                                              : Colors.white,
                                          side: BorderSide(
                                            color: borderLine,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Visibility(
                                  visible: controller.accdtlnvstgTabLadSelected[0] == true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // 소재지
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 10,
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
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '소재지',
                                                            style: TextStyle(
                                                              color:
                                                              Color(0xFF1D1D1D),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
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
                                            Expanded(
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
                                            Expanded(
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
                                      ),
                                      SizedBox(width: 20.w),
                                      // 취득용도
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 10,
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
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '취득용도',
                                                            style: TextStyle(
                                                              color:
                                                              Color(0xFF1D1D1D),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Expanded(
                                                            child: CustomTextFiled(
                                                              controller: controller
                                                                  .ownerLctnSearchController,
                                                              hintText: '',
                                                              onChanged: (value) {
                                                                //controller.searchBsnsName(value);
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.w),
                                                          Container(
                                                            width: 52.w,
                                                            height: 40.h,
                                                            decoration:
                                                            ShapeDecoration(
                                                              color:
                                                              Color(0xFFD2D6DF),
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.r),
                                                              ),
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
                                                                  '조회',
                                                                  style: TextStyle(
                                                                    color: Color(
                                                                        0xFF1D1D1D),
                                                                    fontSize: 16.sp,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: controller.accdtlnvstgTabLadSelected[1] == true,
                                  child: SizedBox(
                                      height: Get.height * 0.15,
                                      child: BsnsSelectScreen().buildAccdtlnvstgOwnerDataGrid()
                                  ),
                                ),
                                Visibility(
                                  visible: controller.accdtlnvstgTabLadSelected[2] == true,
                                  child: SizedBox(
                                      height: Get.height * 0.15,
                                      child: BsnsSelectScreen().buildAccdtlnvstgOwnerDataGrid()
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        /// 토지 검색
                        Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[0] == true,
                          child: Expanded(
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(20.r),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
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
                                    Expanded(child: BsnsSelectScreen().buildOwnerLadInfoDataGrid())
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        /// 소유자 현황
                        Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[1] == true,
                          child: Expanded(
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(20.r),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                                ),
                              ),
                              child: SizedBox(
                                width: Get.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('소유자 현황', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                                    SizedBox(height: 20.h),
                                    Expanded(child: BsnsSelectScreen().buildAccdtlnvstgLadOwnerStatusDataGrid()),
                                    SizedBox(height: 20.h),
                                    Text('소유자별 관계인 현황', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                                    SizedBox(height: 20.h),
                                    Expanded(child: BsnsSelectScreen().buildAccdtlnvstgLadPartcpntStatusDataGrid()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        /// 조사내용
                        Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[2] == true,
                          child: Expanded(
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(20.r),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                                ),
                              ),
                              child: SizedBox(
                                width: Get.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('현실이용 현황 조사 내용', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                                        Container(
                                          width: 44.w,
                                          height: 32.h,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                side: BorderSide(color: borderLine)
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset('assets/images/ic_add.svg'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: tableColor1,
                                                  border: Border(
                                                    top: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('현실이용현황', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('용지지구 및 지역', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('면적(㎡)', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('전', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('답', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: tableColor1,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('소계', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('1,265', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Expanded(child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          // 입회자
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
                                                  child: Text('입회자', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                                      hintText: '입회자명',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor: tableColor1,
                                                      textColor: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20.h),
                                              Expanded(
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
                                                  height: 58.h,
                                                  child: Text('주소', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                                      hintText: '주소',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor: tableColor1,
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
                                                  height: 58.h,
                                                  child: Text('특이사항', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                                      hintText: '특이사항',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor: tableColor1,
                                                      textColor: Colors.red,
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
                                                  height: 90.h,
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
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 10.h),
                                                      Text('사진촬영', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                                      SizedBox(height: 10.h),
                                                      Container(
                                                        width: 44.w,
                                                        height: 38.h,
                                                        margin: EdgeInsets.only(bottom: 10.h),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xFFFFFFFF),
                                                            borderRadius: BorderRadius.circular(6.r),
                                                            border: Border.all(color: borderLine)
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: SvgPicture.asset(
                                                            'assets/images/ic_camera.svg',
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
                                                  height: 90.h,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Text('...', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 실태조사 > 지장물조사
                    Column(
                      children: [
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.only(top: 24.h),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.handleAccdtlnvstgObstTabSelected(0);
                                      },
                                      child: Chip(
                                        label: Text('지장물검색',
                                            style: TextStyle(
                                                color: Color(0XFF555555),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500)),
                                        backgroundColor:
                                        controller.accdtlnvstgTabObstSelected[0] == true
                                            ? Color(0XFFE4E4E4)
                                            : Colors.white,
                                        side: BorderSide(
                                          color: borderLine,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    InkWell(
                                      onTap: () {
                                        controller.handleAccdtlnvstgObstTabSelected(1);
                                      },
                                      child: Container(
                                        child: Chip(
                                          label: Text('조사내용',
                                              style: TextStyle(
                                                  color: Color(0XFF555555),
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500)),
                                          backgroundColor:
                                          controller.accdtlnvstgTabObstSelected[1] == true
                                              ? Color(0XFFE4E4E4)
                                              : Colors.white,
                                          side: BorderSide(
                                            color: borderLine,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Visibility(
                                  visible: controller.accdtlnvstgTabObstSelected[0] == true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // 소재지
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 10,
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
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '소재지',
                                                            style: TextStyle(
                                                              color:
                                                              Color(0xFF1D1D1D),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
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
                                            Expanded(
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
                                            Expanded(
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
                                      ),
                                      SizedBox(width: 20.w),
                                      // 취득용도
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 10,
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
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '취득용도',
                                                            style: TextStyle(
                                                              color:
                                                              Color(0xFF1D1D1D),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Expanded(
                                                            child: CustomTextFiled(
                                                              controller: controller
                                                                  .ownerLctnSearchController,
                                                              hintText: '',
                                                              onChanged: (value) {
                                                                //controller.searchBsnsName(value);
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.w),
                                                          Container(
                                                            width: 52.w,
                                                            height: 40.h,
                                                            decoration:
                                                            ShapeDecoration(
                                                              color:
                                                              Color(0xFFD2D6DF),
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.r),
                                                              ),
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
                                                                  '조회',
                                                                  style: TextStyle(
                                                                    color: Color(
                                                                        0xFF1D1D1D),
                                                                    fontSize: 16.sp,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: controller.accdtlnvstgTabObstSelected[0] == true,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20.h),
                                      SizedBox(
                                          height: Get.height * 0.15,
                                          child: BsnsSelectScreen().buildAccdtlnvstgOwnerDataGrid()
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        /// 지장물 검색
                        Visibility(
                          visible: controller.accdtlnvstgTabObstSelected[0] == true,
                          child: Expanded(
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(20.r),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
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
                                    Expanded(child:BsnsSelectScreen().buildAccdtlnvstgObstDataGrid())
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        /// 조사내용
                        Visibility(
                          visible: controller.accdtlnvstgTabObstSelected[1] == true,
                          child: Expanded(
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(20.r),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                                ),
                              ),
                              child: SizedBox(
                                width: Get.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('현실이용 현황 조사 내용', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                                        Container(
                                          width: 44.w,
                                          height: 32.h,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                side: BorderSide(color: borderLine)
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset('assets/images/ic_add.svg'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: tableColor1,
                                                  border: Border(
                                                    top: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('현실이용현황', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('용지지구 및 지역', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('면적(㎡)', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('전', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('답', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: tableColor1,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: borderLine,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                height: 40.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('소계', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('-', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40.h,
                                                        child: Center(child: Text('1,265', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w400))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Expanded(child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          // 입회자
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
                                                  child: Text('입회자', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                                      hintText: '입회자명',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor: tableColor1,
                                                      textColor: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20.h),
                                              Expanded(
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
                                                  height: 58.h,
                                                  child: Text('주소', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                                      hintText: '주소',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor: tableColor1,
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
                                                  height: 58.h,
                                                  child: Text('특이사항', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                                      hintText: '특이사항',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                      backgroundColor: tableColor1,
                                                      textColor: Colors.red,
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
                                                  height: 90.h,
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
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 10.h),
                                                      Text('사진촬영', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                                      SizedBox(height: 10.h),
                                                      Container(
                                                        width: 44.w,
                                                        height: 38.h,
                                                        margin: EdgeInsets.only(bottom: 10.h),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xFFFFFFFF),
                                                            borderRadius: BorderRadius.circular(6.r),
                                                            border: Border.all(color: borderLine)
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: SvgPicture.asset(
                                                            'assets/images/ic_camera.svg',
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
                                                  height: 90.h,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Image.asset('assets/images/sample.png'),
                                                        SizedBox(width: 10.w),
                                                        Text('...', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}