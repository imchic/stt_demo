import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTabBar extends StatefulWidget {

  String type;
  final List<Tab> tabItems;
  final TabController controller;

  final Color? activeColor;
  final Color? unActiveTextColor;
  final Color? activeTextColor;
  final Color? unActiveColor;

  BaseTabBar({
    this.type = 'login',
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
      length: widget.tabItems.length, child: _buildLoginTabBar());
  }

  /// [_buildTableTabBar] 테이블 탭 바
  Widget _buildTableTabBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff00163D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: TabBar(
        controller: widget.controller,
        tabs: widget.tabItems,
        labelColor: Color(0xffFFFFFF),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          color: Color(0xffFFFFFF),
        ),
        indicatorPadding: EdgeInsets.zero,
        indicatorWeight: 0,
        unselectedLabelColor: Color(0xffFFFFFF),
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

  /// [_buildLoginTabBar] 로그인 탭 바
  Widget _buildLoginTabBar() {
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
