import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ldm/screens/gis/gis_controller.dart';
import 'package:ldm/screens/lp_controller.dart';

import 'login/login_controller.dart';

class LpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GisController>(() => GisController());
    Get.lazyPut<LpController>(() => LpController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}