import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {

  final Color? color;
  final String? text;
  final Color? textColor;
  Null Function()? onPressed;

  CustomButton({
    this.color,
    this.text,
    this.textColor,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.color ?? Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      child: AutoSizeText(
        widget.text ?? 'Button',
        style: TextStyle(
          color: widget.textColor ?? Colors.white,
          fontSize: 1.w > 1.h ? 30.sp : 50.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
