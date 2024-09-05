import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bsns/lp_controller.dart';

class GisScreen extends StatefulWidget {
  const GisScreen({super.key});

  @override
  State<GisScreen> createState() => _GisScreenState();
}

class _GisScreenState extends State<GisScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse('http://222.107.22.159:18080/html/parcel.html')),
        onWebViewCreated: (controller) {
          LpController.to.inAppWebViewController = controller;
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
              userAgent:
                  'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Mobile Safari/537.36'),
          android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
              allowContentAccess: true,
              builtInZoomControls: true,
              thirdPartyCookiesEnabled: true,
              allowFileAccess: true,
              supportMultipleWindows: true),
        ),
      ),
    );
  }
}
