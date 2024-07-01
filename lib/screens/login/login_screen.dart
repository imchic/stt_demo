import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/utils/colors.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Color(0xff005596),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/ic_kwater_logo.svg',
                  width: 100.w,
                  height: 60.h,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              SizedBox(height: 20.h),
              Text('현장조사 모바일', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SizedBox(
              child: _buildLoginBox(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(value: 0, groupValue: 0, onChanged: (value) {}),
                Text('토지보상', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
                Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                Text('현장조사자', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: SizedBox(
              width: Get.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIdField(),
                  SizedBox(height: 10.h),
                  _buildPasswordField(),
                  _buildAutoLogin(),
                  _buildLoginButton(),
                  SizedBox(height: 10.h),
                  _buildBiometricButton(),
                  SizedBox(height: 10.h),
                  _buildFindIdPassword(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildCopyRight(),
          ),
        ],
      ),
    );
  }

  Widget _buildAutoLogin() {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text('자동 로그인', style: TextStyle(fontSize: 10.sp, color: Colors.grey[800], fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildIdField() {
    return TextField(
      decoration: InputDecoration(
        labelText: '아이디',
        hintText: '아이디를 입력하세요',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            // clear text
            print('clear text');
          },
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      // password
      obscureText: true,
      // clear icon
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: '비밀번호',
        hintText: '비밀번호를 입력하세요',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        // red eyes
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
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
    );
  }

  Widget _buildLoginButton() {
    // round shape button
    return SizedBox(
      width: double.infinity,
      height: 80.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: Color(0xff005596),
            elevation: 0
          ),
          onPressed: () {
            controller.login();
          },
          child: Text('로그인',
              style: TextStyle(fontSize: 10.sp, color: Colors.white))),
    );
  }

  // 생체인증 버튼
  Widget _buildBiometricButton() {
    return SizedBox(
      width: double.infinity,
      height: 80.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: Color(0xfff8f8f8),
            elevation: 0
          ),
          onPressed: () {
            controller.login();
          },
          child: Text('모바일 생체인증',
              style: TextStyle(fontSize: 10.sp, color: gray600))),
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
                style: TextStyle(fontSize: 8.sp, color: Colors.grey[800])),
          ),
          Text('|', style: TextStyle(fontSize: 8.sp, color: Colors.grey[800])),
          TextButton(
            onPressed: () {},
            child: Text('비밀번호 찾기',
                style: TextStyle(fontSize: 8.sp, color: Colors.grey[800])),
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
          style: TextStyle(fontSize: 6.sp, color: Colors.grey[800])),
    );
  }
}
