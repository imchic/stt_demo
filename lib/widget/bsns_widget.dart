import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_button.dart';
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
                            //width: 120.w,
                            child: AutoSizeText(
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
                1.w > 1.h ? SizedBox(height: 32.h) : SizedBox(height: 0.h),
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
                                        Row(
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
                                                child: AutoSizeText(
                                                  controller.bsnsPlanList[index].bsnsNm ?? '',
                                                  style: TextStyle(
                                                    color: Color(0xFF1D1D1D),
                                                    fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  child: AutoSizeText(
                                                    controller.bsnsPlanList[index].bsnsLcinfo ?? '-',
                                                    style: TextStyle(
                                                      color: Color(0xFF555555),
                                                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight: FontWeight.w400,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              CustomButton(
                                                text: '상세정보',
                                                color: Color(0xFF2287EF),
                                                textColor: Colors.white,
                                                onPressed: () {
                                                  var data = controller.bsnsPlanList[index];
                                                  controller.selectBsnsPlan.value = data;

                                                  DialogUtil.showAlertDialog(
                                                    Get.context!,
                                                    1440,
                                                    '상세정보',
                                                    isButtonVisible: false,
                                                    onOk: () {},
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
                                                                          AutoSizeText('사업시작일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),),
                                                                          SizedBox(width: 6.w),
                                                                          ConvertDatetimeText(value: controller.bsnsPlanList[index].bsnsStrtDe,),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 6.w),
                                                                    AutoSizeText('~', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontFamily: 'Pretendard', fontWeight: FontWeight.w700,),),
                                                                    SizedBox(width: 6.w),
                                                                    Container(
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          AutoSizeText('사업종료일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),),
                                                                          SizedBox(width: 6.w),
                                                                          ConvertDatetimeText(value: controller.bsnsPlanList[index].bsnsEndDe,),
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
                                                                          AutoSizeText('승인일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),),
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
                                                                          AutoSizeText('관보고시일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontFamily: 'Pretendard', fontWeight: FontWeight.w700,),),
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
                                                                          AutoSizeText('준공일', style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 1.w > 1.h ? 30.sp : 50.sp, fontWeight: FontWeight.w700,),),
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
                                                                    const SizedBox(width: 8),
                                                                    AutoSizeText(
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
                                                    AutoSizeText(
                                                      controller.bsnsPlanList[index].mngdeptCd ?? '-',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color(0xFF1D1D1D),
                                                        fontSize: 1.w > 1.h ? 30.sp : 50.sp,
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
                                                  width: double.infinity,
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    alignment: Alignment.topLeft,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        AutoSizeText(
                                                          '수도개발처',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 1.w > 1.h ? 30.sp : 50.sp,
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
                                                        AutoSizeText(
                                                          '수도개발부',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 1.w > 1.h ? 30.sp : 50.sp,
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
                                                        AutoSizeText(
                                                          '수도개발팀',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                                            fontFamily: 'Pretendard',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(width: 16.w),
                                                        AutoSizeText(
                                                          '홍길동',
                                                          style: TextStyle(
                                                            color: Color(0xFF555555),
                                                            fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                                                            fontFamily: 'Pretendard',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.all(24.r),
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
                  child: Icon(Icons.arrow_back_ios, size: 30.sp, color: Color(0xff2d2d2d))),
                  AutoSizeText('사업구역 선택', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500, color: tableTextColor)),
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
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          padding: EdgeInsets.all(24.r),
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
                      child: Icon(Icons.arrow_back_ios, size: 30.sp, color: Color(0xff2d2d2d))),
                  AutoSizeText('조사차수', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500, color: tableTextColor)),
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
                    child: AutoSizeText('차수등록',
                        style: TextStyle(
                            fontSize: 30.sp,
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
