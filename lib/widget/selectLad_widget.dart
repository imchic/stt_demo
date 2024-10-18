import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldm/screens/np_controller.dart';
import 'package:ldm/screens/np_screen.dart';

import '../utils/colors.dart';

class SelectLadWidget {

  /// [허가정보] > 신청정보
  static buildSelectLad(NpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 48.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '신청정보',
            style: TextStyle(
              color: Color(0xFF1D1D1D),
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40.h),
          Expanded(child: npScreen().buildUsePrmisnCanclAprvDataGrid()),
        ],
      ),
    );
  }

  /// [허가정보] > 신청자정보별 허가 상세현황
  static buildSelectLadDetail(NpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 48.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '신청자정보별 허가 상세현황',
            style: TextStyle(
              color: Color(0xFF1D1D1D),
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40.h),
          Expanded(child: npScreen().buildUsePrmisnCanclAprvDetailDataGrid()),
        ],
      ),
    );
  }

}
