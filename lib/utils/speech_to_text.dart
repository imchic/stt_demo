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
      onStatus: (status) {
        AppLog.d('onStatus: $status');
        if (status == stt.SpeechToText.listeningStatus) {
          DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 시작합니다.');
        }
      },
      onError: (errorNotification) {
        AppLog.e('onError: $errorNotification');
        DialogUtil.showSnackBar(Get.context!, '음성인식', '음성인식을 시작할 수 없습니다.');
      },
    );
  }

  start(TextEditingController? text) {
    speech.listen(
      onResult: (result) {
        text?.selection = TextSelection.collapsed(offset: text.text.length);
        text?.text = result.recognizedWords;
      },
      listenFor: Duration(seconds: 500),
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