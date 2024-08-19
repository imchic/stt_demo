import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/utils/common_util.dart';
import 'package:ldi/utils/dialog_util.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            margin: EdgeInsets.only(top: 14.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0, color: borderLine),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 36.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                  '사업명',
                                  style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 1.w > 1.h ? 16.sp : 22.sp,
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
                                        controller: controller.bsnsNameSearchController,
                                        hintText: '사업명을 입력해주세요',
                                        onChanged: (value) {
                                          controller.searchBsnsName(value);
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: SizedBox(
                          height: 36.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '사업번호',
                                style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 1.w > 1.h ? 16.sp : 22.sp,
                                  fontWeight: FontWeight.w500,
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
                      ),
                    ],
                  ),
                ),
                1.w > 1.h ? SizedBox(height: 20.h) : SizedBox(height: 0.h),
                BsnsSelectScreen().buildBsnsRadio(),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(child: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(length: controller.bsnsPlanList.length),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.bsnsPlanList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // controller.isBsnsSelectFlag.value = true;
                                // controller.isBsnsZoneSelectFlag.value = false;
                                // controller.selectedBsns.value = controller.searchBsnsList[index];
                                // controller.fetchBsnsSelectAreaGridDataSource();
                                controller.isBsnsSelectFlag.value = true;
                                controller.selectBsnsPlan.value = controller.bsnsPlanList[index];
                                controller.fetchBsnsSelectAreaGridDataSource();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 0, color: borderLine),
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomBsnsBadge(text: controller.bsnsPlanList[index].bsnsDivLclsCd, bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                                                      SizedBox(width: 6.w),
                                                      CustomBsnsBadge(text: controller.bsnsPlanList[index].bsnsDivMclsCd, bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                                                      SizedBox(width: 10.w),
                                                      Expanded(
                                                        child: SizedBox(
                                                          child: Text(controller.bsnsPlanList[index].bsnsNm ?? '',
                                                            style: TextStyle(
                                                              color: tableTextColor,
                                                              fontSize: 16.sp,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10.w),
                                                Text(
                                                  controller.bsnsPlanList[index].bsnsLcinfo ?? '',
                                                  style: TextStyle(
                                                    color: Color(0xFF555555),
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 10.w),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                                        decoration: ShapeDecoration(
                                                          color: Color(0xFFF0F0F0),
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '주관부서',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Color(0xFF1D1D1D),
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 12.w),
                                                      Expanded(
                                                        child: SizedBox(
                                                          height: 23.h,
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              //Text('수도개발처', style: TextStyle(color: Color(0xFF555555), fontSize: 14.sp, fontWeight: FontWeight.w400,)),
                                                              Text(controller.bsnsPlanList[index].mngdeptCd ?? '-', style: TextStyle(color: Color(0xFF555555), fontSize: 14.sp, fontWeight: FontWeight.w400,),),
                                                              SizedBox(width: 8.w),
                                                              Container(width: 1.w, height: 16.h, decoration: BoxDecoration(color: Color(0xFFC6C6C6)),),
                                                              SizedBox(width: 8.w),
                                                              Text('관련부서코드1', style: TextStyle(color: Color(0xFF555555), fontSize: 14.sp, fontWeight: FontWeight.w400,),),
                                                              SizedBox(width: 8.w),
                                                              Container(width: 1, height: 16, decoration: BoxDecoration(color: Color(0xFFC6C6C6)),),
                                                              SizedBox(width: 8.w),
                                                              Text('관련부서코드2', style: TextStyle(color: Color(0xFF555555), fontSize: 14.sp, fontWeight: FontWeight.w400,),),
                                                              SizedBox(width: 8.w),
                                                              Text('등록자', style: TextStyle(color: Color(0xFF555555), fontSize: 14.sp, fontWeight: FontWeight.w400,),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        InkWell(
                                          onTap: () {
                                            print('상세정보 클릭');
                                            var data = controller.bsnsPlanList[index];
                                            controller.selectBsnsPlan.value = data;
                                            DialogUtil.showAlertDialog(Get.context!, 800, '상세정보',
                                                isButtonVisible: false,
                                                onOk: () {}, onCancel: () {},
                                                widget: Column(
                                                  children: [
                                                    Container(
                                                      width: 720.w,
                                                      height: 72.h,
                                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                                                      decoration: ShapeDecoration(
                                                        color: Color(0xFFF6F7FB),
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
                                                                      Text(
                                                                        '사업시작일',
                                                                        style: TextStyle(
                                                                          color: Color(0xFF1D1D1D),
                                                                          fontSize: 15.sp,
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 6.w),
                                                                      ConvertDatetimeText(value: controller.bsnsPlanList[index].bsnsStrtDe,),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(width: 6.w),
                                                                Text(
                                                                  '~',
                                                                  style: TextStyle(
                                                                    color: Color(0xFF1D1D1D),
                                                                    fontSize: 15.sp,
                                                                    fontFamily: 'Pretendard',
                                                                    fontWeight: FontWeight.w700,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 6.w),
                                                                Container(
                                                                  child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        '사업종료일',
                                                                        style: TextStyle(
                                                                          color: Color(0xFF1D1D1D),
                                                                          fontSize: 15.sp,
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 6.w),
                                                                      ConvertDatetimeText(value: controller.bsnsPlanList[index].bsnsEndDe,),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 10.h),
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
                                                                      Text(
                                                                        '승인일',
                                                                        style: TextStyle(
                                                                          color: Color(0xFF1D1D1D),
                                                                          fontSize: 15.sp,
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 6.w),
                                                                      ConvertDatetimeText(value: controller.bsnsPlanList[index].aprvDe,),
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
                                                                      Text(
                                                                        '관보고시일',
                                                                        style: TextStyle(
                                                                          color: Color(0xFF1D1D1D),
                                                                          fontSize: 15.sp,
                                                                          fontFamily: 'Pretendard',
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 6.w),
                                                                      ConvertDatetimeText(value: controller.bsnsPlanList[index].gztNtfcDe,),
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
                                                                      Text(
                                                                        '준공일',
                                                                        style: TextStyle(
                                                                          color: Color(0xFF1D1D1D),
                                                                          fontSize: 15.sp,
                                                                          fontWeight: FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 6.w),
                                                                      ConvertDatetimeText(value: controller.bsnsPlanList[index].competDe,),
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
                                                    BsnsSelectScreen().buildTable(),
                                                    SizedBox(height: 16.h),
                                                    SizedBox(
                                                      width: 720.w,
                                                      height: 36.h,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            height: 36.h,
                                                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                                                            decoration: ShapeDecoration(
                                                              color: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                                                borderRadius: BorderRadius.circular(6),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  width: 20.w,
                                                                  height: 20.h,
                                                                  clipBehavior: Clip.antiAlias,
                                                                  decoration: BoxDecoration(),
                                                                  child: SvgPicture.asset('assets/icons/ic_pdf.svg', width: 20.w, height: 20.h),
                                                                ),
                                                                SizedBox(width: 4.w),
                                                                Text(
                                                                  '1차 고시문',
                                                                  style: TextStyle(
                                                                    color: Color(0xFF555555),
                                                                    fontSize: 15.sp,
                                                                    fontFamily: 'Pretendard',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                            );
                                          },
                                          child: Container(
                                            width: 80.w,
                                            height: 36.h,
                                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF246AEA),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('상세정보', style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500,),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TabBar(
                      controller: controller.bsnsTabController,
                      tabs: controller.bsnsSelectTabItems,
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      isScrollable: true,
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
