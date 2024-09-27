import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ldi/screens/lp_controller.dart';
import 'package:ldi/utils/applog.dart';
import 'package:ldi/utils/dialog_util.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText {

  TextEditingController? targetTextEditingController;

  var speech = stt.SpeechToText();

  init(TextEditingController? text) {
    speech = stt.SpeechToText();
    speech.initialize(
      finalTimeout: Duration(seconds: 0),
      onStatus: (status) {
        // 중간 끊김 없이 진행
        status = stt.SpeechToText.listeningStatus;
        AppLog.e('onStatus: $status');
      },
      onError: (errorNotification) {
        AppLog.e('onError: $errorNotification');
      },
    );
  }

  start(TextEditingController? text) {
    speech.listen(
      listenFor: Duration(seconds: 30),
      pauseFor: Duration(seconds: 5),
      onResult: (result) {
        text?.text = result.recognizedWords;
        //DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 종료합니다.');
      },
      listenMode: stt.ListenMode.confirmation,
      localeId: 'ko_KR',
    );
  }

  stop() {
    DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 종료합니다.');
    speech.stop();
  }

  cancel() {
    speech.cancel();
    DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 취소합니다.');
  }



}