import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stt_demo/screens/bsns/bsns_controller.dart';
import 'package:stt_demo/screens/bsns/select/bsns_select_screen.dart';

import '../utils/colors.dart';
import '../utils/custom_textfiled.dart';
import '../utils/dialog_util.dart';

class BsnsWidget {
  static buildBsnsListItem(BsnsController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                //buildBsnsRadio(),
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
                          DialogUtil.showAlertDialog(
                              context,
                              '사업구역 선택',
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${controller.searchBsnsList[index].title}',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                              ), () {
                            controller.selectedBsns.value =
                                controller.searchBsnsList[index];
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
                                    side:
                                        BorderSide(width: 0, color: borderLine),
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 34.h,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color:
                                                              Color(0xFFEFF5FF),
                                                          shape: RoundedRectangleBorder(
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
                                                              textAlign:
                                                                  TextAlign
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color:
                                                              Color(0xFFFFF1E3),
                                                          shape: RoundedRectangleBorder(
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
                                                              textAlign:
                                                                  TextAlign
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                            color: Color(
                                                                0xFF1D1D1D),
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
                                                                  FontWeight
                                                                      .w400,
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
                                                                  FontWeight
                                                                      .w400,
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
                                                                  FontWeight
                                                                      .w400,
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
                                                                  FontWeight
                                                                      .w400,
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

                                        controller.searchBsnsList[index]
                                                .isExpand =
                                            !controller.searchBsnsList[index]
                                                .isExpand!;

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
                                          //buildTable(),
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
      ),
    );
  }

  static Widget buildBsnsListView(BsnsController controller) {
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
                  Expanded(
                    child: TabBar(
                      controller: controller.bsnsTabController,
                      tabs: controller.bsnsSelectTabItems,
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      isScrollable: true,
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
                buildBsnsListItem(controller),

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
                            child: BsnsSelectScreen()
                                .buildBsnsSelectAreaListDataGrid())
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
                                            subtitle:
                                                Text('2024.01.01 ~ 2024.06.30'),
                                            content: Text('1차'),
                                          ),
                                          Step(
                                            isActive: false,
                                            state: StepState.disabled,
                                            title: Text('2차'),
                                            subtitle:
                                                Text('2024.07.01 ~ 2024.12.31'),
                                            content: Text(''),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.getSelectOrder();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:
                                                  const Color(0xff2d2d2d),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                            ),
                                            child: Text('차수등록',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
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
}
