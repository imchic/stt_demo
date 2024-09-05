import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_route.dart';

class LoginController extends GetxController
    with GetTickerProviderStateMixin {

  static LoginController get to => Get.find();

  final loginTypeTabItems = [Tab(text: '토지보상'), Tab(text: '국유재산')];

  final loginType = '토지보상'.obs;

  late TabController loginTypeTabController;
  RxBool isAutoLogin = false.obs;

  late TextEditingController idController;
  late TextEditingController pwController;

  @override
  void onInit() {
    loginTypeTabController = TabController(length: loginTypeTabItems.length, vsync: this);
    idController = TextEditingController();
    pwController = TextEditingController();
    super.onInit();
  }


  void login() {
    Get.offAllNamed(AppRoute.lp);
  }

}