import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

/// [CustomTextFiled] is a custom text field widget
class CustomTextFiled extends StatefulWidget {

  final TextEditingController? controller;

  final String hintText;
  final bool isPassword;
  final bool isReadOnly;
  final Null Function(dynamic value) onChanged;
  Null Function()? onTap;

  Color? backgroundColor;
  Color? textColor;

  CustomTextFiled({
    this.controller,
    required this.hintText,
    this.isPassword = false,
    this.isReadOnly = false, required
    this.onChanged,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w, bottom: 8.h),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderLine, width: 1.w),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          // fillColor: widget.backgroundColor,
          // filled: true,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xff8E8E8E)),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
        ),
        onChanged: (value) {
          //print(value);
          widget.onChanged(value);
        },
        onTap: () {
          widget.onTap!();
        },
        scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
    );
  }
}
