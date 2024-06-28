import 'package:get/get.dart';
import 'package:stt_demo/routes/app_route.dart';

class LoginController extends GetxController {

  void login() {
    Get.offAllNamed(AppRoute.bsnsSelect);
  }

}