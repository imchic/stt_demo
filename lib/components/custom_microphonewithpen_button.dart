import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ldi/utils/speech_to_text.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // button tap
        // ElevatedButton(
        //   onPressed: () {
        //     SpeechToText().init(widget.targetTextEditingController);
        //     if (!SpeechToText().speech.isListening) {
        //       SpeechToText().start(widget.targetTextEditingController);
        //     } else
        //     if (SpeechToText().speech.isListening) {
        //       SpeechToText().stop();
        //     }
        //   },
        //   style: ElevatedButton.styleFrom(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(6),
        //       side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
        //     ),
        //   ),
        //   child: SvgPicture.asset(
        //     'assets/icons/ic_microphone.svg',
        //   ),
        // ),

        GestureDetector(
          onTap: () {
            SpeechToText().init(widget.targetTextEditingController);
            if (!SpeechToText().speech.isListening) {
              SpeechToText().start(widget.targetTextEditingController);
            } else
            if (SpeechToText().speech.isListening) {
              SpeechToText().stop();
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
