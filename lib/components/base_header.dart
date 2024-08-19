import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../routes/app_route.dart';
import '../screens/bsns/bsns_controller.dart';
import '../utils/colors.dart';
import 'custom_bsns_badge.dart';
import '../utils/dialog_util.dart';

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
        SizedBox(
          height: 1.w > 1.h ? 56.h : 36.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_base_header_user.svg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                SizedBox(width: 6.h),
                                Container(
                                  width: 1.w > 1.h ? 100.w : 130.w,
                                  padding: EdgeInsets.all(2.r),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '홍길동 대리',
                                        style: TextStyle(
                                          color: Color(0xFF2C2C2C),
                                          fontSize: 1.w > 1.h ? 16.sp : 22.sp,
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
                                  color: tableColor1,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_settings.svg',
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
                                    0,
                                    '로그아웃',
                                    widget: Text('로그아웃 하시겠습니까?'),
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
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                  decoration: ShapeDecoration(
                                    color: tableColor1,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_logout.svg',
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
          //BsnsController.to.selectedBsns.value.title == null ?
          BsnsController.to.selectBsnsPlan.value == null ?
          Container(
            margin: EdgeInsets.only(left: 24.w),
            child: Text(
              '선택된 사업명이 없습니다.',
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 1.w > 1.h ? 16.sp : 22.sp,
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
                                //CustomBsnsBadge(text: '댐', bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                                CustomBsnsBadge(text: BsnsController.to.selectBsnsPlan.value.bsnsDivLclsCd ?? '', bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                                SizedBox(width: 6.w),
                                //CustomBsnsBadge(text: '건설', bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                                CustomBsnsBadge(text: BsnsController.to.selectBsnsPlan.value.bsnsDivMclsCd ?? '', bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  //BsnsController.to.selectedBsns.value.title ?? '',
                                  BsnsController.to.selectBsnsPlan.value.bsnsNm ?? '',
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
