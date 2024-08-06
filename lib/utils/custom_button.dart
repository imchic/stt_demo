import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {

  final Color? color;
  final String? text;

  CustomButton({
    this.color,
    this.text,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 36.h,
      decoration: ShapeDecoration(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(6.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Text(
            widget.text ?? '',
            style: TextStyle(
              color: Color(0xFF1D1D1D),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              // height: 0.09,
            ),
          ),
        ],
      ),
    );
  }
}
