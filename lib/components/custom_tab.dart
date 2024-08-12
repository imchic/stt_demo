import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// [CustomTab] 커스텀 탭 위젯

class CustomTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;
  final Color? selectedColor;
  final Color? unselectedColor;

  const CustomTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Tab(
        height: 40.h,
        child: Container(
          width: 214.w,
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : Colors.white,
            // color: isSelected ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            border: Border.all(
              color: isSelected ? Color(0xff264DB1) : Color(0xFFD8D8D8),
              // color: isSelected ? selectedColor ?? Color(0xff264DB1) : unselectedColor ?? Color(0xFFD8D8D8),
              width: 0,
            ),
          ),
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      //color: isSelected ? Colors.white : Color(0xFF00163D),
                      color: isSelected ? Colors.white : Color(0xFF555555),
                      fontSize: 15.sp,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                width: 24.w,
                height: 24.h,
                //padding: const EdgeInsets.only(top: 7, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  //color: isSelected ? Color(0xff264DB1) : Colors.white,
                  color: isSelected ? selectedColor : unselectedColor,
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  border: Border.all(
                    //color: isSelected ? Color(0xff264DB1) : Color(0xFFD8D8D8),
                    color: isSelected ? selectedColor ?? Color(0xff264DB1) : unselectedColor ?? Color(0xFFD8D8D8),
                    //width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_tab_arrow.svg',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}