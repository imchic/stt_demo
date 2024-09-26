import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ldi/screens/lp_controller.dart';
import 'package:ldi/screens/np_controller.dart';
import 'package:ldi/screens/np_screen.dart';

import '../utils/colors.dart';

class WtwkAccdtInvstgWidget {

  /// [허가정보] > 신청정보
  static buildWtwkAccdtInvstg(NpController controller) {
    return Container(
      color: bsnsListViewBg,
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 48.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              '점유자 별 무단 점유 상세 정보',
              style: TextStyle(
                color: Color(0xFF1D1D1D),
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40.h),
            AutoSizeText(
              '점유내역',
              style: TextStyle(
                color: Color(0xFF1D1D1D),
                fontSize: 34.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            npScreen().buildWtwkAccdtInvstgDataGrid(),
            // SizedBox(height: 40.h),
            // AutoSizeText(
            //   '조치이력',
            //   style: TextStyle(
            //     color: Color(0xFF1D1D1D),
            //     fontSize: 34.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            // SizedBox(height: 20.h),
            // npScreen().buildWtwkAccdtInvstgDataGrid(),
            // SizedBox(height: 40.h),
            // AutoSizeText(
            //   '사진',
            //   style: TextStyle(
            //     color: Color(0xFF1D1D1D),
            //     fontSize: 34.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            // SizedBox(height: 20.h),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: Container(
            //         height: 192.h,
            //         decoration: BoxDecoration(
            //           color: tableColor1,
            //           border: Border.all(color: borderLine),
            //         ),
            //         alignment: Alignment.center,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             SizedBox(height: 10.h),
            //             AutoSizeText('사진촬영',
            //                 style: TextStyle(
            //                     color: tableTextColor,
            //                     fontSize: 30.sp,
            //                     fontWeight:
            //                     FontWeight.w700)),
            //             SizedBox(height: 10.h),
            //             InkWell(
            //               onTap: () {
            //                 // image picker
            //                 final ImagePicker _picker = ImagePicker();
            //                 // camera
            //                 LpController.to.takePhoto();
            //               },
            //               child: Container(
            //                 width: 72.w,
            //                 height: 72.h,
            //                 margin:
            //                 EdgeInsets.only(bottom: 10.h),
            //                 decoration: BoxDecoration(
            //                     color: Color(0xFFFFFFFF),
            //                     borderRadius:
            //                     BorderRadius.circular(6.r),
            //                     border: Border.all(
            //                         color: borderLine)),
            //                 child: Padding(
            //                   padding:
            //                   const EdgeInsets.all(8.0),
            //                   child: SvgPicture.asset(
            //                     'assets/icons/ic_camera.svg',
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 6,
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Color(0xFFFFFFFF),
            //           border: Border(
            //             top: BorderSide(
            //               color: Color(0xFFD8D8D8),
            //               width: 1,
            //             ),
            //             bottom: BorderSide(
            //               color: Color(0xFFD8D8D8),
            //               width: 1,
            //             ),
            //             right: BorderSide(
            //               color: Color(0xFFD8D8D8),
            //               width: 1,
            //             ),
            //           ),
            //         ),
            //         alignment: Alignment.center,
            //         height: 192.h,
            //         child: Obx(() =>
            //             Row(
            //               children: [
            //                 for (var i = 0; i < LpController.to.images.length; i++)
            //                   Container(
            //                     height: 300.h,
            //                     margin: EdgeInsets.only(right: 10.w),
            //                     decoration: BoxDecoration(
            //                         color: Color(0xFFFFFFFF),
            //                         borderRadius: BorderRadius.circular(6.r),
            //                         border: Border.all(color: borderLine)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Image.file(LpController.to.files[i]),
            //                     ),
            //                   ),
            //               ],
            //             ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }


}
