import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ldi/components/custom_button.dart';
import 'package:ldi/components/custom_textfield.dart';
import 'package:ldi/screens/bsns/select/bsns_select_screen.dart';
import 'package:ldi/utils/colors.dart';

import '../screens/bsns/bsns_controller.dart';

/// 고객카드 위젯

class CustomerCardWidget {
  static Widget buildCustomerCard(BsnsController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 24.h),
              padding: EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 사업구역명, 소유자명
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70.w,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '사업구역명',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomTextField(hintText: '내용',  onChanged: (value) {}),
                                    ),
                                    SizedBox(width: 6.w),
                                    Container(
                                      width: 52.w,
                                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFE5E8ED),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                      ),
                                      child: CustomButton(
                                        color: Color(0xFFE5E8ED),
                                        text: '조회',
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40.w),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '소유자명',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: CustomTextField(hintText: '내용',  onChanged: (value) {}),
                              ),
                              SizedBox(width: 6.w),
                              Container(
                                  width: 52.w,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFE5E8ED),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: CustomButton(
                                    color: Color(0xFFE5E8ED),
                                    text: '조회',
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // 등록번호
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70.w,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '등록번호',
                                        style: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(hintText: '내용',  onChanged: (value) {}),
                                      ),
                                      SizedBox(width: 6.w),
                                      Container(
                                          width: 52.w,
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFE5E8ED),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                          child: CustomButton(
                                            color: Color(0xFFE5E8ED),
                                            text: '조회',
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 40.w),
                        Expanded(child: Container())
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: Get.width,
              child: Text(
                '소유자 정보',
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: Get.width,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD8D8D8),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E8ED),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '성명',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1D1D1D),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.w),
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E8ED),

                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '연락처',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1D1D1D),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.w),
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E8ED),

                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '등기주소',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1D1D1D),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.w),
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E8ED),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '송달주소',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF1D1D1D),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD8D8D8),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '내용',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '내용',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '내용',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 40.h,
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                '내용',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32.h),
                            /*Row(
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
                            ),*/
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Expanded(child:
                               Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('토지내역', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 16.sp, fontWeight: FontWeight.w700)),
                                   SizedBox(height: 10.h),
                                   BsnsSelectScreen().buildOwnerLadInfoDataGrid(),
                                 ],
                               )),
                               SizedBox(width: 10.w),
                               Expanded(child:
                               Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   Text('지장물내역', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 16.sp, fontWeight: FontWeight.w700)),
                                   SizedBox(height: 10.h),
                                   BsnsSelectScreen().buildOwnerLadInfoDataGrid(),
                                 ],
                               )),
                              ],
                            )
                          ],
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
    );
  }
}
