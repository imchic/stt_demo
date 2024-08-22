import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/base_tabbar.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/bsns/bsns_controller.dart';
import '../screens/bsns/select/bsns_select_screen.dart';
import '../utils/colors.dart';

/// 소유자 위젯
class OwnerWidget {
  static buildOwnerView(BsnsController controller) {
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
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    isScrollable: true,
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
  static buildOwnerSearchContainer(BsnsController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(40.r),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0, color: borderLine),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Column(children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('소재지'),
                  SizedBox(width: 24.w),
                  CustomTextField(hintText: '읍면동', onChanged: (value) {}),
                  SizedBox(width: 12.w),
                  CustomTextField(hintText: '본번', onChanged: (value) {}),
                  SizedBox(width: 12.w),
                  CustomTextField(hintText: '부번', onChanged: (value) {}),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  BsnsSelectScreen().buildOwnerMngRadio(),
                  SizedBox(width: 32.w),
                  CustomTextField(hintText: '소유자명을 입력해주세요', onChanged: (value) {}),
                  SizedBox(width: 12.w),
                  CustomTextField(hintText: '등록번호', onChanged: (value) {}),
                ],
              )
            ]),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 48.h),
                // color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(length: 3),
                    SizedBox(height: 20.h),
                    Expanded(
                        child: BsnsSelectScreen().buildBsnsOwnerDataGrid()),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  /// 소유자관리 -> 토지정보
  static buildOwnerLandInfoContainer(BsnsController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(length: 3),
          SizedBox(height: 20.h),
          Expanded(child: BsnsSelectScreen().buildOwnerLadInfoDataGrid()),
        ],
      ),
    );
  }

  /// 소유자관리 -> 지장물정보
  static buildOwnerObstInfoContainer(BsnsController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(length: 3),
          SizedBox(height: 20.h),
          Expanded(child: BsnsSelectScreen().buildOwnerObstInfoDataGrid()),
        ],
      ),
    );
  }

  /// 소유자관리 -> 정보변경
  static buildOwnerInfoChangeContainer(BsnsController controller) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(40.r),
      child: Column(
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
                            child: AutoSizeText('홍길동',
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
                            child: AutoSizeText('내용',
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
                            child: AutoSizeText('123456-1******',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                  ],
                ),
              ),
              // 전화번호, 휴대폰번호
              Container(
                width: double.infinity,
                height: 104.h,
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
                        alignment: Alignment.center,
                        child: AutoSizeText('전화번호',
                            style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 104.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        //child: AutoSizeAutoSizeText('02-1234-5678', style: TextStyle(color: tableTextColor, fontSize: 32.sp, fontWeight: FontWeight.w400)),
                        child: Center(
                            child: CustomTextField(
                                hintText: '전화번호', onChanged: (value) {})),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 104.h,
                        alignment: Alignment.center,
                        child: AutoSizeText('휴대폰번호',
                            style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 104.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                            child: CustomTextField(
                                hintText: '전화번호', onChanged: (value) {})),
                        //child: AutoSizeAutoSizeText('010-1234-5678', style: TextStyle(color: tableTextColor, fontSize: 32.sp, fontWeight: FontWeight.w400)),
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
                        decoration: BoxDecoration(
                          color: tableColor1,
                        ),
                        height: 200.h,
                        alignment: Alignment.center,
                        child: AutoSizeText('특이사항',
                            style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            height: 200.h,
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: CustomTextField(
                                hintText: '내용을 입력하세요', onChanged: (value) {}),
                          ),
                        ],
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
      ),
    );
  }
}
