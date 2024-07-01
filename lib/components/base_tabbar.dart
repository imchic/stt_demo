import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class BaseTabBar extends StatefulWidget {

  final List<Tab> tabItems;
  final TabController controller;

  const BaseTabBar({super.key, required this.tabItems, required this.controller});

  @override
  State<BaseTabBar> createState() => _BaseTabBarState();
}

class _BaseTabBarState extends State<BaseTabBar> {

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      controller: widget.controller,
      tabs: widget.tabItems,
      labelColor: Theme.of(context).colorScheme.primary,
      //indicatorSize: TabBarIndicatorSize.tab,
      // indicator: UnderlineTabIndicator(
      //   borderSide: BorderSide(
      //     width: 2,
      //     color: Theme.of(context).colorScheme.primary,
      //   ),
      // ),
      // indicatorPadding: EdgeInsets.symmetric(horizontal: 30.w),
      isScrollable: true,
      unselectedLabelColor: textUnselected  ,
      labelStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

}