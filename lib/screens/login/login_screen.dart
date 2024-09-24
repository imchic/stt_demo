import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_textfield.dart';
import 'package:ldi/routes/app_route.dart';

import '../../utils/applog.dart';
import '../../utils/colors.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: 2560.w,
          height: 1600.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFDBF0FD)),
          child: Stack(
            children: [
              Positioned(
                left: 1520.w,
                top: 0,
                child: Container(
                  width: 1040.w,
                  height: 1600.h,
                  padding: EdgeInsets.only(top: 240.h, left: 160.w, right: 160.w),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120.r),
                        bottomLeft: Radius.circular(120.r),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19005097),
                        blurRadius: 60.r,
                        offset: Offset(-8.r, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 237.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 202.w,
                              height: 88.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: SvgPicture.asset(
                                'assets/icons/ic_login_kwater.svg',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            Container(
                              width: double.infinity,
                              height: 117.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: AutoSizeText(
                                      '현장조사 모바일',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 48.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        //height: 0.03,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  SizedBox(
                                    width: double.infinity,
                                    child: AutoSizeText(
                                      '회원서비스를 위해 로그인을 해주세요.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF555555),
                                        fontSize: 30.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        //height: 0.05,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 72.h),
                      Container(
                        width: double.infinity,
                        height: 776.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 80.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        //controller.loginType.value = LoginType.idPassword;
                                        controller.loginType.value = '토지보상';
                                        print(controller.loginType.value);
                                      },
                                      child: Obx(() =>
                                        Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: controller.loginType.value == '토지보상'
                                                ? Color(0xFF2287EF)
                                                : Color(0xFFF6F6F6),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                            border: Border.all(width: 2.w, color: controller.loginType.value == '토지보상'
                                                ? Color(0xFF2287EF)
                                                : Color(0xFF8E8E8E)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                '토지보상',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: controller.loginType.value == '토지보상'
                                                      ? Color(0xFFFFFFFF)
                                                      : Color(0xFF1D1D1D),
                                                  fontSize: 32.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: controller.loginType.value == '토지보상'
                                                      ? FontWeight.w700
                                                      : FontWeight.w500,
                                                  //height: 0.05,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        //controller.loginType.value = LoginType.onePass;
                                        controller.loginType.value = '국유재산';
                                        AppLog.d(controller.loginType.value);
                                      },
                                      child: Obx(() =>
                                        Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: controller.loginType.value == '국유재산'
                                                ? Color(0xFF2287EF)
                                                : Color(0xFFF6F6F6),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12.r),
                                              topRight: Radius.circular(12.r),
                                            ),
                                            border: Border.all(width: 2.w, color: Color(0xFF8E8E8E)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                '국유재산',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: controller.loginType.value == '국유재산'
                                                      ? Color(0xFFFFFFFF)
                                                      : Color(0xFF1D1D1D),
                                                  fontSize: 32.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: controller.loginType.value == '국유재산'
                                                      ? FontWeight.w700
                                                      : FontWeight.w500,
                                                  //height: 0.05,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 64.h),
                            Container(
                              width: 448.w,
                              decoration: ShapeDecoration(
                                color: Color(0xFFF6F6F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1998),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 72.h,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 2, color: Color(0xFF8E8E8E)),
                                          borderRadius: BorderRadius.circular(1998),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'ID/PW',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF1D1D1D),
                                              fontSize: 30.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              // height: 0.05,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 72.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F6F6),
                                        borderRadius: BorderRadius.circular(1998),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'One-Pass',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF555555),
                                              fontSize: 30.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              //height: 0.05,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 64.h),
                            Container(
                              width: double.infinity,
                              height: 496.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 270.h,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 196.h,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomTextField(hintText: '아이디(사번)',
                                                  controller: controller.idController,
                                                  prefixIcon: 'assets/icons/ic_account.svg', onChanged: (value) {
                                                //controller.id.value = value;
                                              }),
                                              SizedBox(height: 20.h),
                                              CustomTextField(hintText: '비밀번호',
                                                  controller: controller.pwController,
                                                  prefixIcon: 'assets/icons/ic_lock.svg', isPassword: true, onChanged: (value) {
                                                //controller.password.value = value;
                                              }),
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
                                                padding: EdgeInsets.all(4),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 2.w, color: Color(0xFF8E8E8E)),
                                                    borderRadius: BorderRadius.circular(8.r),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 16.w),
                                              AutoSizeText(
                                                '아이디 저장',
                                                style: TextStyle(
                                                  color: Color(0xFF1D1D1D),
                                                  fontSize: 28.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  //height: 0.05,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 64.h),
                                  Container(
                                    width: double.infinity,
                                    height: 162.h,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.login();
                                            if(controller.loginType.value == '토지보상') {
                                              Get.offNamed(AppRoute.lp);
                                            } else {
                                              Get.offNamed(AppRoute.np);
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 88.h,
                                            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF2287EF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.r),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  '로그인',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                    //height: 0.05,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 32.h),
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                '아이디 찾기',
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 28.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  //height: 0.05,
                                                ),
                                              ),
                                              SizedBox(width: 24.w),
                                              AutoSizeText(
                                                '|',
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 28.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  //height: 0.05,
                                                ),
                                              ),
                                              SizedBox(width: 24.w),
                                              AutoSizeText(
                                                '비밀번호 찾기',
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 28.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  //height: 0.05,
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 285.w,
                top: 292.h,
                child: Container(
                  width: 950.w,
                  height: 878.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/images/img_login_bg.png').image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 552.w,
                top: 1378.h,
                child: Container(
                  width: 616.w,
                  height: 38.h,
                  padding: EdgeInsets.only(right: 1.77.r),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 614.23.w,
                        height: 38.52.h,
                        child: Stack(
                          children: [
                            AutoSizeText(
                              'Korea Water Resources Corporation',
                              style: TextStyle(
                                color: Color(0xFF1D1D1D),
                                fontSize: 30.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                //height: 0.05,
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
      ),
    );
  }

}
