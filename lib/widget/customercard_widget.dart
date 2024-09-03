import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_button.dart';
import 'package:ldi/components/custom_chip.dart';
import 'package:ldi/components/custom_tab.dart';
import 'package:ldi/components/custom_textfield.dart';
import 'package:ldi/screens/bsns/select/lp_screen.dart';
import 'package:ldi/utils/colors.dart';

import '../screens/bsns/lp_controller.dart';

/// 고객카드 위젯

class CustomerCardWidget {
  static Widget buildCustomerCard(LpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.all(40.r),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 24.h),
              padding: EdgeInsets.all(40.r),
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
                              SizedBox(
                                width: 140.w,
                                child: AutoSizeText(
                                  '사업구역명',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              CustomTextField(
                                  hintText: '내용', onChanged: (value) {}),
                              SizedBox(width: 6.w),
                              CustomButton(
                                color: Color(0xFFE5E8ED),
                                text: '조회',
                                textColor: Color(0xFF1D1D1D),
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
                              SizedBox(
                                width: 140.w,
                                child: AutoSizeText(
                                  '소유자명',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              CustomTextField(
                                  hintText: '내용', onChanged: (value) {}),
                              SizedBox(width: 6.w),
                              CustomButton(
                                color: Color(0xFFE5E8ED),
                                text: '조회',
                                textColor: Color(0xFF1D1D1D),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // 등록번호
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 140.w,
                              child: AutoSizeText(
                                '등록번호',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            CustomTextField(
                                hintText: '내용', onChanged: (value) {}),
                            SizedBox(width: 6.w),
                            CustomButton(
                              color: Color(0xFFE5E8ED),
                              text: '조회',
                              textColor: Color(0xFF1D1D1D),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40.w),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: Get.width,
              child: AutoSizeText(
                '소유자 정보',
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
                height: 350.h,
                child: lpScreen().buildOwnerListDataGrid()),
            SizedBox(height: 64.h),
            Row(
              children: [
                CustomChip(
                  title: '토지내역',
                  isSelected: controller.customerCardTabIsSelected[0],
                  onTap: () {
                    controller.handleCustomerCardTabSelected(0);
                  },
                ),
                SizedBox(width: 12.w),
                CustomChip(
                  title: '지장물내역',
                  isSelected: controller.customerCardTabIsSelected[1],
                  onTap: () {
                    controller.handleCustomerCardTabSelected(1);
                  },
                ),
              ],
            ),
            SizedBox(height: 48.h),
            Visibility(
              visible: controller.customerCardTabIsSelected[0],
              child: controller.ownerLadInfoDataSource.value.rows.length == 0
                  ? Container(
                      width: Get.width,
                      height: 200.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          '조회된 데이터가 없습니다.',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 350.h,
                      child: lpScreen().buildOwnerLadInfoDataGrid()),
            ),
            Visibility(
              visible: controller.customerCardTabIsSelected[1],
              child: controller.ownerObstInfoDataSource.value.rows.length == 0
                  ? Container(
                      width: Get.width,
                      height: 200.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: AutoSizeText(
                          '조회된 데이터가 없습니다.',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 350.h,
                      child: lpScreen().buildOwnerObstInfoDataGrid()),
            ),
            SizedBox(height: 44.h),
            Row(
              children: [
                CustomChip(
                  title: '관계인',
                  isSelected: controller.customerCardDetailTabIsSelected[0],
                  onTap: () {
                    controller.handleCustomerCardDetailTabSelected(0);
                  },
                ),
                SizedBox(width: 12.w),
                CustomChip(
                  title: '협의내역',
                  isSelected: controller.customerCardDetailTabIsSelected[1],
                  onTap: () {
                    controller.handleCustomerCardDetailTabSelected(1);
                  },
                ),
                SizedBox(width: 12.w),
                CustomChip(
                  title: '수용재결',
                  isSelected: controller.customerCardDetailTabIsSelected[2],
                  onTap: () {
                    controller.handleCustomerCardDetailTabSelected(2);
                  },
                ),
                SizedBox(width: 12.w),
                CustomChip(
                  title: '이의재결',
                  isSelected: controller.customerCardDetailTabIsSelected[3],
                  onTap: () {
                    controller.handleCustomerCardDetailTabSelected(3);
                  },
                ),
                SizedBox(width: 12.w),
                CustomChip(
                  title: '소송',
                  isSelected: controller.customerCardDetailTabIsSelected[4],
                  onTap: () {
                    controller.handleCustomerCardDetailTabSelected(4);
                  },
                ),
                SizedBox(width: 12.w),
                CustomChip(
                  title: '환매',
                  isSelected: controller.customerCardDetailTabIsSelected[5],
                  onTap: () {
                    controller.handleCustomerCardDetailTabSelected(5);
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
