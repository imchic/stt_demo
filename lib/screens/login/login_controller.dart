import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stt_demo/routes/app_route.dart';

class LoginController extends GetxController
    with GetTickerProviderStateMixin {

  static LoginController get to => Get.find();

  final loginTypeTabItems = [Tab(text: '토지보상'), Tab(text: '국유재산')];

  late TabController loginTypeTabController;
  RxBool isAutoLogin = false.obs;

  @override
  void onInit() {
    loginTypeTabController = TabController(length: loginTypeTabItems.length, vsync: this);
    super.onInit();
  }


  void login() {
    Get.offAllNamed(AppRoute.bsnsSelect);
  }

}