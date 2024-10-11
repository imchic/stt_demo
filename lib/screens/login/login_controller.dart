import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:ldi/screens/login/user_model.dart';
import 'package:ldi/utils/dialog_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_route.dart';
import '../../utils/applog.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  static LoginController get to => Get.find();

  // methodChannel
  final MethodChannel methodChannel = MethodChannel('kr.or.kwater.ldm/sslvpn');

  final loginTypeTabItems = [Tab(text: '토지보상'), Tab(text: '국유재산')];
  final loginType = '토지보상'.obs;

  final txtId = ''.obs;
  final txtPw = ''.obs;

  RxBool isAutoLogin = false.obs;
  RxBool isSendOtp = false.obs;
  RxBool isVPNConnected = false.obs;

  late TabController loginTypeTabController;
  late TextEditingController idController;
  late TextEditingController pwController;

  Rx<UserModel> userModel = UserModel().obs;

  @override
  Future<void> onInit() async {
    loginTypeTabController =
        TabController(length: loginTypeTabItems.length, vsync: this);
    idController = TextEditingController();
    pwController = TextEditingController();
    super.onInit();

    methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'init') {
        AppLog.i('setMethodCallHandler > init : ${call.arguments}');
        methodChannel.invokeMethod('setVpnServer',
            ["https://vpn.kwater.or.kr", "t2783", "Kwater@3119"]);
      } else if (call.method == 'sendOtp') {
        AppLog.i('setMethodCallHandler > sendOtp : ${call.arguments}');
        if (call.arguments.contains('인증번호가 발송되었습니다.')) {
          isSendOtp.value = true;
          DialogUtil.showSnackBar(Get.context!, 'OTP 인증', 'OTP 인증번호가 발송되었습니다.');
        } else {
          //DialogUtil.showSnackBar(Get.context!, 'OTP 인증 실패', 'OTP 인증에 실패하였습니다. \n ${call.arguments}');
          // DialogUtil.showAlertDialog(Get.context!, 1000, 'OTP 인증 실패', onOk: () {
          //   Get.back();
          // }, onCancel: () {
          //   Get.back();
          // },
          //     widget: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         AutoSizeText('해당 계정을 더 이상 사용하실 수 없습니다.',
          //             style: TextStyle(
          //                 fontSize: 38.sp,
          //                 color: Colors.red,
          //                 fontWeight: FontWeight.bold)),
          //         SizedBox(height: 20.h),
          //         AutoSizeText('관리자에게 문의 바랍니다.',
          //             style: TextStyle(fontSize: 30.sp, color: Colors.black)),
          //         SizedBox(height: 10.h),
          //         AutoSizeText('* 사유 : 로그인 5회 실패 또는 장기 미사용 (전화 : 042-629-3119)',
          //             style: TextStyle(fontSize: 30.sp, color: Colors.black)),
          //       ],
          //     ));
        }
      } else if (call.method == 'vpnLogin') {
        AppLog.i('setMethodCallHandler > vpnLogin : ${call.arguments}');
        methodChannel.invokeMethod('vpnLogin', call.arguments);
        AppLog.i('isVPNConnected : ${isVPNConnected.value}');
      } else if (call.method == 'vpnLogout') {
        AppLog.i('setMethodCallHandler > vpnLogout');
        DialogUtil.showSnackBar(Get.context!, 'VPN 연결 해제', 'VPN 연결이 해제되었습니다.');
      } else if (call.method == 'vpnStatus') {
        AppLog.i('setMethodCallHandler > vpnStatus : ${call.arguments}');
        if (call.arguments == 'connected') {
          isVPNConnected.value = true;
          DialogUtil.showSnackBar(Get.context!, 'VPN 연결', 'VPN 연결에 성공하였습니다.');
        } else {
          isVPNConnected.value = false;
          DialogUtil.showSnackBar(
              Get.context!, 'VPN 연결 실패', 'VPN 연결에 실패하였습니다.');
        }
      }
    });

    await getAutoLogin();
  }

  saveAutoLogin(bool value) async {
    isAutoLogin.value = value;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAutoLogin', value);
    prefs.setString('usrId', idController.text);

    AppLog.i('saveAutoLogin > ${prefs.getString('usrId')}');
  }

  getAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isAutoLogin.value = prefs.getBool('isAutoLogin') ?? false;
    txtId.value = prefs.getString('usrId') ?? '';

    idController.text = txtId.value;
    AppLog.i('getAutoLogin > ${txtId.value}');
    AppLog.i('getAutoLogin > ${isAutoLogin.value}');
  }

  removeAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isAutoLogin');
    prefs.remove('usrId');
    AppLog.i('removeAutoLogin');
    isAutoLogin.value = false;
  }

  fetchLogin(usrId) async {
    var url = Uri.parse('http://222.107.22.159:18080/login/selectLoginUsr.do');

    var param = {
      'usrId': usrId,
    };

    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var response = await http
        .post(url, body: param)
        .timeout(Duration(seconds: 5), onTimeout: () {
      DialogUtil.showSnackBar(Get.context!, '서버 연결 실패', '서버 연결에 실패하였습니다.');
      Get.back();
      return http.Response('Error', 500);
    }).catchError((error) {
      DialogUtil.showSnackBar(Get.context!, '서버 연결 실패', '서버 연결에 실패하였습니다.');
      Get.back();
      return http.Response('Error', 500);
    }).whenComplete(() {
      Get.back();
    });

    AppLog.d('response : ${response.body}');

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];

      var length = data.length;
      var list = <UserModel>[];

      var user = userModelSourceKeyValue(data, list, length);
      userModel.value = user[0];
      AppLog.d('userModel : ${userModel.value.usrNm}');

      var sysGrpNm = user[0].sysGrpNm;
      AppLog.d('sysGrpNm : $sysGrpNm');

      if (sysGrpNm == loginType.value) {
        if (loginType.value == '토지보상') {
          Get.toNamed(AppRoute.lp, arguments: userModel.value);
        } else {
          Get.toNamed(AppRoute.np, arguments: userModel.value);
        }
      } else {
        // DialogUtil.showSnackBar(Get.context!, '로그인 실패', '로그인에 실패하였습니다.');
        // 권한 없음
        DialogUtil.showSnackBar(Get.context!, '로그인 실패',
            '사번 (${txtId.value})님은 ${loginType.value} 권한이 없습니다.');
      }
    } else {
      DialogUtil.showSnackBar(Get.context!, '로그인 실패', '로그인에 실패하였습니다.');
    }
  }
}
