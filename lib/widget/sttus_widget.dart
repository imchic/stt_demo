import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../screens/bsns/bsns_controller.dart';
import '../utils/colors.dart';
import '../utils/custom_button.dart';
import '../utils/custom_textfield.dart';

class SttusWidget {
  static buildSttusView(BsnsController controller) {
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
                  Expanded(
                    child:
                    Expanded(
                      child: TabBar(
                          controller: controller.sttusTabController,
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          isScrollable: true,
                          tabs: controller.sttusTabItems),
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
                  controller: controller.sttusTabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // 토지
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
                                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              ),
                            ),
                            child: SizedBox(
                              width: Get.width,
                              child: Row(
                                children: [
                                  // 소재지, 소유자명, 조사차수, 실태조사일, 수용재결일, 평가구분
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '읍면동',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '본번',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '부번',
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
                                      SizedBox(height: 10.h),
                                      /// 취득용도
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '취득용도',
                                                      style: TextStyle(
                                                        color: tableTextColor,
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w500,
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
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '가격시점',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Container(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: CustomTextField(
                                                        controller: controller.ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Text('~'),
                                                    SizedBox(width: 6.w),
                                                    Expanded(
                                                      flex: 4,
                                                      child: CustomTextField(
                                                        controller: controller.ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 지급요청일
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '지급요청일',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Container(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: CustomTextField(
                                                        controller: controller.ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Text('~'),
                                                    SizedBox(width: 6.w),
                                                    Expanded(
                                                      flex: 4,
                                                      child: CustomTextField(
                                                        controller: controller.ownerLctnSearchController,
                                                        hintText: '',
                                                        isDateTime: true,
                                                        onChanged: (value) {
                                                          //controller.searchBsnsName(value);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 취득용도
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '진행단계',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '평가차수',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
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
                                                      '소유자명',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: CustomTextField(
                                                controller: controller.ownerLctnSearchController,
                                                hintText: '읍면동',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 조사차수
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '조사차수',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '실태조사일',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                                flex: 6,
                                                child: Container(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 수용재결일
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '수용재결일',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                                flex: 6,
                                                child: Container(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 평가구분
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '평가구분',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                        height: 40.h,
                                        child: Container()
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              ),
                            ),
                            child: SizedBox(
                              width: Get.width,
                              child: Row(
                                children: [
                                  // 소재지, 소유자명, 조사차수, 실태조사일, 수용재결일, 평가구분
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '읍면동',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '본번',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '부번',
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
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '지장물구분',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '가격시점',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                                flex: 6,
                                                child: Container(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 지급요청일
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '지급요청일',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                                flex: 6,
                                                child: Container(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 취득용도
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '진행단계',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '소유자명',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: CustomTextField(
                                                controller: controller.ownerLctnSearchController,
                                                hintText: '읍면동',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 조사차수
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '조사차수',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
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
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '실태조사일',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                                flex: 6,
                                                child: Container(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 수용재결일
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '수용재결일',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                                flex: 6,
                                                child: Container(
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        Text('~'),
                                                        SizedBox(width: 6.w),
                                                        Expanded(
                                                          flex: 4,
                                                          child: CustomTextField(
                                                            controller: controller.ownerLctnSearchController,
                                                            hintText: '',
                                                            isDateTime: true,
                                                            onChanged: (value) {
                                                              //controller.searchBsnsName(value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      /// 평가차수
                                      SizedBox(
                                        height: 40.h,
                                        child:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
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
                                                      '평가차수',
                                                      style: TextStyle(
                                                        color: tableTextColor,
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
                                              flex: 6,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
                                                      hintText: '',
                                                      onChanged: (value) {
                                                        //controller.searchBsnsName(value);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  CustomButton(
                                                    color: Color(0xFFD2D6DF),
                                                    text: '조회',
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
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