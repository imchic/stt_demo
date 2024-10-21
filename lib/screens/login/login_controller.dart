import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:ldm/screens/login/user_model.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:ldm/utils/dialog_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../routes/app_route.dart';
import '../../utils/applog.dart';

class LoginController extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver, CodeAutoFill {
  static LoginController get to => Get.find();

  // methodChannel
  final MethodChannel methodChannel = MethodChannel('kr.or.kwater.ldm/sslvpn');

  final loginTypeTabItems = [Tab(text: '토지보상'), Tab(text: '국유재산')];
  final loginType = '토지보상'.obs;

  final txtId = ''.obs;
  final txtPw = ''.obs;

  final vpnId = ''.obs;
  final vpnPw = ''.obs;

  RxBool isAutoLogin = false.obs;
  RxBool isSendOtp = false.obs;
  RxBool isVPNConnected = false.obs;

  RxString vpnBindStatus = ''.obs;
  RxString vpnInfo = ''.obs;
  RxString vpnStr = ''.obs;
  RxString optCode = ''.obs;

  late TabController loginTypeTabController;

  late TextEditingController vpnIdController;
  late TextEditingController vpnPwController;

  late TextEditingController idController;
  late TextEditingController pwController;

  Rx<UserModel> userModel = UserModel().obs;

  @override
  onInit() async {
    super.onInit();
    AppLog.i('onInit');

    WidgetsBinding.instance!.addObserver(this);
    loginTypeTabController =
        TabController(length: loginTypeTabItems.length, vsync: this);

    vpnIdController = TextEditingController();
    vpnPwController = TextEditingController();
    idController = TextEditingController();
    pwController = TextEditingController();

    var signature = await SmsAutoFill().getAppSignature;
    AppLog.i('signature : $signature');

    SmsAutoFill().listenForCode;

    methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'init') {
        AppLog.i('setMethodCallHandler > init : ${call.arguments}');
        methodChannel.invokeMethod('init', call.arguments);
      } else if (call.method == 'bindStatus') {
        AppLog.i('setMethodCallHandler > bindStatus : ${call.arguments}');
        Future.delayed(Duration(seconds: 1), () {
          //vpnBindStatus.value = call.arguments.toString();
          if (call.arguments == true) {
            vpnBindStatus.value = 'VPN 바인딩 ON';
          } else {
            vpnBindStatus.value = 'VPN 바인딩 OFF';
          }
        });
      } else if (call.method == 'setVPN') {
        AppLog.i('setMethodCallHandler > setVPN : ${call.arguments}');
        vpnInfo.value = call.arguments;
      } else if (call.method == 'checkVpnStatus') {
        AppLog.i('setMethodCallHandler > checkVpnStatus : ${call.arguments}');

        Future.delayed(Duration(seconds: 1), () {
          if (call.arguments == 1) {
            //vpnStr.value = 'VPN 연결됨';
            isVPNConnected.value = true;
          } else if (call.arguments == 0) {
            //vpnStr.value = 'VPN 연결안됨';
            isVPNConnected.value = false;
          } else if (call.arguments == 2) {
            //vpnStr.value = 'VPN 연결중';
            isVPNConnected.value = false;
          }
        });
      } else if (call.method == 'sendOtp') {
        AppLog.i('setMethodCallHandler > sendOtp : ${call.arguments}');
        vpnStr.value = call.arguments;
        if (call.arguments.contains('인증번호가 발송되었습니다.')) {
          isSendOtp.value = true;

          // _smsReceiver = SmsReceiver(onSmsReceived, onTimeout: onTimeout);
          // _startListening();

          listenForCode();

          DialogUtil.showSnackBar(Get.context!, 'OTP 인증', 'OTP 인증번호가 발송되었습니다.');

          // Get.defaultDialog(
          //   title: 'OTP 인증',
          //   content: Column(
          //     children: [
          //       Text('OTP 인증번호가 발송되었습니다.'),
          //       Obx(() =>
          //         PinFieldAutoFill(
          //           decoration: BoxLooseDecoration(
          //             strokeColorBuilder: PinListenColorBuilder(Colors.black, Colors.black26),
          //             bgColorBuilder: const FixedColorBuilder(Colors.white),
          //             strokeWidth: 1.w,
          //           ),
          //           autoFocus: true,
          //           cursor: Cursor(color: Colors.red, enabled: true, width: 1.w),
          //           currentCode: optCode.value,
          //           onCodeSubmitted: (code) {
          //             AppLog.i('otp code submit : $code');
          //             methodChannel.invokeMethod('vpnLogin', code);
          //           },
          //           codeLength: 6,
          //           onCodeChanged: (code) {
          //             AppLog.i('otp code changed : $code');
          //             if (code?.length == 6) {
          //               methodChannel.invokeMethod('vpnLogin', code);
          //               Get.back();
          //             } else {
          //               isSendOtp.value = false;
          //             }
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        } else {
          isSendOtp.value = false;
          DialogUtil.showSnackBar(
              Get.context!, 'OTP 인증 실패', 'OTP 인증번호 발송에 실패하였습니다.');
        }
      } else if (call.method == 'vpnLogin') {
        AppLog.i('setMethodCallHandler > vpnLogin : ${call.arguments}');
        methodChannel.invokeMethod('vpnLogin', call.arguments);
        AppLog.i('isVPNConnected : ${isVPNConnected.value}');
      } else if (call.method == 'vpnLogout') {
        AppLog.i('setMethodCallHandler > vpnLogout');
        isVPNConnected.value = false;
        isSendOtp.value = false;
        DialogUtil.showSnackBar(Get.context!, 'VPN 연결 해제', 'VPN 연결이 해제되었습니다.');
      } else if (call.method == 'vpnStatus') {
        AppLog.i('setMethodCallHandler > vpnStatus : ${call.arguments}');
        AppLog.i('vpnStatus : ${call.arguments}');

        vpnStr.value = call.arguments;

        if (call.arguments == 'connected') {
          isVPNConnected.value = true;
          isSendOtp.value = false;
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

  @override
  void codeUpdated() {
    optCode.value = code ?? '';
    AppLog.i('codeUpdated : $code');
  }

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  saveAutoLogin(bool value) async {
    isAutoLogin.value = value;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAutoLogin', value);
    prefs.setString('usrId', idController.text);
    prefs.setString('vpnId', vpnIdController.text);
    prefs.setString('vpnPw', vpnPwController.text);

    AppLog.i('saveAutoLogin > ${prefs.getString('usrId')}');
    AppLog.i('saveAutoLogin > ${prefs.getString('vpnId')}');
    AppLog.i('saveAutoLogin > ${prefs.getString('vpnPw')}');
  }

  getAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isAutoLogin.value = prefs.getBool('isAutoLogin') ?? false;

    txtId.value = prefs.getString('usrId') ?? '';
    vpnId.value = prefs.getString('vpnId') ?? '';
    vpnPw.value = prefs.getString('vpnPw') ?? '';

    idController.text = txtId.value;
    vpnIdController.text = vpnId.value;
    vpnPwController.text = vpnPw.value;

    AppLog.i('getAutoLogin > ${txtId.value}');
    AppLog.i('getAutoLogin > ${vpnId.value}');
    AppLog.i('getAutoLogin > ${vpnPw.value}');

    AppLog.i('getAutoLogin > ${isAutoLogin.value}');
  }

  removeAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isAutoLogin');
    prefs.remove('usrId');
    prefs.remove('vpnId');
    prefs.remove('vpnPw');
    AppLog.i('removeAutoLogin');
    isAutoLogin.value = false;
  }

