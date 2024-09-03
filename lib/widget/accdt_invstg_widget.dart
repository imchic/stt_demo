import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/base_tabbar.dart';
import '../screens/bsns/lp_controller.dart';
import '../utils/colors.dart';
import 'accdt_invstg_lad_widget.dart';
import 'accdt_invstg_obst_widget.dart';

/// 실태조사 위젯
class AccdtInvstgWidget {
  /// [buildAccdtInvstgView] 실태조사
  static buildAccdtInvstgView(LpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            BaseTabBar(
              controller: controller.accdtlnvstgTabController,
              tabItems: controller.accdtlnvstgTabItems,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              isScrollable: true,
              activeColor: Colors.black,
              unActiveTextColor: Color(0xFF555555),
              activeTextColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                  controller: controller.accdtlnvstgTabController,
                  children: [
                    /**
                     * 토지
                     */
                    AccdtInvstgLadWidget.buildAccdtInvstgLadWidget(controller),
                    /**
                     * 지장물
                     */
                    AccdtInvstgObstWidget.buildAccdtInvstgObstWidget(
                        controller),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
