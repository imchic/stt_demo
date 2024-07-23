import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/routes/app_route.dart';
import 'package:stt_demo/screens/bsns/bsns_controller.dart';
import 'package:stt_demo/utils/dialog_util.dart';

class BaseHeader extends StatefulWidget {
  const BaseHeader({super.key});

  @override
  State<BaseHeader> createState() => _BaseHeaderState();
}

class _BaseHeaderState extends State<BaseHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 64.h,
          // color: Colors.grey,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120.w,
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_kwater_base_header_logo.svg',
                           fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: buildSelectBsnsContainer()),
              Expanded(
                child: Container(
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
                            padding: EdgeInsets.all(2.r),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: SvgPicture.asset(
                                    'assets/images/ic_base_header_user.svg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                SizedBox(width: 6.h),
                                Container(
                                  width: 86.w,
                                  padding: EdgeInsets.all(2.r),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '홍길동님',
                                        style: TextStyle(
                                          color: Color(0xFF2C2C2C),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 24.w),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                      height: 24.h,
                                      child: SvgPicture.asset(
                                        'assets/images/ic_settings.svg',
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: () {
                                  DialogUtil.showAlertDialog(
                                    context,
                                    '로그아웃',
                                    '로그아웃 하시겠습니까?',
                                    () {
                                      Get.back();
                                      Get.offAllNamed(AppRoute.login);
                                    },
                                    () {
                                      Get.back();
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF6F6F6),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 24.w,
                                        height: 24.h,
                                        child: SvgPicture.asset(
                                          'assets/images/ic_logout.svg',
                                          fit: BoxFit.fitHeight,
                                        )
                                      ),
                                    ],
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// [buildSelectBsnsContainer] is a custom widget
  Widget buildSelectBsnsContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() =>
          BsnsController.to.selectedBsns.value.title == null ?
          Container(
            margin: EdgeInsets.only(left: 24.w),
            child: Text(
              '선택된 사업명이 없습니다.',
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
          :
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 24.w),
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 34.h,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEFF5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '댐',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF1D56BC),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  height: 34.h,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFFF1E3),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '건설',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFF7F00),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  BsnsController.to.selectedBsns.value.title ?? '',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
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
        ),
      ],
    );
  }

}
