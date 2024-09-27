import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../routes/app_route.dart';
import '../../utils/applog.dart';

class SplashController extends GetxController {

  static SplashController get to => Get.find<SplashController>();

  // init
  @override
  void onInit() {
    print('@@@@@@@@@');
    super.onInit();
  }

  // go to login screen
  goToLogin() async {
    AppLog.i('go to login');
    Get.offNamed(AppRoute.login);
  }

}