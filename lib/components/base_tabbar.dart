import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class BaseTabBar extends StatefulWidget {

  String type;
  //final List<T> tabItems;
  // T
  final List<Widget> tabItems;
  final TabController controller;

  final Color? labelColor;
  final Color? indicatorColor;
  final Color? activeColor;
  final Color? unActiveTextColor;
  final Color? activeTextColor;
  final Color? unActiveColor;

  final bool? isScrollable;

  BaseTabBar({
    this.type = 'login',
    required this.tabItems,
    required this.controller,
    this.labelColor,
    this.indicatorColor,
    this.isScrollable = true,
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
      margin: EdgeInsets.only(top: 48.h, left: 48.w, right: 48.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 61.h,
            child: TabBar(
              controller: widget.controller,
              labelColor: widget.labelColor,
              indicatorColor: widget.indicatorColor,
              isScrollable: widget.isScrollable ?? true,
              tabs: widget.tabItems,
            ),
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            color: tabBarDivider,
          ),
        ],
      ),
    );
  }
}
