import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ldi/screens/gis/gis_controller.dart';
import 'package:location/location.dart';

import '../../utils/applog.dart';
import '../lp_controller.dart';

class GisScreen extends StatefulWidget {

  String? type;
  GisScreen({Key? key, this.type}) : super(key: key);


  @override
  State<GisScreen> createState() => _GisScreenState();
}

class _GisScreenState extends State<GisScreen> {
  @override
  Widget build(BuildContext context) {

      Get.put(GisController());
      Get.put(LpController());

      AppLog.d('GisScreen build ${widget.type}');

      return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(widget.type == 'parcel' ? 'http://222.107.22.159:18080/html/parcel.html' : 'http://222.107.22.159:18080/html/parcel.html')),
      // initialFile: 'assets/html/parcel.html',
      onWebViewCreated: (controller) async {
        LpController.to.inAppWebViewController = controller;

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

        GisController.to.latitude.value = _locationData.latitude ?? 0.0;
        GisController.to.longitude.value = _locationData.longitude ?? 0.0;

        //controller.evaluateJavascript(source: 'completeGetGps(${GisController.to.longitude.value}, ${GisController.to.latitude.value})');

        // 자바스크립트 함수 호출
        controller.addJavaScriptHandler(
            handlerName: 'callGps',
            callback: (arguments) {
              controller.evaluateJavascript(source: 'completeGetGps(${GisController.to.longitude.value}, ${GisController.to.latitude.value})');
              // AppLog.i('callJavaScript func: $arguments');
              // return controller.evaluateJavascript(source: 'completeGetGps(${GisController.to.longitude.value}, ${GisController.to.latitude.value})');
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
    );
  }
}
