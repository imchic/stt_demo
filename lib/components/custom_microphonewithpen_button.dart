import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomMicrophonewithpenButton extends StatefulWidget {

  CustomMicrophonewithpenButton();

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
              'assets/icons/ic_microphone.svg',
            )
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
