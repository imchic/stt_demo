import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

/// [CustomTextFiled] is a custom text field widget
class CustomTextFiled extends StatefulWidget {

  final TextEditingController controller;

  final String hintText;
  final bool isPassword;
  final bool isReadOnly;
  // onchange
  final Null Function(dynamic value) onChanged;
  Null Function()? onTap;

  CustomTextFiled({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.isReadOnly = false, required
    this.onChanged,
    this.onTap,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderLine),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintTextDirection: TextDirection.ltr,
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xff8E8E8E)),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          isDense: true,
          //contentPadding: EdgeInsets.all(12)
        ),
        onChanged: (value) {
          //print(value);
          widget.onChanged(value);
        },
        onTap: () {
          widget.onTap!();
        },
      ),
    );
  }
}
