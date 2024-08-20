import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/utils/common_util.dart';
import 'package:ldi/utils/dialog_util.dart';

import '../components/base_tabbar.dart';
import '../components/convert_datetime_text.dart';
import '../components/custom_richtext.dart';
import '../components/custom_textfield.dart';
import '../screens/bsns/bsns_controller.dart';
import '../screens/bsns/select/bsns_select_screen.dart';
import '../utils/colors.dart';
import '../components/custom_bsns_badge.dart';


/// 사업선택 화면 위젯
class BsnsWidget {
  static buildBsnsListItem(BsnsController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 244.h,
            padding: EdgeInsets.all(40.r),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0, color: borderLine),
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
                            child: Text(
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
                            width: 120.w,
                            child: Text(
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: controller.bsnsNoSearchController,
                                    hintText: '사업번호를 입력해주세요',
                                    onChanged: (value) {
                                      controller.searchBsnsName(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                1.w > 1.h ? SizedBox(height: 32.h) : SizedBox(height: 0.h),
                BsnsSelectScreen().buildBsnsRadio(),
              ],
            ),
          ),
          SizedBox(height: 48.h),
          Expanded(child: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(length: controller.bsnsPlanList.length),
                SizedBox(height: 48.h),
                Expanded(
                  child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(height: 20.h),
                          padding: EdgeInsets.zero,
                          itemCount: controller.bsnsPlanList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.isBsnsSelectFlag.value = true;
                                controller.selectBsnsPlan.value = controller.bsnsPlanList[index];
                                controller.fetchBsnsSelectAreaGridDataSource();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(40.r),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.w, color: borderLine),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    CustomBsnsBadge(text: controller.bsnsPlanList[index].bsnsDivLclsCd, bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                                                    SizedBox(width: 12.w),
                                                    CustomBsnsBadge(text: controller.bsnsPlanList[index].bsnsDivMclsCd, bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                                                    SizedBox(width: 20.w),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 20.w),
                                              Expanded(
                                                child: SizedBox(
                                                  child: Text(
                                                    controller.bsnsPlanList[index].bsnsNm ?? '',
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
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          controller.bsnsPlanList[index].bsnsLcinfo ?? '',
                                          style: TextStyle(
                                            color: Color(0xFF555555),
                                            fontSize: 32.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        Container(
                                          width: double.infinity,
                                          child: Row(
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
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      controller.bsnsPlanList[index].mngdeptCd ?? '-',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color(0xFF1D1D1D),
                                                        fontSize: 30.sp,
                                                        fontFamily: 'Pretendard',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 24.w),
                                              Expanded(
                                                child: Container(
                                                  height: 45.h,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '수도개발처',
                                                        style: TextStyle(
                                                          color: Color(0xFF555555),
                                                          fontSize: 30.sp,
                                                          fontFamily: 'Pretendard',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Container(
                                                        width: 2.w,
                                                        height: 32.h,
                                                        decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Text(
                                                        '수도개발부',
                                                        style: TextStyle(
                                                          color: Color(0xFF555555),
                                                          fontSize: 30.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Container(
                                                        width: 2.w,
                                                        height: 32.h,
                                                        decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Text(
                                                        '수도개발팀',
                                                        style: TextStyle(
                                                          color: Color(0xFF555555),
                                                          fontSize: 30.sp,
                                                          fontFamily: 'Pretendard',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Text(
                                                        '홍길동',
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
                    },
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  /// 사업목록 화면 위젯
  static Widget buildBsnsListView(BsnsController controller) {
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
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    isScrollable: true,
                    activeColor: Colors.black,
                    unActiveTextColor: Color(0xFF555555),
                    activeTextColor: Colors.black,
                    unActiveColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: TabBarView(
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
  static Widget buildBsnsSelectZoneContainer(BsnsController controller){
    return Expanded(
      child: Container(
          color: bsnsListViewBg,
          margin: EdgeInsets.only(top: 56.h, right: 10.w, bottom: 10.h, left: 10.w),
          padding: EdgeInsets.only(left: 10.w, top: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(onTap: () {
                    controller.isBsnsSelectFlag.value = false;
                  },
                  child: Icon(Icons.arrow_back_ios, size: 20.sp, color: Color(0xff2d2d2d))),
                  Text('사업구역 선택', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: tableTextColor)),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: borderLine),
              Expanded(child: BsnsSelectScreen().buildBsnsSelectAreaListDataGrid()),
            ],
          )
      ),
    );
  }

  /// 조사차수 선택 화면 위젯
  static Widget buildBsnsSelectSqncContainer(BsnsController controller){
    return Expanded(
      child: Container(
          color: bsnsListViewBg,
          margin: EdgeInsets.only(top: 56.h, right: 10.w, bottom: 10.h, left: 10.w),
          padding: EdgeInsets.only(left: 10.w, top: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(onTap: () {
                    controller.isBsnsZoneSelectFlag.value = false;
                    controller.isBsnsSelectFlag.value = true;
                    controller.fetchBsnsSelectAreaGridDataSource();
                  },
                  child: Icon(Icons.arrow_back_ios, size: 20.sp, color: Color(0xff2d2d2d))),
                  Text('조사 차수', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: tableTextColor)),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: borderLine),
              SizedBox(height: 10.h),
              Expanded(child: BsnsSelectScreen().buildBsnsSqncDataGrid()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.getSelectOrder();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor:
                      const Color(0xff2d2d2d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text('차수등록',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight:
                            FontWeight.bold)),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }

}