  fetchLogin(usrId) async {
    var url = Uri.parse('${CommonUtil.BASE_URL}/login/selectLoginUsr.do');

    var param = {
      'usrId': usrId,
    };

    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var response = await http
        .post(url, body: param)
        .timeout(Duration(seconds: 5), onTimeout: () {
      AppLog.e('fetchLogin > timeout');
      Get.back();
      return http.Response('Error', 500);
    }).catchError((error) {
      AppLog.e('fetchLogin > error : $error');
      DialogUtil.warningSnackBar(Get.context!, '로그인 실패', '로그인에 실패하였습니다. $error');
      // Get.back();
      return http.Response('Error', 500);
    }).whenComplete(() {
      AppLog.i('fetchLogin > whenComplete');
      Get.back();
    });

    AppLog.d('response login controller : ${response.body}');

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];

      var length = data.length;
      var list = <UserModel>[];

      var user = userModelSourceKeyValue(data, list, length);
      userModel.value = user[0];
      AppLog.d('userModel : ${userModel.value.usrNm}');

      var sysGrpNm = user[0].sysGrpNm;
      AppLog.d('sysGrpNm : $sysGrpNm');

      if (sysGrpNm == loginType.value || sysGrpNm.contains('관리자')) {
        if (loginType.value == '토지보상') {
          Get.toNamed(AppRoute.lp, arguments: userModel.value);
        } else if (loginType.value == '국유재산') {
          Get.toNamed(AppRoute.np, arguments: userModel.value);
        }

        saveAutoLogin(isAutoLogin.value);
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
