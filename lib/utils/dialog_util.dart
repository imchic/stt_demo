import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/utils/colors.dart';

/// [DialogUtil] 다이얼로그 관련 유틸리티 클래스
class DialogUtil {

  /// [showAlertDialog] 알럿창을 띄워줍니다.
  static void showAlertDialog(BuildContext context, String title,
      String message, Function onOk, Function onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          elevation: 0,
          child: Container(
            width: 480.w,
            padding: EdgeInsets.all(40.r),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFF1D1D1D),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          child: SvgPicture.asset(
                            'assets/images/ic_close.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        width: 400.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                onCancel();
                              },
                              child: Container(
                                width: 60.w,
                                height: 40.h,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF2C2C2C),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '취소',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            InkWell(
                              onTap: () {
                                Get.back();
                                onOk();
                              },
                              child: Container(
                                width: 60.w,
                                height: 40.h,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF246AEA),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '확인',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        );
      },
    );
  }

  /// [showBottomSheet] 바텀 시트를 띄워줍니다.
  static void showBottomSheet(BuildContext context, String title, Widget child) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: 640.w,
        // maxHeight: 360.h
      ),
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(24.r),
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        child: SvgPicture.asset(
                          'assets/images/ic_close.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              child,
            ],
          ),
        );
      },
    );
  }

  // 스낵바
  static void showSnackBar(BuildContext context, String message) {
    // hideCurrentSnackBar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // 모달 팝업
  static void showCustomDialog(BuildContext context, Widget child, Null Function() onOk, Null Function() onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          elevation: 0,
          child: SizedBox(
              width: Get.width * 0.5,
              height: Get.height * 0.5,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      Expanded(child: child),
                      // button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                              if (onCancel != null) {
                                onCancel();
                              }
                            },
                            child: Text('취소'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              if (onOk != null) {
                                onOk();
                              }
                            },
                            child: Text('확인'),
                          ),
                    ],
                  )
                ],
              )
            )
          ),
        );
      },
    );
  }

}
