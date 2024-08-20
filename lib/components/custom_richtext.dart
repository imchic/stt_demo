import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class CustomRichText extends StatefulWidget {

  final int length;

  CustomRichText({required this.length});


  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '전체',
              style: TextStyle(
                color: tableTextColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: ' ${widget.length}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: '건',
              style: TextStyle(
                color: tableTextColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
