import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldm/components/custom_button.dart';
import 'package:ldm/components/custom_sliver_persistent_headerdelegate.dart';

import '../components/base_tabbar.dart';
import '../components/convert_datetime_text.dart';
import '../components/custom_bsns_badge.dart';
import '../components/custom_textfield.dart';
import '../screens/lp_controller.dart';
import '../screens/lp_screen.dart';
import '../utils/colors.dart';
import '../utils/dialog_util.dart';

/// 사업선택 화면 위젯
class BsnsWidget {
  static buildBsnsListItem(LpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: CustomSliverPersistentHeaderDelegate(
              minHeight: 130.0,
              maxHeight: 130.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: borderLine),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: AutoSizeText(
                                  maxFontSize: 20,
                                  '사업명',
                                  style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 1.w > 1.h ? 32.sp : 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 24.w),
                              Expanded(
                                child: CustomTextField(
                                  controller: controller.bsnsNameSearchController,
                                  hintText: '사업명을 입력해주세요',
                                  onChanged: (value) {
                                    controller.searchBsnsName(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 80.w),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                //width: 120.w,
                                child: AutoSizeText(
                                  maxFontSize: 20,
                                  '사업번호',
                                  style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 1.w > 1.h ? 32.sp : 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: CustomTextField(
                                  controller: controller.bsnsNoSearchController,
                                  hintText: '사업번호를 입력해주세요',
                                  onChanged: (value) {
                                    controller.searchBsnsNo(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    1.w > 1.h ? SizedBox(height: 32.h) : SizedBox(height: 0.h),
                    lpScreen().buildBsnsRadio(),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    controller.isBsnsSelectFlag.value = true;
                    controller.selectBsnsPlan.value = controller.searchBsnsPlanList[index];
                    controller.fetchBsnsSelectAreaGridDataSource();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.all(40.r),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: borderLine),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomBsnsBadge(
                                    text: controller
                                        .searchBsnsPlanList[index].bsnsDivLclsNm,
                                    bgColor: Color(0xFFEFF5FF),
                                    textColor: Color(0xFF1D58BC)),
                                SizedBox(width: 12.w),
                                CustomBsnsBadge(
                                    text: controller
                                        .searchBsnsPlanList[index].bsnsDivMclsNm,
                                    bgColor: Color(0xFFFFF1E4),
                                    textColor: Color(0xFFFF8000)),
                                SizedBox(width: 20.w),
                                controller.searchBsnsPlanList[index]
                                            .bsnsDivSclsNm ==
                                        null
                                    ? Container()
                                    : CustomBsnsBadge(
                                        text: controller.searchBsnsPlanList[index]
                                            .bsnsDivSclsNm,
                                        bgColor: Color(0xffE5F8EE),
                                        textColor: Color(0xff2D9D64)),
                                //CustomBsnsBadge(text: controller.searchBsnsPlanList[index].bsnsDivSclsNm, bgColor: Color(0xffE5F8EE), textColor: Color(0xff2D9D64)),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            Expanded(
                              child: SizedBox(
                                child: AutoSizeText(
                                  maxFontSize: 20,
                                  controller.searchBsnsPlanList[index].bsnsNm ??
                                      '',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 32.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                maxFontSize: 20,
                                controller.searchBsnsPlanList[index].bsnsLcinfo ??
                                    '-',
                                style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 32.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            CustomButton(
                                text: '상세정보',
                                color: Color(0xFF2287EF),
                                textColor: Colors.white,
                                onPressed: () {
                                  var data = controller.searchBsnsPlanList[index];
                                  controller.selectBsnsPlan.value = data;

                                  DialogUtil.showAlertDialog(
                                    Get.context!,
                                    1440,
                                    '상세정보',
                                    isButtonVisible: false,
                                    onOk: () async {},
                                    onCancel: () {},
                                    widget: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 20.h, bottom: 20.h),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFF6F7FB),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.r)),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
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
                                                          SizedBox(
                                                              width: 120.w,
                                                              child: AutoSizeText(maxFontSize: 20, '사업기간', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),)),
                                                          SizedBox(width: 6.w),
                                                          Row(
                                                            children: [
                                                              ConvertDatetimeText(value: '${controller.searchBsnsPlanList[index].bsnsStrtDe}'),
                                                              SizedBox(width: 6.w),
                                                              AutoSizeText(maxFontSize: 20, '~', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontFamily: 'Pretendard', fontWeight: FontWeight.w700,),),
                                                              SizedBox(width: 6.w),
                                                              ConvertDatetimeText(value: '${controller.searchBsnsPlanList[index].bsnsEndDe}'),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 32.h),
                                              Container(
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
                                                          AutoSizeText(maxFontSize: 20, '승인일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),),
                                                          SizedBox(width: 6.w),
                                                          ConvertDatetimeText(value: controller.searchBsnsPlanList[index].aprvDe,),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 16.w),
                                                    Container(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          AutoSizeText(maxFontSize: 20, '관보고시일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontFamily: 'Pretendard', fontWeight: FontWeight.w700,),),
                                                          SizedBox(width: 6.w),
                                                          ConvertDatetimeText(value: controller.searchBsnsPlanList[index].gztNtfcDe,),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 16.w),
                                                    Container(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          AutoSizeText(maxFontSize: 20, '준공일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),),
                                                          SizedBox(width: 6.w),
                                                          ConvertDatetimeText(value: controller.searchBsnsPlanList[index].competDe,),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                        lpScreen().buildTable(),
                                        SizedBox(height: 32.h),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 72.h,
                                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 2.r, color: Color(0xFFD8D8D8)),
                                                    borderRadius: BorderRadius.circular(12.r),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40.w,
                                                      height: 40.h,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(),
                                                      child: SvgPicture.asset('assets/icons/ic_pdf.svg', width: 20.w, height: 20.h),
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    AutoSizeText(
                                                      maxFontSize: 20,
                                                      '1차 고시문',
                                                      style: TextStyle(
                                                        color: Color(0xFF555555),
                                                        fontSize: 30.sp,
                                                        fontFamily: 'Pretendard',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 20.w),
                                              Container(
                                                height: 72.h,
                                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 2.r, color: Color(0xFFD8D8D8)),
                                                    borderRadius: BorderRadius.circular(12.r),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40.w,
                                                      height: 40.h,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(),
                                                      child: SvgPicture.asset('assets/icons/ic_pdf.svg', width: 20.w, height: 20.h),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    AutoSizeText(
                                                      maxFontSize: 20,
                                                      '2차 고시문',
                                                      style: TextStyle(
                                                        color: Color(0xFF555555),
                                                        fontSize: 30.sp,
                                                        fontFamily: 'Pretendard',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              decoration: ShapeDecoration(
                                color: Color(0xFFE5E8ED),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: AutoSizeText(
                                maxFontSize: 20,
                                controller.searchBsnsPlanList[index].head ?? '-',
                                style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(width: 24.w),
                            AutoSizeText(
                              maxFontSize: 20,
                              controller.searchBsnsPlanList[index].dept ?? '-',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(width: 16.w),
                            Container(
                              width: 2.w,
                              height: 32.h,
                              decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                            ),
                            SizedBox(width: 16.w),
                            AutoSizeText(
                              maxFontSize: 20,
                              controller.searchBsnsPlanList[index].team ?? '-',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(width: 16.w),
                            Container(
                              width: 2.w,
                              height: 32.h,
                              decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                            ),
                            SizedBox(width: 16.w),
                            AutoSizeText(
                              maxFontSize: 20,
                              controller.searchBsnsPlanList[index].plans ?? '-',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: AutoSizeText(
                                maxFontSize: 20,
                                controller.searchBsnsPlanList[index].korname ?? '-',
                                style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: controller.searchBsnsPlanList.length,
            ),
          ),
        ],
      ),
    );
  }

  /// 사업목록 화면 위젯
  static Widget buildBsnsListView(LpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
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
                    controller: controller.bsnsTabController,
                    tabItems: controller.bsnsSelectTabItems,
                    labelColor: Color(0xFF2287EF),
                    indicatorColor: Color(0xFF2287EF),
                    isScrollable: true,
                    activeColor: Color(0xFF2287EF),
                    unActiveTextColor: Color(0xFF555555),
                    activeTextColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller.bsnsTabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // [사업선택 -> 사업목록]
              buildBsnsListItem(controller),
            ],
          ))
        ],
      ),
    );
  }

  /// 사업구역 선택 화면 위젯
  static Widget buildBsnsSelectZoneContainer(LpController controller) {
    return Expanded(
      child: Container(
          color: bsnsListViewBg,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        controller.isBsnsSelectFlag.value = false;
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 30.sp, color: Color(0xff2d2d2d))),
                  AutoSizeText('사업구역 선택',
                      maxFontSize: 20,
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                          color: tableTextColor)),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: borderLine),
              Expanded(
                  child: lpScreen().buildBsnsSelectAreaListDataGrid()),
            ],
          )),
    );
  }

  /// 조사차수 선택 화면 위젯
  static Widget buildBsnsSelectSqncContainer(LpController controller) {
    return Expanded(
      child: Container(
          color: bsnsListViewBg,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        controller.isBsnsZoneSelectFlag.value = false;
                        controller.isBsnsSelectFlag.value = true;
                        controller.fetchBsnsSelectAreaGridDataSource();
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 30.sp, color: Color(0xff2d2d2d))),
                  AutoSizeText('조사차수',
                      maxFontSize: 20,
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                          color: tableTextColor)),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: borderLine),
              SizedBox(height: 10.h),
              Obx(() =>
                Expanded(child: controller.bsnsAccdtinvstgSqncDataSource.value.rows.length == 0 ? Container(
                  child: Center(
                    child: AutoSizeText('실태조사차수가 없습니다.',
                        maxFontSize: 20,
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w500,
                            color: tableTextColor)),
                  ),
                ) : lpScreen().buildBsnsSqncDataGrid()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.getSelectOrder();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xff2d2d2d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: AutoSizeText('차수등록',
                        maxFontSize: 20,
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
