import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ldi/screens/gis/gis_controller.dart';
import 'package:ldi/screens/lp_controller.dart';

class GisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LpController>(() => LpController());
    Get.lazyPut<GisController>(() => GisController());
  }
}