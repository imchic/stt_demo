import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTabBar extends StatefulWidget {

  final List<Tab> tabItems;
  final TabController controller;

  final Color? activeColor;
  final Color? unActiveTextColor;
  final Color? activeTextColor;
  final Color? unActiveColor;

  BaseTabBar({
    required this.tabItems,
    required this.controller,
    this.activeColor,
    this.unActiveTextColor,
    this.activeTextColor,
    this.unActiveColor,
  });

  @override
  State<BaseTabBar> createState() => _BaseTabBarState();
}

class _BaseTabBarState extends State<BaseTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabItems.length, child: _buildRoundShapeTabBar());
  }

  /// Color(0xff00163D) is the color of the tab bar
  /// Color(0xff1D1D1D) is the color of the selected tab
  /// Color(0xffFFFFFF) is the color of the indicator
  /// Color(0xffFFFFFF) is the color of the unselected tab
  /// Color(0xffFFFFFF) is the color of the selected tab

  // custom tab round design
  Widget _buildRoundShapeTabBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.unActiveColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: TabBar(
        controller: widget.controller,
        tabs: widget.tabItems,
        // tabAlignment: TabAlignment.start,
        // isScrollable: true,
        // labelPadding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 5.h),
        labelColor: widget.activeTextColor,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          color: widget.activeColor,
        ),
        // tab border
        //indicatorColor: Colors.white,
        indicatorPadding: EdgeInsets.zero,
        indicatorWeight: 0,
        unselectedLabelColor: widget.unActiveTextColor,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),

      ),
    );
  }
}
