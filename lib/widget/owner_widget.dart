import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/bsns/bsns_controller.dart';
import '../screens/bsns/select/bsns_select_screen.dart';
import '../utils/colors.dart';
import '../utils/custom_textfield.dart';

/// 소유자 위젯
class OwnerWidget {
  static buildOwnerView(BsnsController controller) {
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
                          controller: controller.bsnsOwnerTabController,
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          isScrollable: true,
                          tabs: controller.bsnsOwnerTabItems),
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
                  controller: controller.bsnsOwnerTabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
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
                            child: Column(
                              children: [
                                Row(
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
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: CustomTextField(
                                                      controller: controller.ownerLctnSearchController,
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
                                    Flexible(
                                      child: SizedBox(
                                        height: 40.h,
                                        child: CustomTextField(
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
                                    Flexible(
                                      child: SizedBox(
                                        height: 40.h,
                                        child: CustomTextField(
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
                                SizedBox(height: 10.h),
                                BsnsSelectScreen().buildOwnerMngRadio()
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: Get.width,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '전체',
                                        style: TextStyle(
                                          color: tableTextColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        ' ${controller.bsnsOwnerDataSource.value.rows.length}',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '건',
                                        style: TextStyle(
                                          color: tableTextColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                SizedBox(
                                    height: Get.height * 0.45,
                                    child: BsnsSelectScreen().buildBsnsOwnerDataGrid())
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /// [소유자관리 -> 토지정보]
                    Container(
                        width: Get.width,
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '전체',
                                    style: TextStyle(
                                      color: tableTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${controller.ownerLadInfoDataSource.value.rows.length}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '건',
                                    style: TextStyle(
                                      color: tableTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Expanded(child: BsnsSelectScreen().buildOwnerLadInfoDataGrid()),
                          ],
                        )),
                    /// [소유자관리 -> 지장물정보]
                    Container(
                        width: Get.width,
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '전체',
                                    style: TextStyle(
                                      color: tableTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${controller.ownerObstInfoDataSource.value.rows.length}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '건',
                                    style: TextStyle(
                                      color: tableTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Expanded(child: BsnsSelectScreen().buildOwnerObstInfoDataGrid()),
                          ],
                        )),
                    /// [소유자관리 -> 정보변경]
                    SingleChildScrollView(child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(20.r),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0, color: borderLine),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              // 소유자명, 소유자구분
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
                                      child: Text('소유자명', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                        child: CustomTextField(
                                          isReadOnly: true,
                                          hintText: '홍길동',
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
                                      child: Text('소유자구분', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                        child: CustomTextField(
                                          isReadOnly: true,
                                          hintText: '사유',
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
                              // 등록번호
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
                                      child: Text('등록번호', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
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
                                        child: CustomTextField(
                                          isReadOnly: true,
                                          hintText: '70092-1****',
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
                              // 전화번호, 휴대폰번호
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
                                      child: Text('전화번호', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Expanded(
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
                                        child: CustomTextField(
                                          hintText: '전화번호',
                                          onChanged: (value) {
                                            //controller.searchBsnsName(value);
                                          },
                                          backgroundColor: tableColor1,
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
                                      child: Text('휴대폰번호', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Expanded(
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
                                        child: CustomTextField(
                                          isReadOnly: true,
                                          hintText: '휴대폰번호',
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
                                      height: 200.h,
                                      child: Text('특이사항', style: TextStyle(color: tableTextColor, fontSize: 15.sp, fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Container(
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
                                          height: 200.h,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 44.w,
                                                      height: 40.h,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFFFFFF),
                                                          borderRadius: BorderRadius.circular(6.r),
                                                          border: Border.all(color: borderLine)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/ic_microphone.svg',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Container(
                                                      width: 44.w,
                                                      height: 40.h,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFFFFFFF),
                                                          borderRadius: BorderRadius.circular(6.r),
                                                          border: Border.all(color: borderLine)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/ic_pen.svg',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Expanded(
                                                  child: CustomTextField(
                                                    hintText: '내용을 입력하세요',
                                                    onChanged: (value) {
                                                      //controller.searchBsnsName(value);
                                                    },
                                                    backgroundColor: tableColor1,
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
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 60.w,
                            height: 40.h,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: ShapeDecoration(
                              color: Color(0xFF246AEA),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '저장',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
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