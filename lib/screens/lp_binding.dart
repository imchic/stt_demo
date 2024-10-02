import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ldi/screens/lp_controller.dart';

import 'login/login_controller.dart';

class LpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LpController>(() => LpController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}