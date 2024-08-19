import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                  TabBar(
                      controller: controller.sttusTabController,
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      isScrollable: true,
                      tabs: controller.sttusTabItems),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    color: Color(0XFFE5E8ED),
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
                          SizedBox(height: 24.h),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomRichText(length: 10),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(0);
                                              if(controller.isLadSttusInqireGridTab1.value == true) {
                                                controller.ladSttusInqireTabIsSelected[0] = false;
                                                controller.isLadSttusInqireGridTab1.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[0] = true;
                                                controller.isLadSttusInqireGridTab1.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('실태조사', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[0] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(1);
                                              if(controller.isLadSttusInqireGridTab2.value == true) {
                                                controller.ladSttusInqireTabIsSelected[1] = false;
                                                controller.isLadSttusInqireGridTab2.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[1] = true;
                                                controller.isLadSttusInqireGridTab2.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('소유자정보', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[1] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(2);
                                              if(controller.isLadSttusInqireGridTab3.value == true) {
                                                controller.ladSttusInqireTabIsSelected[2] = false;
                                                controller.isLadSttusInqireGridTab3.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[2] = true;
                                                controller.isLadSttusInqireGridTab3.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('감정평가', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[2] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(3);
                                              if(controller.isLadSttusInqireGridTab4.value == true) {
                                                controller.ladSttusInqireTabIsSelected[3] = false;
                                                controller.isLadSttusInqireGridTab4.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[3] = true;
                                                controller.isLadSttusInqireGridTab4.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('보상비산정', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[3] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(4);
                                              if(controller.isLadSttusInqireGridTab5.value == true) {
                                                controller.ladSttusInqireTabIsSelected[4] = false;
                                                controller.isLadSttusInqireGridTab5.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[4] = true;
                                                controller.isLadSttusInqireGridTab5.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('보상비지급', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[4] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(5);
                                              if(controller.isLadSttusInqireGridTab6.value == true) {
                                                controller.ladSttusInqireTabIsSelected[5] = false;
                                                controller.isLadSttusInqireGridTab6.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[5] = true;
                                                controller.isLadSttusInqireGridTab6.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('수용재결', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[5] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(6);
                                              if(controller.isLadSttusInqireGridTab7.value == true) {
                                                controller.ladSttusInqireTabIsSelected[6] = false;
                                                controller.isLadSttusInqireGridTab7.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[6] = true;
                                                controller.isLadSttusInqireGridTab7.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('이의재결', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[6] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Obx(() => BsnsSelectScreen().buildLadSttusInqireDataGrid(controller.ladSttusInqireColumns))
                              ],
                            ),
                          )
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
                                                    color: Color(0XFFE5E8ED),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                    color: Color(0XFFE5E8ED),
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
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    color: Color(0XFFE5E8ED),
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
                          SizedBox(height: 24.h),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomRichText(length: 10),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(0);
                                              if(controller.isLadSttusInqireGridTab1.value == true) {
                                                controller.ladSttusInqireTabIsSelected[0] = false;
                                                controller.isLadSttusInqireGridTab1.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[0] = true;
                                                controller.isLadSttusInqireGridTab1.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('실태조사', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[0] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(1);
                                              if(controller.isLadSttusInqireGridTab2.value == true) {
                                                controller.ladSttusInqireTabIsSelected[1] = false;
                                                controller.isLadSttusInqireGridTab2.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[1] = true;
                                                controller.isLadSttusInqireGridTab2.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('소유자정보', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[1] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(2);
                                              if(controller.isLadSttusInqireGridTab3.value == true) {
                                                controller.ladSttusInqireTabIsSelected[2] = false;
                                                controller.isLadSttusInqireGridTab3.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[2] = true;
                                                controller.isLadSttusInqireGridTab3.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('감정평가', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[2] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(3);
                                              if(controller.isLadSttusInqireGridTab4.value == true) {
                                                controller.ladSttusInqireTabIsSelected[3] = false;
                                                controller.isLadSttusInqireGridTab4.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[3] = true;
                                                controller.isLadSttusInqireGridTab4.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('보상비산정', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[3] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(4);
                                              if(controller.isLadSttusInqireGridTab5.value == true) {
                                                controller.ladSttusInqireTabIsSelected[4] = false;
                                                controller.isLadSttusInqireGridTab5.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[4] = true;
                                                controller.isLadSttusInqireGridTab5.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('보상비지급', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[4] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(5);
                                              if(controller.isLadSttusInqireGridTab6.value == true) {
                                                controller.ladSttusInqireTabIsSelected[5] = false;
                                                controller.isLadSttusInqireGridTab6.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[5] = true;
                                                controller.isLadSttusInqireGridTab6.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('수용재결', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[5] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          InkWell(
                                            onTap: () {
                                              controller.handleLadSttusInqireTabSelected(6);
                                              if(controller.isLadSttusInqireGridTab7.value == true) {
                                                controller.ladSttusInqireTabIsSelected[6] = false;
                                                controller.isLadSttusInqireGridTab7.value = false;
                                              } else {
                                                controller.ladSttusInqireTabIsSelected[6] = true;
                                                controller.isLadSttusInqireGridTab7.value = true;
                                              }
                                              controller.fetchLadSttusInqireDataSource();
                                            },
                                            child: Chip(label: Text('이의재결', style: TextStyle(color: Color(0XFF555555), fontSize: 15.sp, fontWeight: FontWeight.w500)),
                                              backgroundColor: controller.ladSttusInqireTabIsSelected[6] == true ? Color(0XFFE4E4E4) : Colors.white,
                                              side: BorderSide(color: borderLine, width: 1),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Obx(() => BsnsSelectScreen().buildLadSttusInqireDataGrid(controller.ladSttusInqireColumns))
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