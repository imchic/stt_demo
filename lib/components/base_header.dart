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
        Container(
          height: 1.w > 1.h ? 112.h : 36.h,
          //color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 사업분류 및 사업명 출력
              Expanded(child: buildSelectBsnsContainer()),
              // 사용자 정보 및 설정
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
                                  width: 1.w > 1.h ? 172.w : 80.w,
                                  padding: EdgeInsets.all(4.r),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '홍길동 대리',
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
                                width: 56.w,
                                height: 56.h,
                                child: Container(
                                  margin: EdgeInsets.all(4.w),
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_settings.svg',
                                    width: 48.w,
                                    height: 48.h,
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
                                    widget: Text('로그아웃 하시겠습니까?', style: TextStyle(color: Color(0xFF2C2C2C), fontSize: 15.sp, fontWeight: FontWeight.w500)),
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
                                  width: 56.w,
                                  height: 56.h,
                                  child: Container(
                                    margin: EdgeInsets.all(4.w),
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_logout.svg',
                                      width: 48.w,
                                      height: 48.h,
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// [buildSelectBsnsContainer] is a custom widget
  Widget buildSelectBsnsContainer() {
    return Container(
      height: 48.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() =>
          BsnsController.to.selectBsnsPlan.value.bsnsNo == null?
            Container(
              margin: EdgeInsets.only(left: 24.w),
              child: Text(
                '선택된 사업명이 없습니다.',
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 1.w > 1.h ? 32.sp : 22.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
            : Container(
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
                    CustomBsnsBadge(text: BsnsController.to.selectBsnsPlan.value.bsnsDivLclsCd ?? '', bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                    SizedBox(width: 6.w),
                    CustomBsnsBadge(text: BsnsController.to.selectBsnsPlan.value.bsnsDivMclsCd ?? '', bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                  ],
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Text(
                    BsnsController.to.selectBsnsPlan.value.bsnsNm ?? '',
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
          ),
        ],
      ),
    );
  }

}
