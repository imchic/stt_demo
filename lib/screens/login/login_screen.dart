
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldm/components/custom_textfield.dart';
import 'package:ldm/utils/dialog_util.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../utils/applog.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    DateTime currentTime = DateTime.now();
    DateTime? currentBackPressTime;

    Get.put(LoginController());
    return Scaffold(
      // 키보드 올라올 때 화면 resize
      resizeToAvoidBottomInset: true,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (result, data) {
          if(currentBackPressTime == null || currentTime.difference(currentBackPressTime!) > Duration(seconds: 2)) {
            currentBackPressTime = currentTime;
            DialogUtil.showSnackBar(context, '앱 종료', '한번 더 누르면 앱이 종료됩니다.');
          } else {
            controller.methodChannel.invokeMethod('vpnLogout');
            SystemNavigator.pop();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
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
                                  // height: 117.h,
                                  child:
                                    Column(
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
                                        SizedBox(height: 32.h),
                                        Container(
                                          width: double.infinity,
                                          child: Obx(() =>
                                            Column(
                                              children: [
                                                Obx(() =>
                                                  AutoSizeText(
                                                    controller.vpnBindStatus.value,
                                                    style: TextStyle(
                                                      color: Color(0xFFEC26E9),
                                                      fontSize: 20.sp,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight: FontWeight.w500,
                                                      //height: 0.05,
                                                    ),
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  controller.vpnInfo.value,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isVPNConnected.value
                                                        ? Color(0xFF0EB608)
                                                        : Color(0xFFD30505),
                                                    fontSize: 20.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                    //height: 0.05,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  controller.vpnStr.value,
                                                  style: TextStyle(
                                                    color: controller
                                                        .isVPNConnected.value
                                                        ? Color(0xFF0EB608)
                                                        : Color(0xFFD30505),
                                                    fontSize: 20.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                    //height: 0.05,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1000.h,
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
                                  height: 90.h,
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
                                                border: Border(
                                                  left: BorderSide(color: Color(0xFF2287EF)),
                                                  top: BorderSide(color: Color(0xFF2287EF)),
                                                  right: BorderSide(color: Color(0xFF2287EF)),
                                                  bottom: BorderSide(width: 2.w, color: Color(0xFF2287EF)),
                                                ),
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
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
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
                                      /*Expanded(
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
                                      ),*/
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
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
                                SizedBox(height: 42.h),
                                Container(
                                  width: double.infinity,
                                  child: Obx(() =>
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          //height: 196.h,
                                          child:
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomTextField(hintText: 'VPN(ID)',
                                                    controller: controller.vpnIdController,
                                                    prefixIcon: 'assets/icons/ic_account.svg', onChanged: (value) {
                                                      controller.vpnId.value = value;
                                                      AppLog.d(controller.vpnId.value);
                                                    }),
                                                SizedBox(height: 20.h),
                                                CustomTextField(hintText: 'VPN(비밀번호)',
                                                    controller: controller.vpnPwController,
                                                    isPassword: true,
                                                    prefixIcon: 'assets/icons/ic_lock.svg', onChanged: (value) {
                                                      controller.vpnPw.value = value;
                                                      AppLog.d(controller.vpnPw.value);
                                                    }),
                                                SizedBox(height: 20.h),
                                                CustomTextField(hintText: '아이디(사번)',
                                                    controller: controller.idController,
                                                    prefixIcon: 'assets/icons/ic_account.svg', onChanged: (value) {
                                                      controller.txtId.value = value;
                                                      AppLog.d(controller.txtId.value);
                                                }),
                                                SizedBox(height: 20.h),
                                                !controller.isSendOtp.value ? Container() : Obx(() =>
                                                        PinFieldAutoFill(
                                                          decoration: BoxLooseDecoration(
                                                            strokeColorBuilder: PinListenColorBuilder(Colors.black, Colors.black26),
                                                            bgColorBuilder: const FixedColorBuilder(Colors.white),
                                                            strokeWidth: 1.w,
                                                          ),
                                                          //autoFocus: true,
                                                          //cursor: Cursor(color: Colors.red, enabled: true, width: 1.w),
                                                          currentCode: controller.optCode.value,
                                                          onCodeSubmitted: (code) {
                                                            AppLog.i('otp code submit : $code');
                                                            controller.methodChannel.invokeMethod('vpnLogin', code);
                                                          },
                                                          codeLength: 6,
                                                          onCodeChanged: (code) {
                                                            controller.optCode.value = code ?? '';
                                                            AppLog.i('otp code changed : $code');
                                                            if (code?.length == 6) {
                                                              controller.methodChannel.invokeMethod('vpnLogin', code);
                                                              Get.back();
                                                            } else {
                                                              //controller.isSendOtp.value = false;
                                                            }
                                                          },
                                                  // TextFieldPinAutoFill(
                                                  //   autoFocus: true,
                                                  //   currentCode: controller.optCode.value,
                                                  //   onCodeSubmitted: (code) {},
                                                  //   onCodeChanged: (code) {
                                                  //     controller.optCode.value = code;
                                                  //     if (code!.length == 6) {
                                                  //       FocusScope.of(context).requestFocus(FocusNode());
                                                  //       AppLog.i('otp code changed : $code');
                                                  //     }
                                                  //   },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        SizedBox(height: 32.h),
                                        controller.isVPNConnected.value ? Container(
                                          width: double.infinity,
                                          // height: 162.h,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.methodChannel.invokeMethod('vpnLogout');
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 88.h,
                                                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black,
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
                                                        'VPN 로그아웃',
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
                                              SizedBox(height: 10.h),
                                              InkWell(
                                                onTap: () {
                                                  AppLog.d('txtId: ${controller.txtId.value}');
                                                  controller.fetchLogin(controller.txtId.value);
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
                                            ],
                                          ),
                                        ) : Container(
                                          width: double.infinity,
                                          // height: 162.h,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {

                                                  AppLog.d('loginType: ${controller.loginType.value}');
                                                  // controller.fetchLogin(controller.txtId.value);

                                                  controller.isVPNConnected.value == true ? controller.fetchLogin(controller.txtId.value)
                                                      : controller.methodChannel.invokeMethod('setVpnServer', ['https://vpn.kwater.or.kr', controller.vpnId.value, controller.vpnPw.value]);

                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 88.h,
                                                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF667185),
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
                                                        'OTP 인증',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 30.sp,
                                                          fontFamily: 'Pretendard',
                                                          fontWeight: FontWeight.w500,
                                                          //height: 0.05,
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      SvgPicture.asset(
                                                        'assets/icons/ic_otp.svg',
                                                        width: 32.w,
                                                        height: 32.h,
                                                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 32.h),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              // 아이디 저장 체크박스
                                              Obx(() =>
                                                  Container(
                                                    width: 32.w,
                                                    height: 32.h,
                                                    child: Checkbox(
                                                      value: controller.isAutoLogin.value,
                                                      onChanged: (value) {
                                                        controller.isAutoLogin.value = value!;
                                                        if (controller.isAutoLogin.value) {
                                                          controller.saveAutoLogin(controller.isAutoLogin.value);
                                                        } else {
                                                          controller.removeAutoLogin();
                                                          DialogUtil.showSnackBar(context, '아이디저장', '아이디 저장이 해제되었습니다.');
                                                        }
                                                      },
                                                      activeColor: Color(0xFF2287EF),
                                                      checkColor: Colors.white,
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
                                              SizedBox(width: 16.w),
                                              AutoSizeText(
                                                '(ID는 사번입니다.)',
                                                style: TextStyle(
                                                  color: Color(0xFF2287EF),
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
        ),
      ),
    );
  }

}
