import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomRadio extends StatefulWidget {

  final int value;
  final int groupValue;
  final Null Function(dynamic value) onChanged;
  final String label;
  final TextStyle? labelStyle;

  CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.labelStyle,
  });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 1.w > 1.h ? 32.sp : 42.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 48.w,
            height: 48.w,
            child: Radio(
              value: widget.value,
              groupValue: widget.groupValue,
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
