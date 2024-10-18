import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/lp_controller.dart';
import 'package:ldm/utils/dialog_util.dart';

import '../utils/applog.dart';
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
      margin: EdgeInsets.only(left: 48.w, right: 48.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            physics: NeverScrollableScrollPhysics(),
            controller: widget.controller,
            labelColor: widget.labelColor ?? Color(0xFF1D1D1D),
            indicatorColor: widget.indicatorColor ?? Color(0xFF1D1D1D),
            isScrollable: widget.isScrollable ?? true,
            tabs: widget.tabItems,
            labelStyle: TextStyle(
              //fontSize: 1.w > 1.h ? 40.sp : 50.sp,
              fontSize: 40.sp,
              fontWeight: FontWeight.w500,
              color: widget.activeTextColor ?? Color(0xFF1D1D1D),
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w500,
              color: widget.unActiveTextColor ?? Color(0xFF555555),
            ),
            unselectedLabelColor: widget.unActiveColor ?? Color(0xFF555555),
            onTap: (index) {
              AppLog.d('TabBar index: $index');
              if(widget.controller == LpController.to.bsnsOwnerTabController){
                if(index > 0){
                  if(LpController.to.ownerLadInfoDataSource.value.rows.isEmpty){
                    DialogUtil.showSnackBar(context, '소유자관리', '소유자 정보가 없습니다.');
                    LpController.to.bsnsOwnerTabController.index = 0;
                    return;
                  }
                }
              }
            },
          ),
          //SizedBox(height: 20.h),
          Divider(
            height: 1.h,
            thickness: 1.h,
            //indent: 20,
            color: tabBarDivider,
          ),
        ],
      ),
    );
  }
}
