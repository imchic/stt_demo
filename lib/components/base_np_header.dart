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

class BaseNpHeader extends StatefulWidget {
  String? value;

  BaseNpHeader(value, {super.key});

  @override
  State<BaseNpHeader> createState() => _BaseNpHeaderState();
}

class _BaseNpHeaderState extends State<BaseNpHeader> {
  @override
  Widget build(BuildContext context) {
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
              Expanded(child: buildNpContainer()),
              // 사용자 정보 및 설정
              Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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

  Widget buildNpContainer() {
    return Container(
      width: Get.width,
      height: 48.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            height: 48.h,
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
                   AutoSizeText(
                      maxFontSize: 20,
                      '사업분류',
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    AutoSizeText(
                      maxFontSize: 20,
                      '사업명',
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      width: 2,
                      height: 32,
                      decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                    ),
                    SizedBox(width: 20.w),
                    AutoSizeText(
                      maxFontSize: 20,
                      '사용자',
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    AutoSizeText(
                      maxFontSize: 20,
                      '홍길동',
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
