import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stt_demo/components/custom_tab.dart';
import 'package:stt_demo/utils/colors.dart';

class BaseTabBar extends StatefulWidget {

  String type;
  //final List<T> tabItems;
  // T
  final List<Widget> tabItems;
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: TabBar(
        controller: widget.controller,
        isScrollable: true,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        indicatorWeight: 0.0,
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        tabs: widget.tabItems,
      ),
    );
  }
}
