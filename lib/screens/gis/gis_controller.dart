import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../utils/applog.dart';
import '../../utils/common_util.dart';
import '../lp_controller.dart';

class GisController extends GetxController {
  static GisController get to => Get.find<GisController>();

  late InAppWebViewController inAppWebViewController;
  late InAppWebView gisWebview;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  bool hasLoadedOnce = false; // 페이지가 한 번 로드되었는지 여부를 추적

  @override
  void onInit() {
    super.onInit();
    AppLog.d('gis controller init');
    gisWebview = InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse('${CommonUtil.BASE_URL}/html/parcel.html')),
        // initialUrlRequest: URLRequest(url: Uri.parse('https://naver.com')),
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          return ServerTrustAuthResponse(
              action: ServerTrustAuthResponseAction.PROCEED);
        },
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              javaScriptCanOpenWindowsAutomatically: true,
              javaScriptEnabled: true,
              useOnDownloadStart: true,
              useOnLoadResource: true,
              useShouldOverrideUrlLoading: true,
              mediaPlaybackRequiresUserGesture: true,
              allowFileAccessFromFileURLs: true,
              allowUniversalAccessFromFileURLs: true,
              verticalScrollBarEnabled: true,
              userAgent:
                  'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Mobile Safari/537.36'),
          android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
              allowContentAccess: true,
              builtInZoomControls: true,
              thirdPartyCookiesEnabled: true,
              allowFileAccess: true,
              supportMultipleWindows: true),

          // inappwebview javascript bridge
        ),
        onLoadStart: (controller, url) async {
          if (!hasLoadedOnce) {
            AppLog.d('onLoadStart 호출');

            // 앱에서 웹으로 데이터 전달
            Location location = new Location();

            bool _serviceEnabled;
            PermissionStatus _permissionGranted;
            LocationData _locationData;

            _serviceEnabled = await location.serviceEnabled();
            if (!_serviceEnabled) {
              _serviceEnabled = await location.requestService();
              if (!_serviceEnabled) {
                return;
              }
            }

            _permissionGranted = await location.hasPermission();
            if (_permissionGranted == PermissionStatus.denied) {
              _permissionGranted = await location.requestPermission();
              if (_permissionGranted != PermissionStatus.granted) {
                return;
              }
            }

            _locationData = await location.getLocation();
            AppLog.d('latitude: ${_locationData.latitude}, longitude: ${_locationData.longitude}');

            latitude.value = _locationData.latitude ?? 0.0;
            longitude.value = _locationData.longitude ?? 0.0;


            controller.addJavaScriptHandler(
                handlerName: 'callGps',
                callback: (arguments) {
                  AppLog.d('내 위치 정보 전달: ${longitude.value}, ${latitude.value}');
                  controller.evaluateJavascript(
                      source:
                          'completeGetGps(${longitude.value}, ${latitude.value})');
                  ;
                });

            controller.addJavaScriptHandler(
                handlerName: 'setBsnsInfo',
                callback: (arguments) {
                  controller.evaluateJavascript(
                      source:
                          'fn_setBsnsInfo({${LpController.to.selectBsnsPlan.value.bsnsNo}, ${LpController.to.selectSqnc.value.accdtInvstgSqnc}})');
                });

            controller.addJavaScriptHandler(
                handlerName: 'movePnu',
                callback: (arguments) {
                  controller.evaluateJavascript(source: 'fn_movePnu()');
                });

            hasLoadedOnce = true;
          }
        },
        onWebViewCreated: (webviewController) {
          AppLog.d('onWebViewCreated 호출');
          // 최초 1번만 호출
          inAppWebViewController = webviewController;
        });
  }

  @override
  void dispose() {
    super.dispose();
    inAppWebViewController.pauseTimers();
    AppLog.d('gis controller dispose');
  }
}
