import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class GisController extends GetxController {
  static GisController get to => Get.find<GisController>();

  late InAppWebViewController inAppWebViewController;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}