import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset('assets/images/ic_kwater_logo.svg', width: 100, height: 50, fit: BoxFit.contain)
            ),
          )
        ),
        Expanded(
          flex: 10,
          child: Container(
            width: Get.width * 0.8,
            child: _buildLoginBox(),
          )
        ),
        Expanded(
          flex: 1,
          child: _buildCopyRight(),
        ),
      ],
    );
  }

  Widget _buildLoginBox() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('현장조사 모바일', style:
            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(value: 0, groupValue: 0, onChanged: (value) {}),
                Text('토지보상', style: TextStyle(fontSize: 18)),
                Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                Text('현장조사자', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildIdField(),
          SizedBox(height: 10),
          _buildPasswordField(),
          SizedBox(height: 10),
          // 자동 로그인
          buildAutoLogin(),
          SizedBox(height: 10),
          _buildLoginButton(),
          SizedBox(height: 10),
          _buildBiometricButton(),
          SizedBox(height: 10),
          _buildFindIdPassword(),
        ],
      ),
    );
  }


  Widget buildAutoLogin() {
    return Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text('자동 로그인', style: TextStyle(fontSize: 18)),
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
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.grey[800],
        ),
        onPressed: () {
          controller.login();
        },
        child: Text('로그인', style: TextStyle(fontSize: 14, color: Colors.white))
      ),
    );
  }

  // 생체인증 버튼
  Widget _buildBiometricButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.grey[800],
        ),
        onPressed: () {
          controller.login();
        },
        child: Text('생체인증', style: TextStyle(fontSize: 14, color: Colors.white))
      ),
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
            child: Text('아이디 찾기', style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          ),
          Text('|', style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          TextButton(
            onPressed: () {},
            child: Text('비밀번호 찾기', style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  // 저작권
  Widget _buildCopyRight() {
    return Container(
      alignment: Alignment.center,
      child: Text('© 2021 DEBRIX. All rights reserved.', style: TextStyle(fontSize: 12, color: Colors.grey[800])),
    );
  }

}
