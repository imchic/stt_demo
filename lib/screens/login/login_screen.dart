import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
                                    child: Text(
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
                                    child: Text(
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
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2287EF),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '토지보상',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                              //height: 0.05,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F6F6),
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
                                          Text(
                                            '국유재산',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF1D1D1D),
                                              fontSize: 32.sp,
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
                                          Text(
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
                                          Text(
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
                                              Container(
                                                width: double.infinity,
                                                height: 88.h,
                                                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 2, color: Color(0xFFD8D8D8)),
                                                    borderRadius: BorderRadius.circular(12.r),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40.w,
                                                      height: 40.h,
                                                      child: SvgPicture.asset(
                                                        'assets/icons/ic_account.svg',
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.w),
                                                    Expanded(
                                                      child: SizedBox(
                                                        child: Text(
                                                          '아이디(사번)',
                                                          style: TextStyle(
                                                            color: Color(0xFF8E8E8E),
                                                            fontSize: 30.sp,
                                                            fontFamily: 'Pretendard',
                                                            fontWeight: FontWeight.w400,
                                                            //height: 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 20.h),
                                              Container(
                                                width: double.infinity,
                                                height: 88.h,
                                                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 2.w, color: Color(0xFFD8D8D8)),
                                                    borderRadius: BorderRadius.circular(12.r),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40.w,
                                                      height: 40.h,
                                                      child: SvgPicture.asset(
                                                        'assets/icons/ic_lock.svg',
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.w),
                                                    Expanded(
                                                      child: SizedBox(
                                                        child: Text(
                                                          '비밀번호',
                                                          style: TextStyle(
                                                            color: Color(0xFF8E8E8E),
                                                            fontSize: 30.sp,
                                                            fontFamily: 'Pretendard',
                                                            fontWeight: FontWeight.w400,
                                                            //height: 0.05,
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
                                              Text(
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
                                                Text(
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
                                              Text(
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
                                              Transform(
                                                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                                child: Container(
                                                  width: 28.w,
                                                  decoration: ShapeDecoration(
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 2.w,
                                                        strokeAlign: BorderSide.strokeAlignCenter,
                                                        color: Color(0xFFD8D8D8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 24.w),
                                              Text(
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
                            Text(
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

  Widget _buildLoginBox() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff00163D),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: TabBar(
            controller: controller.loginTypeTabController,
            tabs: controller.loginTypeTabItems,
            labelColor: tableTextColor,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: Color(0xFFFFFFFF)
            ),
            indicatorPadding: EdgeInsets.zero,
            indicatorWeight: 0,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 1.w > 1.h ? 16.sp : 24.sp,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 1.w > 1.h ? 16.sp : 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
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
        ),
      ],
    );
  }

  Widget _buildAutoLogin() {
    return Obx(
      () => Row(
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
                  fontSize: 1.w > 1.h ? 14.sp : 20.sp,
                  color: Theme.of(Get.context!).colorScheme.onSurface,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildIdField() {
    return Container(
      height: 1.w > 1.h ? 48.h : 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: '아이디',
          labelStyle: TextStyle(fontSize: 1.w > 1.h ? 16.sp : 24.sp,
              color: Color(0xffC6C6C6)),
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
              debugPrint('clear text');
            },
          ),
        ),
      ),
    );
  }

  /// 비밀번호 입력 필드
  Widget _buildPasswordField() {
    return Container(
      height: 1.w > 1.h ? 48.h : 30.h,
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
          labelStyle: TextStyle(fontSize: 1.w > 1.h ? 16.sp : 24.sp,
              color: Color(0xffC6C6C6)),
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
              debugPrint('show password');
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
      height: 1.w > 1.h ? 50.h : 30.h,
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
                  fontSize: 1.w > 1.h ? 16.sp : 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500))),
    );
  }

  // 생체인증 버튼
  Widget _buildBiometricButton() {
    return SizedBox(
      width: double.infinity,
      height: 1.w > 1.h ? 50.h : 30.h,
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
                  fontSize: 1.w > 1.h ? 16.sp : 24.sp,
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
                    fontSize: 1.w > 1.h ? 14.sp : 20.sp,
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
                    fontSize: 1.w > 1.h ? 14.sp : 20.sp,
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
