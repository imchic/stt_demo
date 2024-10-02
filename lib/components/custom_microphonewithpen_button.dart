import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ldi/utils/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../utils/applog.dart';

class CustomMicrophonewithpenButton extends StatefulWidget {

  TextEditingController? targetTextEditingController;

  CustomMicrophonewithpenButton(targetTextEditingController) {
    this.targetTextEditingController = targetTextEditingController;
  }

  @override
  State<CustomMicrophonewithpenButton> createState() => _CustomMicrophonewithpenButtonState();
}

class _CustomMicrophonewithpenButtonState extends State<CustomMicrophonewithpenButton> {
  @override
  Widget build(BuildContext context) {

    late SpeechToText speechToText;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {

            speechToText = SpeechToText(targetTextEditingController: widget.targetTextEditingController);

            if (speechToText.speech.isAvailable) {
              speechToText.start();
            } else {
              speechToText.exception = stt.SpeechToTextNotInitializedException();
              AppLog.e('SpeechToTextNotInitializedException : ${speechToText.exception}');
              speechToText.init();
            }

          },
          child: Container(
            width: 72.w,
            height: 72.h,
            padding: EdgeInsets.all(4),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_microphone.svg',
            ),
          ),
        ),

        SizedBox(width: 10.w),
        Container(
            width: 72.w,
            height: 72.h,
            padding: EdgeInsets.all(4),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_pen.svg',
            )
        ),
      ],
    );
  }
}
