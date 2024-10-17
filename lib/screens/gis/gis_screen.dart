import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/screens/gis/gis_controller.dart';
import 'package:ldi/screens/lp_controller.dart';
import 'package:location/location.dart';

import '../../utils/applog.dart';

class GisScreen extends GetView<GisController> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 0.0.h, bottom: 0.0.h, left: 0.0.w, right: 80.0.w),
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('https://dldm.kwater.or.kr/html/parcel.html')),
        // initialFile: 'assets/html/parcel.html',
        onWebViewCreated: (webviewController) async {
          controller.inAppWebViewController = webviewController;
          AppLog.d('onWebViewCreated');

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

         controller.latitude.value = _locationData.latitude ?? 0.0;
         controller.longitude.value = _locationData.longitude ?? 0.0;

         //webviewController.evaluateJavascript(source: 'completeGetGps("127.4254, 36.3540")');

          // 자바스크립트 함수 호출
          webviewController.addJavaScriptHandler(
              handlerName: 'callGps',
              callback: (arguments) {
                AppLog.d('내 위치 정보 전달: ${controller.longitude.value}, ${controller.latitude.value}');
                webviewController.evaluateJavascript(source: 'completeGetGps(${controller.longitude.value}, ${controller.latitude.value})');;
              });

          webviewController.addJavaScriptHandler(
              handlerName: 'setBsnsInfo',
              callback: (arguments) {
                webviewController.evaluateJavascript(source: 'fn_setBsnsInfo({${LpController.to.selectBsnsPlan.value.bsnsNo}, ${LpController.to.selectSqnc.value.accdtInvstgSqnc}})');
              });

          webviewController.addJavaScriptHandler(
              handlerName: 'movePnu',
              callback: (arguments) {
                webviewController.evaluateJavascript(source: 'fn_movePnu()');
              });

        },
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
              userAgent: 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Mobile Safari/537.36'
          ),
          android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
              allowContentAccess: true,
              builtInZoomControls: true,
              thirdPartyCookiesEnabled: true,
              allowFileAccess: true,
              supportMultipleWindows: true
          ),

          // inappwebview javascript bridge



        ),
      ),
    );
  }

}
