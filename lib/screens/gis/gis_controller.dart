import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GisController extends GetxController {
  static GisController get to => Get.find<GisController>();

  late WebViewController webViewController;

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
    //..loadFile(Uri.file('assets/html/parcel.html').toString())
      ..loadRequest(Uri.parse('http://222.107.22.159:18080/html/parcel.html'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
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