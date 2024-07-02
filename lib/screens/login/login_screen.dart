import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/base_tabbar.dart';
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
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg_img.png',
                width: 1.sw,
                height: 1.sh,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: Get.width * 0.65,
            height: Get.height * 0.85,
            margin: EdgeInsets.only(top: 64.h, left: 308.w, right: 308.w),
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                // 로고
                Column(
                  children: [
                    SizedBox(
                      child: SvgPicture.asset('assets/images/ic_kwater_logo.svg',
                      ),
                    ),
                    Text('현장조사 모바일',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(height: 24.h),
                // 카드 뷰
                Expanded(
                  child: Container(
                    width: 408.w,
                    height: 366.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: _buildLoginBox(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBox() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              BaseTabBar(
                controller: controller.loginTypeTabController,
                tabItems: controller.loginTypeTabItems,
                activeColor: Colors.white,
                activeTextColor: Color(0xff1D1D1D),
                unActiveColor: Color(0xff00163D),
                unActiveTextColor: Colors.white,
              ),
              SizedBox(height: 10.h),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIdField(),
                        SizedBox(height: 10.h),
                        _buildPasswordField(),
                        SizedBox(height: 10.h),
                        _buildAutoLogin(),
                        SizedBox(height: 10.h),
                        _buildLoginButton(),
                        SizedBox(height: 10.h),
                        _buildFindIdPassword(),
                        SizedBox(height: 10.h),
                        _buildBiometricButton(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAutoLogin() {
    return Obx(() =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 체크박스
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              // vertical: VisualDensity.minimumDensity,
            ),
            value: controller.isAutoLogin.value,
            onChanged: (value) {
              controller.isAutoLogin.value = value!;
            },
            side: BorderSide(color: Color(0xffC6C6C6), width: 1.0),
            activeColor: Color(0xff005596),
          ),
          SizedBox(width: 10.w),
          Text('아이디 저장',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildIdField() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: '아이디',
          labelStyle: TextStyle(fontSize: 16.sp, color: Color(0xffC6C6C6)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC6C6C6),
            width: 1.0,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC6C6C6),
            width: 1.0,
          )),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC6C6C6),
            width: 1.0,
          )),
          focusColor: Color(0xffC6C6C6),
          prefixIcon: Icon(Icons.person_outline, color: Color(0xffC6C6C6)),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Color(0xffC6C6C6)),
            onPressed: () {
              // clear text
              print('clear text');
            },
          ),
        ),
      ),
    );
  }

  /// 비밀번호 입력 필드
  Widget _buildPasswordField() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        // password
        obscureText: true,
        // clear icon
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: '비밀번호',
          labelStyle: TextStyle(fontSize: 16.sp, color: Color(0xffC6C6C6)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC6C6C6),
            width: 1.0,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC6C6C6),
            width: 1.0,
          )),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffC6C6C6),
            width: 1.0,
          )),
          prefixIcon: Icon(Icons.lock_outline, color: Color(0xffC6C6C6)),
          // red eyes
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye, color: Color(0xffC6C6C6)),
            onPressed: () {
              // show password
              print('show password');
              // toggle icon
              // setState(() {
              //   _isObscure = !_isObscure;
              // });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    // round shape button
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              backgroundColor: Color(0xff246BEB),
              elevation: 0),
          onPressed: () {
            controller.login();
          },
          child: Text('로그인',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500))),
    );
  }

  // 생체인증 버튼
  Widget _buildBiometricButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              backgroundColor: Color(0xffF0F0F0),
              elevation: 0),
          onPressed: () {
            controller.login();
          },
          child: Text('모바일 생체인증',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: gray600,
                  fontWeight: FontWeight.w500))),
    );
  }

  // 아이디 찾기 | 비밀번호 찾기
  Widget _buildFindIdPassword() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text('아이디 찾기',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555))),
          ),
          Text('|',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff555555))),
          TextButton(
            onPressed: () {},
            child: Text('비밀번호 찾기',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555))),
          ),
        ],
      ),
    );
  }

  // 저작권
  Widget _buildCopyRight() {
    return Container(
      alignment: Alignment.center,
      child: Text('© 2024 DEBRIX. All rights reserved.',
          style: TextStyle(
              fontSize: 10.sp,
              color: Theme.of(Get.context!).colorScheme.onSurface)),
    );
  }
}
