import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_richtext.dart';
import 'package:ldi/utils/dialog_util.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            BaseTabBar(
              controller: controller.accdtlnvstgTabController,
              tabItems: controller.accdtlnvstgTabItems,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              isScrollable: true,
              activeColor: Colors.black,
              unActiveTextColor: Color(0xFF555555),
              activeTextColor: Colors.black,
            ),
            Container(
              width: double.infinity,
              height: 72.h,
              //padding: EdgeInsets.all(40.r),
              margin: EdgeInsets.only(top: 40.h, bottom: 0.h, left: 40.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomChip(
                      title: '토지검색',
                      isSelected:
                          controller.accdtlnvstgTabLadSelected[0] == true,
                      onTap: () {
                        controller.handleAccdtlnvstgLadTabSelected(0);
                      }),
                  SizedBox(width: 12.w),
                  CustomChip(
                      title: '소유자/관계인',
                      isSelected:
                          controller.accdtlnvstgTabLadSelected[1] == true,
                      onTap: () {
                        controller.handleAccdtlnvstgLadTabSelected(1);
                      }),
                  SizedBox(width: 12.w),
                  CustomChip(
                      title: '조사내용',
                      isSelected:
                          controller.accdtlnvstgTabLadSelected[2] == true,
                      onTap: () {
                        controller.handleAccdtlnvstgLadTabSelected(2);
                      }),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: controller.accdtlnvstgTabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(40.r),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible:
                              controller.accdtlnvstgTabLadSelected[0] == true,
                          child: Container(
                              width: Get.width,
                              //height: 256.h,
                              padding: EdgeInsets.all(40.r),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0, color: borderLine),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                ),
                              ),
                              child: SizedBox(
                                  width: Get.width,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // 토지검색 탭
                                        Visibility(
                                          visible: controller
                                                      .accdtlnvstgTabLadSelected[
                                                  0] ==
                                              true,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 140.w,
                                                          child: Text('소재지',
                                                              style: TextStyle(
                                                                color:
                                                                    tableTextColor,
                                                                fontSize:
                                                                    1.w > 1.h
                                                                        ? 32.sp
                                                                        : 52.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 5,
                                                        child: CustomTextField(
                                                          controller: controller
                                                              .ownerLctnSearchController,
                                                          hintText:
                                                              '소재지를 입력해주세요',
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Flexible(
                                                        flex: 2,
                                                        child: CustomTextField(
                                                          controller: controller
                                                              .ownerMlnoLtnoSearchController,
                                                          hintText: '본번',
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Flexible(
                                                        flex: 2,
                                                        child: CustomTextField(
                                                          controller: controller
                                                              .ownerSlnoLtnoSearchController,
                                                          hintText: '부번',
                                                          onChanged: (value) {
                                                            //controller.searchBsnsName(value);
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                              SizedBox(width: 20.w),
                                              Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('취득용도',
                                                          style: TextStyle(
                                                            color:
                                                                tableTextColor,
                                                            fontSize: 1.w > 1.h
                                                                ? 32.sp
                                                                : 52.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      SizedBox(width: 20.w),
                                                      Expanded(
                                                        flex: 6,
                                                        child: CustomTextField(
                                                          controller: controller
                                                              .accdtlnvstgAcqstnPrpsController,
                                                          hintText:
                                                              '취득용도를 입력해주세요',
                                                          onChanged: (value) {
                                                            debugPrint(value);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 100.w,
                                                          height: 1.w > 1.h
                                                              ? 72.h
                                                              : 52.h,
                                                          child: CustomButton(
                                                            color: Color(
                                                                0xFFE5E8ED),
                                                            text: '조회',
                                                            textColor: Color(
                                                                0xFF555555),
                                                            onPressed: () {
                                                              DialogUtil.showBottomSheet(
                                                                  Get.context!,
                                                                  '취득용도를 선택해주세요',
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .all(20
                                                                            .r),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              ListView.builder(
                                                                            shrinkWrap:
                                                                                true,
                                                                            physics:
                                                                                NeverScrollableScrollPhysics(),
                                                                            itemCount:
                                                                                controller.accdtlnvstgAcqstnPrpsList.length,
                                                                            itemBuilder:
                                                                                (context, index) {
                                                                              return ListTile(
                                                                                title: Text(controller.accdtlnvstgAcqstnPrpsList[index],
                                                                                    style: TextStyle(
                                                                                      color: tableTextColor,
                                                                                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    )),
                                                                                onTap: () {
                                                                                  controller.accdtlnvstgAcqstnPrpsController.text = controller.accdtlnvstgAcqstnPrpsList[index];
                                                                                  Get.back();
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ));
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ]))),
                        ),
                        SizedBox(height: 20.h),
                        Visibility(
                            visible:
                                controller.accdtlnvstgTabLadSelected[0] == true,
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRichText(length: 3),
                                  SizedBox(height: 20.h),
                                  BsnsSelectScreen().buildAccdtlnvstgDataGrid(),
                                ],
                              ),
                            )),
                        // 소유자 / 관계인
                        Visibility(
                            visible:
                                controller.accdtlnvstgTabLadSelected[1] == true,
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('토지 정보',
                                      style: TextStyle(
                                        color: tableTextColor,
                                        fontSize: 1.w > 1.h ? 36.sp : 56.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(height: 20.h),
                                  Container(
                                    height: 300.h,
                                    child: BsnsSelectScreen().buildAccdtlnvstgDataGrid(),
                                  ),
                                  SizedBox(height: 40.h),
                                  Text('소유자 현황',
                                      style: TextStyle(
                                        color: tableTextColor,
                                        fontSize: 1.w > 1.h ? 36.sp : 56.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(height: 20.h),
                                  Container(
                                    height: 300.h,
                                    child: BsnsSelectScreen()
                                        .buildOwnerLadInfoDataGrid(),
                                  ),
                                  SizedBox(height: 40.h),
                                  Text('소유자별 관계인 현황',
                                      style: TextStyle(
                                        color: tableTextColor,
                                        fontSize: 1.w > 1.h ? 36.sp : 56.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(height: 20.h),
                                  Container(
                                    height: 300.h,
                                    child: BsnsSelectScreen()
                                        .buildOwnerLadInfoDataGrid(),
                                  ),
                                ],
                              ),
                            )),
                        // 조사내용
                        Visibility(
                            visible:
                                controller.accdtlnvstgTabLadSelected[2] == true,
                            child:
                                BsnsSelectScreen().buildOwnerLadInfoDataGrid()),
                      ],
                    ),
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
