import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_chip.dart';
import 'package:ldi/components/custom_sliver_persistent_headerdelegate.dart';

import '../components/base_tabbar.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/bsns/lp_controller.dart';
import '../screens/bsns/select/lp_screen.dart';
import '../utils/colors.dart';
import '../components/custom_button.dart';

class SttusWidget {
  static buildSttusView(LpController controller) {
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    slivers: [
                      SliverPersistentHeader(
                          pinned: false,
                          floating: true,
                          delegate: CustomSliverPersistentHeaderDelegate(
                            maxHeight: 750.h,
                            minHeight: 750.h,
                            child: buildLadSttusSearchContainer(controller),
                          )),
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomRichText(
                                      length: controller
                                          .ladSttusInqireDataSource
                                          .value
                                          .rows
                                          .length),
                                  Row(
                                    children: [
                                      CustomChip(
                                        title: '실태조사',
                                        isSelected: controller
                                            .sttusInqireTabIsSelected[0],
                                        onTap: () {
                                          controller
                                              .handleSttusInqireTabSelected(0);
                                          if (controller
                                                  .isLadSttusInqireGridTab1
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                0] = false;
                                            controller.isLadSttusInqireGridTab1
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                0] = true;
                                            controller.isLadSttusInqireGridTab1
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
                                              .handleSttusInqireTabSelected(1);
                                          if (controller
                                                  .isLadSttusInqireGridTab2
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                1] = false;
                                            controller.isLadSttusInqireGridTab2
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                1] = true;
                                            controller.isLadSttusInqireGridTab2
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
                                              .handleSttusInqireTabSelected(2);
                                          if (controller
                                                  .isLadSttusInqireGridTab3
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                2] = false;
                                            controller.isLadSttusInqireGridTab3
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                2] = true;
                                            controller.isLadSttusInqireGridTab3
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
                                              .handleSttusInqireTabSelected(3);
                                          if (controller
                                                  .isLadSttusInqireGridTab4
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                3] = false;
                                            controller.isLadSttusInqireGridTab4
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                3] = true;
                                            controller.isLadSttusInqireGridTab4
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
                                              .handleSttusInqireTabSelected(4);
                                          if (controller
                                                  .isLadSttusInqireGridTab5
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                4] = false;
                                            controller.isLadSttusInqireGridTab5
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                4] = true;
                                            controller.isLadSttusInqireGridTab5
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
                                              .handleSttusInqireTabSelected(5);
                                          if (controller
                                                  .isLadSttusInqireGridTab6
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                5] = false;
                                            controller.isLadSttusInqireGridTab6
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                5] = true;
                                            controller.isLadSttusInqireGridTab6
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
                                              .handleSttusInqireTabSelected(6);
                                          if (controller
                                                  .isLadSttusInqireGridTab7
                                                  .value ==
                                              true) {
                                            controller.sttusInqireTabIsSelected[
                                                6] = false;
                                            controller.isLadSttusInqireGridTab7
                                                .value = false;
                                          } else {
                                            controller.sttusInqireTabIsSelected[
                                                6] = true;
                                            controller.isLadSttusInqireGridTab7
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
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        fillOverscroll: true,
                        child: controller
                                .ladSttusInqireDataSource.value.rows.isEmpty
                            ? Container(
                                width: double.infinity,
                                child: Center(
                                  child: AutoSizeText('데이터가 없습니다.',
                                      style: TextStyle(
                                          color: Color(0xFF555555),
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w400)),
                                ),
                              )
                            : Obx(() => lpScreen().buildLadSttusInqireDataGrid(
                                controller.ladSttusInqireColumns)),
                      ),
                    ],
                  ),
                ),
                // 지장물
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      slivers: [
                        SliverPersistentHeader(
                            pinned: false,
                            floating: true,
                            delegate: CustomSliverPersistentHeaderDelegate(
                              maxHeight: 700.h,
                              minHeight: 700.h,
                              child: buildObstSttusSearchContainer(controller),
                            )),
                        SliverToBoxAdapter(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomRichText(
                                        length: controller
                                            .obstSttusInqireDataSource
                                            .value
                                            .rows
                                            .length),
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
                                                    .isLadSttusInqireGridTab1
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  0] = false;
                                              controller
                                                  .isLadSttusInqireGridTab1
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  0] = true;
                                              controller
                                                  .isLadSttusInqireGridTab1
                                                  .value = true;
                                            }
                                            controller
                                                .fetchObstSttusInqireDataSource();
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
                                                    .isLadSttusInqireGridTab2
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  1] = false;
                                              controller
                                                  .isLadSttusInqireGridTab2
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  1] = true;
                                              controller
                                                  .isLadSttusInqireGridTab2
                                                  .value = true;
                                            }
                                            controller
                                                .fetchObstSttusInqireDataSource();
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
                                                    .isLadSttusInqireGridTab3
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  2] = false;
                                              controller
                                                  .isLadSttusInqireGridTab3
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  2] = true;
                                              controller
                                                  .isLadSttusInqireGridTab3
                                                  .value = true;
                                            }
                                            controller
                                                .fetchObstSttusInqireDataSource();
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
                                                    .isLadSttusInqireGridTab4
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  3] = false;
                                              controller
                                                  .isLadSttusInqireGridTab4
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  3] = true;
                                              controller
                                                  .isLadSttusInqireGridTab4
                                                  .value = true;
                                            }
                                            controller
                                                .fetchObstSttusInqireDataSource();
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
                                                    .isLadSttusInqireGridTab5
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  4] = false;
                                              controller
                                                  .isLadSttusInqireGridTab5
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  4] = true;
                                              controller
                                                  .isLadSttusInqireGridTab5
                                                  .value = true;
                                            }
                                            controller
                                                .fetchObstSttusInqireDataSource();
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
                                                    .isLadSttusInqireGridTab6
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  5] = false;
                                              controller
                                                  .isLadSttusInqireGridTab6
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  5] = true;
                                              controller
                                                  .isLadSttusInqireGridTab6
                                                  .value = true;
                                            }
                                            controller
                                                .fetchObstSttusInqireDataSource();
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
                                                    .isLadSttusInqireGridTab7
                                                    .value ==
                                                true) {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  6] = false;
                                              controller
                                                  .isLadSttusInqireGridTab7
                                                  .value = false;
                                            } else {
                                              controller
                                                      .sttusInqireTabIsSelected[
                                                  6] = true;
                                              controller
                                                  .isLadSttusInqireGridTab7
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
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                        SliverFillRemaining(
                          fillOverscroll: true,
                          child: controller
                                  .obstSttusInqireDataSource.value.rows.isEmpty
                              ? SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: AutoSizeText('데이터가 없습니다.',
                                        style: TextStyle(
                                            color: Color(0xFF555555),
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                )
                              : Obx(() => lpScreen()
                                  .buildObstSttusInqireDataGrid(
                                      controller.obstSttusInqireColumns)),
                        ),
                      ]),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  static buildLadSttusSearchContainer(LpController controller) {
    return Column(
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
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
          child: Column(
            children: [
              // 소재지, 소유자명
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '소재지',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '읍면동을 입력해주세요.',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 144.w,
                            child: CustomTextField(hintText: '본번', onChanged: (value) {  },),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 144.w,
                            child: CustomTextField(hintText: '부번', onChanged: (value) {  },),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '소유자명',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '소유자명을 입력해주세요.',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // 취득용도, 조사차수
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '취득용도',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '취득용도',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '조사차수',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '조사차수',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // 가격시점, 실태조사일
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '가격시점',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            isDateTime: true,
                            hintText: '',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '실태조사일',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            isDateTime: true,
                            hintText: '',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 지급요청일, 수용재결일
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '지급요청일',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            isDateTime: true,
                            hintText: '',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '수용재결일',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            isDateTime: true,
                            hintText: '',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 진행단계, 평가구분
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '진행단계',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '진행단계',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '평가구분',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '평가구분',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // 평가차수
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '평가차수',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                            controller: controller.ownerLctnSearchController,
                            hintText: '평가차수',
                            onChanged: (value) {
                              //controller.searchBsnsName(value);
                            },
                          )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static buildObstSttusSearchContainer(LpController controller) {
    return Column(
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
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
          child: Column(
            children: [
              // 소재지, 소유자명
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '소재지',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                hintText: '읍면동을 입력해주세요.',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 144.w,
                            child: CustomTextField(hintText: '본번', onChanged: (value) {  },),
                          ),
                          SizedBox(width: 12.w),
                          SizedBox(
                            width: 144.w,
                            child: CustomTextField(hintText: '부번', onChanged: (value) {  },),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '소유자명',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                hintText: '소유자명을 입력해주세요.',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // 지장물구분, 조사차수
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '지장물구분',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                hintText: '지장물구분',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '조사차수',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                hintText: '조사차수',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // 가격시점, 실태조사일
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '가격시점',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                isDateTime: true,
                                hintText: '',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '실태조사일',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                isDateTime: true,
                                hintText: '',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 지급요청일, 수용재결일
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '지급요청일',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                isDateTime: true,
                                hintText: '',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '수용재결일',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                isDateTime: true,
                                hintText: '',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 진행단계, 평가차수
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '진행단계',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                hintText: '진행단계',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 80.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: AutoSizeText(
                              '평가차수',
                              style: TextStyle(
                                color: tableTextColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                              child: CustomTextField(
                                controller: controller.ownerLctnSearchController,
                                hintText: '평가차수',
                                onChanged: (value) {
                                  //controller.searchBsnsName(value);
                                },
                              )),
                          SizedBox(width: 12.w),
                          CustomButton(
                            color: Color(0XFFE5E8ED),
                            text: '조회',
                            textColor: Color(0xFF1D1D1D),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
