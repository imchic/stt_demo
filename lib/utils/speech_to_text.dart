import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ldm/screens/lp_controller.dart';
import 'package:ldm/utils/applog.dart';
import 'package:ldm/utils/dialog_util.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText {
  TextEditingController? targetTextEditingController;

  stt.SpeechToTextNotInitializedException? exception;
  stt.SpeechToText speech = stt.SpeechToText();

  SpeechToText({this.targetTextEditingController});

  init() {
    speech.initialize(
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

  start() {
    speech.listen(
      onResult: (result) {
        targetTextEditingController?.text = result.recognizedWords;
      },
      localeId: 'ko_KR',
    );
  }

  stop() {
    DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 종료합니다.');
    speech.stop();
  }

  cancel() {
    DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 취소합니다.');
    speech.cancel();
  }
}
