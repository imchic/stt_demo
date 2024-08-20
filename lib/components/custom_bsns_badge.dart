import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBsnsBadge extends StatefulWidget {

  final String? text;
  final Color? bgColor;
  final Color? textColor;

  CustomBsnsBadge({this.text, this.bgColor, this.textColor});

  @override
  State<CustomBsnsBadge> createState() => _CustomBsnsBadgeState();
}

class _CustomBsnsBadgeState extends State<CustomBsnsBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: ShapeDecoration(
        //color: Color(0xFFEFF5FF),
        color: widget.bgColor ?? Color(0xFF1D58BC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      //child: Text('댐', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF1D58BC), fontSize: 13.sp, fontWeight: FontWeight.w500,)),
      child: Text(widget.text ?? '', textAlign: TextAlign.center, style: TextStyle(color: widget.textColor,
        fontSize: 1.w > 1.h ? 28.sp : 16.sp,
        fontWeight: FontWeight.w500,)),
    );
  }
}
