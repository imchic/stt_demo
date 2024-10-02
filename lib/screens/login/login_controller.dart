import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:ldi/screens/login/user_model.dart';
import 'package:ldi/utils/dialog_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_route.dart';
import '../../utils/applog.dart';

class LoginController extends GetxController
    with GetTickerProviderStateMixin {

  static LoginController get to => Get.find();

  final loginTypeTabItems = [Tab(text: '토지보상'), Tab(text: '국유재산')];

  final loginType = '토지보상'.obs;

  final txtId = ''.obs;
  final txtPw = ''.obs;

  late TabController loginTypeTabController;
  RxBool isAutoLogin = false.obs;

  late TextEditingController idController;
  late TextEditingController pwController;

  Rx<UserModel> userModel = UserModel().obs;

  @override
  Future<void> onInit() async {
    loginTypeTabController = TabController(length: loginTypeTabItems.length, vsync: this);
    idController = TextEditingController();
    pwController = TextEditingController();
    super.onInit();

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
    var url = Uri.parse(
        'http://222.107.22.159:18080/login/selectLoginUsr.do');

    var param = {
      'usrId' : usrId,
    };

    var response = await http.post(url, body: param);
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

      if(sysGrpNm == loginType.value) {
        if(loginType.value == '토지보상') {
          Get.toNamed(AppRoute.lp, arguments: userModel.value);
        } else {
          Get.toNamed(AppRoute.np, arguments: userModel.value);
        }
      } else {
        DialogUtil.showSnackBar(Get.context!, '로그인 실패', '로그인에 실패하였습니다.');
      }

    } else {
      DialogUtil.showSnackBar(Get.context!, '로그인 실패', '로그인에 실패하였습니다.');
    }
  }

}