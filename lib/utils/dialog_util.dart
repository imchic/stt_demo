import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signature_view/flutter_signature_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldm/components/custom_textfield.dart';
import 'package:ldm/screens/np_controller.dart';

import 'applog.dart';
import 'colors.dart';

/// [DialogUtil] 다이얼로그 관련 유틸리티 클래스
class DialogUtil {
  static void showLoading(BuildContext context) {
    Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
        .then((value) {
      print('DialogUtil.showLoading() value: $value');
    }).then((value) {
      print('DialogUtil.showLoading() value: $value');
    });
  }

  /// [showAlertDialog] 알럿창을 띄워줍니다.

  // 파라미터 필수가 아닌경우
  // required Null Function() onOk, required Null Function() onCancel, required Widget? child

  /// [showAlertDialog] 알럿창을 띄워줍니다.
  /// [context] 컨텍스트
  /// [width] 다이얼로그 너비
  /// [title] 다이얼로그 타이틀
  /// [textOk] 확인 버튼 텍스트
  /// [textCancel] 취소 버튼 텍스트
  /// [onOk] 확인 버튼 클릭시 실행할 함수
  /// [onCancel] 취소 버튼 클릭시 실행할 함수
  /// [widget] 다이얼로그 내용
  /// [isButtonVisible] 버튼 표시 여부
  static void showAlertDialog(BuildContext context, int? width, String title,
      {String? textOk,
      String? textCancel,
      required Future<Null> Function() onOk,
      required Null Function() onCancel,
      required Widget? widget,
      bool? isButtonVisible}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            alignment: Alignment.center,
            elevation: 0,
            child: Container(
              width: width?.w == 0 ? 480.w : width?.w,
              padding: EdgeInsets.all(80.r),
              // decoration: ShapeDecoration(
              //   color: Colors.transparent,
              //   shape: RoundedRectangleBorder(
              //     //side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
              //     borderRadius: BorderRadius.circular(12.r),
              //   ),
              // ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    SizedBox(
                      //width: double.infinity,
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
                                AutoSizeText(
                                  maxFontSize: 20,
                                  title,
                                  style: TextStyle(
                                    color: tableTextColor,
                                    fontSize: 1.w > 1.h ? 48.sp : 68.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: SizedBox(
                                    width: 1.w > 1.h ? 48.w : 68.h,
                                    height: 1.w > 1.h ? 48.h : 68.w,
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_close.svg',
                                      width: 48.w,
                                      height: 48.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 다이얼로그 위젯
                          SizedBox(
                            width: double.infinity,
                            child: widget,
                          ),
                          SizedBox(height: 48.h),
                          isButtonVisible == false
                              ? Container()
                              : SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          onCancel();
                                        },
                                        child: Container(
                                          width: 96.w,
                                          height: 1.w > 1.h ? 72.h : 52.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF2C2C2C),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                //'취소',
                                                maxFontSize: 20,
                                                textCancel ?? '취소',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      1.w > 1.h ? 30.sp : 50.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          onOk();
                                        },
                                        child: Container(
                                          width: 96.w,
                                          height: 1.w > 1.h ? 72.h : 52.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF246AEA),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                maxFontSize: 20,
                                                textOk ?? '확인',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      1.w > 1.h ? 30.sp : 50.sp,
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
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  /// [showBottomSheet] 바텀 시트를 띄워줍니다.
  static void showBottomSheet(
      BuildContext context, String title, Widget child) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: 1360.w,
        // maxHeight: 360.h
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(80.r),
          child: SingleChildScrollView(
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
                      AutoSizeText(
                        maxFontSize: 20,
                        title,
                        style: TextStyle(
                          color: tableTextColor,
                          fontSize: 1.w > 1.h ? 48.sp : 68.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SizedBox(
                          width: 48.w,
                          height: 48.h,
                          child: SvgPicture.asset(
                            'assets/icons/ic_close.svg',
                            width: 48.w,
                            height: 48.h,
                            fit: BoxFit.fitHeight,
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
          ),
        );
      },
    );
  }

  // 스낵바
  static void showSnackBar(BuildContext context, String title, String message) {
    if (Get.isSnackbarOpen == false) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.info_outline, color: Colors.white),
        borderRadius: 12.r,
        duration: Duration(milliseconds: 1500),
      );
    }
  }

  static void errorSnackBar(
      BuildContext context, String title, String message) {
    if (Get.isSnackbarOpen == false) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white),
        borderRadius: 12.r,
        duration: Duration(milliseconds: 1500),
      );
    }
  }

  static void successSnackBar(
      BuildContext context, String title, String message) {
    if (Get.isSnackbarOpen == false) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.check_circle_outline, color: Colors.white),
        borderRadius: 12.r,
        duration: Duration(milliseconds: 1500),
      );
    }
  }

  static void warningSnackBar(
      BuildContext context, String title, String message) {
    if (Get.isSnackbarOpen == false) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.warning_amber_outlined, color: Colors.white),
        borderRadius: 12.r,
        duration: Duration(milliseconds: 1500),
      );
    }
  }

  static void showConfirmDialog(
      {required String title,
      required String content,
      required String confirmText,
      required String cancelText,
      required Null Function() onConfirm, required TextEditingController editController}) {
    Get.defaultDialog(
      title: title,
      content: Column(
        children: [
          Text(content),
          SizedBox(height: 20.h),
          Text(
            // yyyy-MM-dd
            DateTime.now().toString().substring(0, 10),
          ),
        ],
      ),
      textConfirm: confirmText,
      textCancel: cancelText,
      onConfirm: onConfirm,
    );
  }
}
