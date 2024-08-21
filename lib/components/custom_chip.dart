import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/utils/colors.dart';

class CustomChip extends StatefulWidget {

  final String? title;
  final bool? isSelected;
  Null Function()? onTap;

  @override
  State<CustomChip> createState() => _CustomChipState();

  CustomChip({this.title, this.isSelected, this.onTap});
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72.h,
        child: InkWell(
          onTap: widget.onTap,
          child: Chip(
            label: Text(
              widget.title ?? '',
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: widget.isSelected == true ? Color(0XFFE4E4E4) : Colors.white,
            labelStyle: TextStyle(color: Colors.white),
            side: BorderSide(width: 1.w, color: borderLine),
          ),
        ));
  }
}
