import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_chip.dart';

import '../components/base_tabbar.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/bsns/bsns_controller.dart';
import '../screens/bsns/select/bsns_select_screen.dart';
import '../utils/colors.dart';
import '../components/custom_button.dart';

class SttusWidget {
  static buildSttusView(BsnsController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            BaseTabBar(
              controller: controller.sttusTabController,
              tabItems: controller.sttusTabItems,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              isScrollable: true,
              activeColor: Colors.black,
              unActiveTextColor: Color(0xFF555555),
              activeTextColor: Colors.black,
              //unActiveColor: Colors.transparent,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.sttusTabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // 토지
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.w, vertical: 20.h),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 24.h),
                            padding: EdgeInsets.all(40.r),
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
                              child: Row(
                                children: [
                                  // 소재지, 소유자명, 조사차수, 실태조사일, 수용재결일, 평가구분
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '소재지',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '읍면동',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '본번',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '부번',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 취득용도
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    //height: 24.h,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .min,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        AutoSizeText(
                                                          '취득용도',
                                                          style: TextStyle(
                                                            color: tableTextColor,
                                                            fontSize: 30.sp,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),

                                                /// 취득용도
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomButton(
                                                        color: Color(
                                                            0XFFE5E8ED),
                                                        text: '조회',
                                                        textColor: Color(
                                                            0xFF1D1D1D),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 가격시점
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '가격시점',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                    flex: 6,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .min,
                                                      children: [
                                                        CustomTextField(
                                                          controller: controller
                                                              .ownerLctnSearchController,
                                                          hintText: '',
                                                          isDateTime: true,
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        CustomTextField(
                                                          controller: controller
                                                              .ownerLctnSearchController,
                                                          hintText: '',
                                                          isDateTime: true,
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 지급요청일
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '지급요청일',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                    flex: 6,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .min,
                                                      children: [
                                                        CustomTextField(
                                                          controller: controller
                                                              .ownerLctnSearchController,
                                                          hintText: '',
                                                          isDateTime: true,
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        CustomTextField(
                                                          controller: controller
                                                              .ownerLctnSearchController,
                                                          hintText: '',
                                                          isDateTime: true,
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 취득용도
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '진행단계',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomButton(
                                                        color: Color(
                                                            0XFFE5E8ED),
                                                        text: '조회',
                                                        textColor: Color(
                                                            0xFF1D1D1D),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 평가차수
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    //height: 24.h,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize
                                                          .min,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '평가차수',
                                                          style: TextStyle(
                                                            color: tableTextColor,
                                                            fontSize: 30.sp,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomButton(
                                                        color: Color(
                                                            0XFFE5E8ED),
                                                        text: '조회',
                                                        textColor: Color(
                                                            0xFF1D1D1D),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                  SizedBox(width: 40.w),
                                  // 소유자명, 조사차수, 실태조사일, 수용재결일, 평가구분
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '소유자명',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '읍면동',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 조사차수
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '조사차수',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomButton(
                                                        color: Color(
                                                            0XFFE5E8ED),
                                                        text: '조회',
                                                        textColor: Color(
                                                            0xFF1D1D1D),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 실태조사일
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '실태조사일',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize
                                                              .min,
                                                          children: [
                                                            CustomTextField(
                                                              controller: controller
                                                                  .ownerLctnSearchController,
                                                              hintText: '',
                                                              isDateTime: true,
                                                              onChanged: (
                                                                  value) {
                                                                //controller.searchBsnsName(value);
                                                              },
                                                            ),
                                                            SizedBox(
                                                                width: 6.w),
                                                            Text('~'),
                                                            SizedBox(
                                                                width: 6.w),
                                                            CustomTextField(
                                                              controller: controller
                                                                  .ownerLctnSearchController,
                                                              hintText: '',
                                                              isDateTime: true,
                                                              onChanged: (
                                                                  value) {
                                                                //controller.searchBsnsName(value);
                                                              },
                                                            ),
                                                          ],
                                                        ))),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 수용재결일
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '수용재결일',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize
                                                              .min,
                                                          children: [
                                                            CustomTextField(
                                                              controller: controller
                                                                  .ownerLctnSearchController,
                                                              hintText: '',
                                                              isDateTime: true,
                                                              onChanged: (
                                                                  value) {
                                                                //controller.searchBsnsName(value);
                                                              },
                                                            ),
                                                            SizedBox(
                                                                width: 6.w),
                                                            Text('~'),
                                                            SizedBox(
                                                                width: 6.w),
                                                            CustomTextField(
                                                              controller: controller
                                                                  .ownerLctnSearchController,
                                                              hintText: '',
                                                              isDateTime: true,
                                                              onChanged: (
                                                                  value) {
                                                                //controller.searchBsnsName(value);
                                                              },
                                                            ),
                                                          ],
                                                        ))),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 평가구분
                                          SizedBox(
                                            height: 80.h,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '평가구분',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  flex: 6,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      CustomButton(
                                                        color: Color(
                                                            0XFFE5E8ED),
                                                        text: '조회',
                                                        textColor: Color(
                                                            0xFF1D1D1D),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),

                                          /// 평가구분
                                          SizedBox(
                                              height: 80.h, child: Container()),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      CustomRichText(length: controller
                                          .ladSttusInqireDataSource.value.rows.length),
                                      Row(
                                        children: [
                                          CustomChip(
                                            title: '실태조사',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[0],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  0);
                                              if (controller
                                                  .isSttusInqireGridTab1
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                0] = false;
                                                controller
                                                    .isSttusInqireGridTab1
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                0] = true;
                                                controller
                                                    .isSttusInqireGridTab1
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomChip(
                                            title: '소유자정보',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[1],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  1);
                                              if (controller
                                                  .isSttusInqireGridTab2
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                1] = false;
                                                controller
                                                    .isSttusInqireGridTab2
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                1] = true;
                                                controller
                                                    .isSttusInqireGridTab2
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomChip(
                                            title: '감정평가',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[2],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  2);
                                              if (controller
                                                  .isSttusInqireGridTab3
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                2] = false;
                                                controller
                                                    .isSttusInqireGridTab3
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                2] = true;
                                                controller
                                                    .isSttusInqireGridTab3
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomChip(
                                            title: '보상비산정',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[3],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  3);
                                              if (controller
                                                  .isSttusInqireGridTab4
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                3] = false;
                                                controller
                                                    .isSttusInqireGridTab4
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                3] = true;
                                                controller
                                                    .isSttusInqireGridTab4
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomChip(
                                            title: '보상비지급',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[4],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  4);
                                              if (controller
                                                  .isSttusInqireGridTab5
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                4] = false;
                                                controller
                                                    .isSttusInqireGridTab5
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                4] = true;
                                                controller
                                                    .isSttusInqireGridTab5
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomChip(
                                            title: '수용재결',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[5],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  5);
                                              if (controller
                                                  .isSttusInqireGridTab6
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                5] = false;
                                                controller
                                                    .isSttusInqireGridTab6
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                5] = true;
                                                controller
                                                    .isSttusInqireGridTab6
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomChip(
                                            title: '이의재결',
                                            isSelected: controller
                                                .sttusInqireTabIsSelected[6],
                                            onTap: () {
                                              controller
                                                  .handleSttusInqireTabSelected(
                                                  6);
                                              if (controller
                                                  .isSttusInqireGridTab7
                                                  .value ==
                                                  true) {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                6] = false;
                                                controller
                                                    .isSttusInqireGridTab7
                                                    .value = false;
                                              } else {
                                                controller
                                                    .sttusInqireTabIsSelected[
                                                6] = true;
                                                controller
                                                    .isSttusInqireGridTab7
                                                    .value = true;
                                              }
                                              controller
                                                  .fetchLadSttusInqireDataSource();
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Obx(() =>
                                    BsnsSelectScreen()
                                        .buildLadSttusInqireDataGrid(
                                        controller.ladSttusInqireColumns))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // 지장물현황
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                      width: Get.width,
                      margin: EdgeInsets.only(top: 24.h),
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
                        child: Row(
                          children: [
                            // 소재지, 소유자명, 조사차수, 실태조사일, 수용재결일, 평가구분
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
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
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '읍면동',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '본번',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '부번',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 취득용도
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '지장물구분',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),

                                          /// 취득용도
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomButton(
                                                  color: Color(0XFFE5E8ED),
                                                  text: '조회',
                                                  textColor: Color(0xFF1D1D1D),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 가격시점
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '가격시점',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize
                                                    .min,
                                                children: [
                                                  CustomTextField(
                                                    controller: controller
                                                        .ownerLctnSearchController,
                                                    hintText: '',
                                                    isDateTime: true,
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Text('~'),
                                                  SizedBox(width: 6.w),
                                                  CustomTextField(
                                                    controller: controller
                                                        .ownerLctnSearchController,
                                                    hintText: '',
                                                    isDateTime: true,
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 지급요청일
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '지급요청일',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize
                                                    .min,
                                                children: [
                                                  CustomTextField(
                                                    controller: controller
                                                        .ownerLctnSearchController,
                                                    hintText: '',
                                                    isDateTime: true,
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Text('~'),
                                                  SizedBox(width: 6.w),
                                                  CustomTextField(
                                                    controller: controller
                                                        .ownerLctnSearchController,
                                                    hintText: '',
                                                    isDateTime: true,
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 취득용도
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '진행단계',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomButton(
                                                  color: Color(0XFFE5E8ED),
                                                  text: '조회',
                                                  textColor: Color(0xFF1D1D1D),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 평가차수
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '평가차수',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomButton(
                                                  color: Color(0XFFE5E8ED),
                                                  text: '조회',
                                                  textColor: Color(0xFF1D1D1D),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(width: 40.w),
                            // 소유자명, 조사차수, 실태조사일, 수용재결일, 평가구분
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '소유자명',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          CustomTextField(
                                            controller: controller
                                                .ownerLctnSearchController,
                                            hintText: '읍면동',
                                            onChanged: (value) {
                                              //controller.searchBsnsName(value);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 조사차수
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '조사차수',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomButton(
                                                  color: Color(0XFFE5E8ED),
                                                  text: '조회',
                                                  textColor: Color(0xFF1D1D1D),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 실태조사일
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '실태조사일',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                              flex: 6,
                                              child: Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Text('~'),
                                                      SizedBox(width: 6.w),
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ],
                                                  ))),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 수용재결일
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '수용재결일',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                              flex: 6,
                                              child: Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                      SizedBox(width: 6.w),
                                                      Text('~'),
                                                      SizedBox(width: 6.w),
                                                      CustomTextField(
                                                        controller: controller
                                                            .ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ],
                                                  ))),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 평가구분
                                    SizedBox(
                                      height: 80.h,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              //height: 24.h,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '평가구분',
                                                    style: TextStyle(
                                                      color: tableTextColor,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  controller: controller
                                                      .ownerLctnSearchController,
                                                  hintText: '',
                                                  onChanged: (value) {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                                SizedBox(width: 6.w),
                                                CustomButton(
                                                  color: Color(0XFFE5E8ED),
                                                  text: '조회',
                                                  textColor: Color(0xFF1D1D1D),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    /// 평가구분
                                    SizedBox(height: 80.h, child: Container()),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomRichText(length: controller.obstSttusInqireDataSource.value.rows.length),
                                  Row(
                                    children: [
                                      CustomChip(
                                        title: '실태조사',
                                        isSelected: controller.sttusInqireTabIsSelected[0],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              0);
                                          if (controller
                                              .isSttusInqireGridTab1
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            0] = false;
                                            controller.isSttusInqireGridTab1
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            0] = true;
                                            controller.isSttusInqireGridTab1
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomChip(
                                        title: '소유자정보',
                                        isSelected: controller.sttusInqireTabIsSelected[1],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              1);
                                          if (controller
                                              .isSttusInqireGridTab2
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            1] = false;
                                            controller.isSttusInqireGridTab2
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            1] = true;
                                            controller.isSttusInqireGridTab2
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomChip(
                                        title: '감정평가',
                                        isSelected: controller.sttusInqireTabIsSelected[2],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              2);
                                          if (controller
                                              .isSttusInqireGridTab3
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            2] = false;
                                            controller.isSttusInqireGridTab3
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            2] = true;
                                            controller.isSttusInqireGridTab3
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomChip(
                                        title: '보상비산정',
                                        isSelected: controller.sttusInqireTabIsSelected[3],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              3);
                                          if (controller
                                              .isSttusInqireGridTab4
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            3] = false;
                                            controller.isSttusInqireGridTab4
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            3] = true;
                                            controller.isSttusInqireGridTab4
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomChip(
                                        title: '보상비지급',
                                        isSelected: controller.sttusInqireTabIsSelected[4],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              4);
                                          if (controller
                                              .isSttusInqireGridTab5
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            4] = false;
                                            controller.isSttusInqireGridTab5
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            4] = true;
                                            controller.isSttusInqireGridTab5
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomChip(
                                        title: '수용재결',
                                        isSelected: controller.sttusInqireTabIsSelected[5],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              5);
                                          if (controller
                                              .isSttusInqireGridTab6
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            5] = false;
                                            controller.isSttusInqireGridTab6
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            5] = true;
                                            controller.isSttusInqireGridTab6
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                      SizedBox(width: 10.w),
                                      CustomChip(
                                        title: '이의재결',
                                        isSelected: controller.sttusInqireTabIsSelected[6],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(
                                              6);
                                          if (controller
                                              .isSttusInqireGridTab7
                                              .value ==
                                              true) {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            6] = false;
                                            controller.isSttusInqireGridTab7
                                                .value = false;
                                          } else {
                                            controller
                                                .sttusInqireTabIsSelected[
                                            6] = true;
                                            controller.isSttusInqireGridTab7
                                                .value = true;
                                          }
                                          controller
                                              .fetchObstSttusInqireDataSource();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            // Obx(() => BsnsSelectScreen()
                            //     .buildObstSttusInqireDataGrid(
                            //         controller.obstSttusInqireColumns))
                            Obx(() => controller.obstSttusInqireDataSource.value.rows.length == 0
                                ? Center(
                                  child: Container(
                                      height: double.infinity,
                                      child: AutoSizeText('데이터가 없습니다.',
                                          style: TextStyle(
                                              color: Color(0xFF555555),
                                              fontSize: 32.sp,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                )
                                : BsnsSelectScreen()
                                    .buildObstSttusInqireDataGrid(
                                        controller.obstSttusInqireColumns))
                          ],
                        ),
                      )
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
}
