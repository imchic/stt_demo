import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ldi/screens/login/login_controller.dart';
import 'package:ldi/screens/np_controller.dart';

import '../routes/app_route.dart';
import '../screens/lp_controller.dart';
import 'custom_bsns_badge.dart';
import '../utils/dialog_util.dart';

class BaseHeader extends StatefulWidget {
  String? value;

  BaseHeader(value, {super.key});

  @override
  State<BaseHeader> createState() => _BaseHeaderState();
}

class _BaseHeaderState extends State<BaseHeader> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(NpController());

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 112.h,
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 사업분류 및 사업명 출력
              Expanded(child: buildLpContainer()),
              // 사용자 정보 및 설정
              Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 64.h,
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/ic_base_header_user.svg',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                //width: 1.w > 1.h ? 172.w : 202.w,
                                padding: EdgeInsets.all(4.r),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      maxFontSize: 20,
                                      '홍길동 대리',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 32.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 32.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              //width: 1.w > 1.h ? 56.w : 48.w,
                              //height: 1.w > 1.h ? 56.h : 48.h,
                              child: Container(
                                margin: EdgeInsets.all(4.w),
                                child: SvgPicture.asset(
                                  'assets/icons/ic_settings.svg',
                                  // width: 1.w > 1.h ? 48.w : 40.w,
                                  // height: 1.w > 1.h ? 48.h : 40.h,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(width: 32.w),
                            InkWell(
                              onTap: () {
                                DialogUtil.showAlertDialog(
                                  context,
                                  0,
                                  '로그아웃',
                                  widget: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('로그아웃 하시겠습니까?',
                                        style: TextStyle(
                                            color: Color(0xFF2C2C2C),
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  onOk: () {
                                    Get.back();
                                    Get.offAllNamed(AppRoute.login);
                                  },
                                  onCancel: () {
                                    Get.back();
                                  },
                                );
                              },
                              child: Container(
                                // width: 56.w,
                                // height: 56.h,
                                child: Container(
                                  margin: EdgeInsets.all(4.w),
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_logout.svg',
                                    // width: 1.w > 1.h ? 48.w : 48.w,
                                    // height: 1.w > 1.h ? 48.h : 48.h,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// [buildLpContainer] is a custom widget
  Widget buildLpContainer() {
    return Container(
      width: Get.width,
      height: 88.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() =>
          LpController.to.selectBsnsPlan.value.bsnsNo == null?
            Container(
              width: Get.width,
              margin: EdgeInsets.only(left: 24.w),
              child: AutoSizeText(
                maxFontSize: 20,
                '선택된 사업명이 없습니다.',
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
            : Container(
            width: Get.width,
            height: 88.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBsnsBadge(text: LpController.to.selectBsnsPlan.value.bsnsDivLclsNm ?? '', bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                    SizedBox(width: 6.w),
                    CustomBsnsBadge(text: LpController.to.selectBsnsPlan.value.bsnsDivMclsNm ?? '', bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                    SizedBox(width: 6.w),
                    LpController.to.selectBsnsPlan.value.bsnsDivSclsNm == null
                        ? Container()
                        : CustomBsnsBadge(text: LpController.to.selectBsnsPlan.value.bsnsDivSclsNm ?? '', bgColor: Color(0xFFE8F6F3), textColor: Color(0xFF00BFA5)),
                  ],
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        maxFontSize: 20,
                        maxLines: 2,
                        LpController.to.selectBsnsPlan.value.bsnsNm ?? '',
                        style: TextStyle(
                          color: Color(0xFF1D1D1D),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        width: 2.w,
                        height: 32.h,
                        decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: AutoSizeText(
                          maxLines: 2,
                          maxFontSize: 20,
                          LpController.to.selectedBsnsSelectArea.value.bsnsZoneNm ?? '',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        width: 2.w,
                        height: 32.h,
                        decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: AutoSizeText(
                          maxLines: 2,
                          maxFontSize: 20,
                          LpController.to.selectSqnc.value.accdtInvstgSqnc == null ? '' : '${LpController.to.selectSqnc.value.accdtInvstgSqnc}차',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
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
        ],
      ),
    );
  }
}
