import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ldi/screens/np_controller.dart';

class NpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NpController>(() => NpController());
    Get.lazyPut<NpController>(() => NpController());
  }
}