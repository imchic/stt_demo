import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

/// [CustomTextField] is a custom text field widget
class CustomTextField extends StatelessWidget {

  final TextEditingController? controller;

  final String hintText;
  final bool isPassword;
  final bool isReadOnly;
  final bool isDateTime;
  final String prefixIcon;
  final Null Function(dynamic value) onChanged;
  Null Function()? onTap;

  Color? backgroundColor;
  Color? textColor;

  CustomTextField({
    this.controller,
    required this.hintText,
    this.isDateTime = false,
    this.prefixIcon = '',
    this.isPassword = false,
    this.isReadOnly = false, required
    this.onChanged,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  1.w > 1.h ? 72.h : 52.h,
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderLine, width: 1.w),
      ),
      child: TextField(
        controller: controller,
        readOnly: isDateTime ? true : isReadOnly,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: isDateTime ? 'YYYY-MM-DD' : hintText,
          hintStyle: TextStyle(fontSize: 1.w > 1.h ? 32.sp : 40.sp, fontWeight: FontWeight.w400, color: Color(0xff8E8E8E)),
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixStyle: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w400, color: Color(0xff8E8E8E)),
          suffixIconColor: Color(0xff8E8E8E),
          suffixIcon: isDateTime ? SvgPicture.asset('assets/icons/ic_calendar.svg', height: 32.h, width: 32.w) : null,
          prefixIcon: prefixIcon.isNotEmpty ? SvgPicture.asset(prefixIcon, height: 24.h, width: 24.w) : null,
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.h),
        onChanged: (value) {
          //AppLog.d(value);
          onChanged(value);
        },
        onTap: () {
          isDateTime ? showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          ) :
          onTap!();
        },
        scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //style: widget.isReadOnly ? TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xff8E8E8E)) : TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: widget.textColor ?? Colors.black),
      ),
    );
  }
}
