import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  final Color? color;
  final String? text;
  final Color? textColor;
  Null Function()? onPressed;
  final SvgPicture? prefixIcon;

  CustomButton({
    this.color,
    this.text,
    this.textColor,
    this.onPressed,
    this.prefixIcon,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();

  refreshButton() {
    return Container(
      height: 1.w > 1.h ? 72.h : 52.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.w, color: Color(0xFFD8D8D8)),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            child: SvgPicture.asset(
              'assets/icons/ic_refresh.svg',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 1.w > 1.h ? 72.h : 52.h,
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(widget.color ?? Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        child: widget.prefixIcon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.prefixIcon!,
                  SizedBox(width: 8.w),
                  AutoSizeText(
                    widget.text ?? 'Button',
                    style: TextStyle(
                      color: widget.textColor ?? Colors.white,
                      fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            :
        AutoSizeText(
          widget.text ?? 'Button',
          style: TextStyle(
            color: widget.textColor ?? Colors.white,
            fontSize: 1.w > 1.h ? 30.sp : 50.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

}
