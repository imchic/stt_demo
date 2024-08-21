import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_richtext.dart';

import '../components/base_tabbar.dart';
import '../components/custom_button.dart';
import '../components/custom_chip.dart';
import '../components/custom_textfield.dart';
import '../screens/bsns/bsns_controller.dart';
import '../screens/bsns/select/bsns_select_screen.dart';
import '../utils/colors.dart';

/// 실태조사 위젯
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
            BaseTabBar(
              controller: controller.accdtlnvstgTabController,
              tabItems: controller.accdtlnvstgTabItems,
            ),
            Expanded(
                child: TabBarView(
              controller: controller.accdtlnvstgTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  // color: Colors.blue,
                  margin: EdgeInsets.all(48.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 72.h,
                        // color: Colors.green,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomChip(title: '토지검색', isSelected: controller.accdtlnvstgTabLadSelected[0] == true, onTap: () {
                              controller.handleAccdtlnvstgLadTabSelected(0);
                            }),
                            SizedBox(width: 12.w),
                            CustomChip(title: '소유자/관계인', isSelected: controller.accdtlnvstgTabLadSelected[1] == true, onTap: () {
                              controller.handleAccdtlnvstgLadTabSelected(1);
                            }),
                            SizedBox(width: 12.w),
                            CustomChip(title: '조사내용', isSelected: controller.accdtlnvstgTabLadSelected[2] == true, onTap: () {
                              controller.handleAccdtlnvstgLadTabSelected(2);
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 48.h),
                      Visibility(
                        visible: controller.accdtlnvstgTabLadSelected[0] == true,
                        child: Container(
                          width: Get.width,
                          height: 256.h,
                          padding: EdgeInsets.all(40.r),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 토지검색 탭
                                Visibility(
                                  visible: controller.accdtlnvstgTabLadSelected[0] == true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // 소재지
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 15,
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min, mainAxisAlignment:
                                                  MainAxisAlignment.start, crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 120.w,
                                                      height: 48.h,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('소재지', style: TextStyle(color: tableTextColor,
                                                            fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                                            fontWeight: FontWeight.w500,)),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 24.w),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                            Expanded(
                                              flex: 5,
                                              child: CustomTextField(
                                                controller: controller.ownerMlnoLtnoSearchController,
                                                hintText: '본번',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 4.w),
                                            // 부번
                                            Expanded(
                                              flex: 5,
                                              child: CustomTextField(
                                                controller: controller.ownerSlnoLtnoSearchController,
                                                hintText: '부번',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 80.w),
                                      // 취득용도
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: 120.w,
                                                height: 48.h,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('취득용도', style: TextStyle(color: tableTextColor,
                                                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                                      fontWeight: FontWeight.w500,)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 24.w),
                                            Expanded(
                                              flex: 6,
                                              child: CustomTextField(
                                                controller: controller.ownerLctnSearchController,
                                                hintText: '취득용도를 입력해주세요',
                                                onChanged: (value) {
                                                  //controller.searchBsnsName(value);
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            Expanded(
                                              child: SizedBox(
                                                width: 100.w,
                                                height: 72.h,
                                                child: CustomButton(
                                                  color: Color(0xFFE5E8ED),
                                                  text: '조회',
                                                  textColor: Color(0xFF555555),
                                                  onPressed: () {
                                                    //controller.searchBsnsName(value);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // // 소유자/관계인 탭
                                // Visibility(
                                //   visible: controller.accdtlnvstgTabLadSelected[1] == true,
                                //   child: SizedBox(
                                //       height: Get.height * 0.15,
                                //       child: BsnsSelectScreen().buildAccdtlnvstgOwnerDataGrid()
                                //   ),
                                // ),
                                // // 조사내용 탭
                                // Visibility(
                                //   visible: controller.accdtlnvstgTabLadSelected[2] == true,
                                //   child: SizedBox(
                                //       height: Get.height * 0.15,
                                //       child: BsnsSelectScreen().buildAccdtlnvstgOwnerDataGrid()
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 48.h),
                      CustomRichText(length: 3),
                      SizedBox(height: 20.h),
                      Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[0] == true,
                          child: BsnsSelectScreen().buildOwnerLadInfoDataGrid()
                      ),
                      Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[1] == true,
                          child: BsnsSelectScreen().buildOwnerLadInfoDataGrid()
                      ),
                      Visibility(
                          visible: controller.accdtlnvstgTabLadSelected[2] == true,
                          child: BsnsSelectScreen().buildOwnerLadInfoDataGrid()
                      ),
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
