import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ldm/components/custom_microphonewithpen_button.dart';
import 'package:ldm/utils/dialog_util.dart';

import '../components/custom_textfield.dart';
import '../screens/np_controller.dart';
import '../utils/applog.dart';
import '../utils/colors.dart';

class WtwkAccdtInvstgAddWidget {
  static buildWtwkAccdtInvstgAdd(NpController controller) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 점유자정보
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '점유자 정보',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20.w),
                ElevatedButton(
                  onPressed: () {
                    AppLog.d('신청/점유자 정보');
                    DialogUtil.showAlertDialog(Get.context!, 2200, '신청/점유자 정보',
                        onOk: () async {
                      Get.back();
                    }, onCancel: () {
                      Get.back();
                    },
                        widget: Container(
                          child: Column(
                            children: [
                              // 성명(법인명)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 240.w,
                                    child: AutoSizeText(
                                      '성명(법인명)',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgNewOccpntNmController,
                                      hintText: '성명(법인명)',
                                      onChanged: (value) {
                                        controller.wtwkAccdtInvstgNewOccpntNm =
                                            value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  // 전화번호
                                  SizedBox(
                                    width: 120.w,
                                    child: AutoSizeText(
                                      '전화번호',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgNewOccpntTelnoController,
                                      hintText: '',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgNewOccpntTelno =
                                            value;
                                      },
                                      isNumber: true,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  ElevatedButton(
                                    onPressed: () {
                                      AppLog.d('무단점유 정보 조회');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                    ),
                                    child: AutoSizeText(
                                      '조회',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              // 사용자 정보
                              Container(
                                width: 1.sw,
                                child: AutoSizeText(
                                  '사용자 정보',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Divider(
                                color: Color(0xFF1D1D1D),
                                thickness: 2,
                              ),
                              SizedBox(height: 20.h),
                              // 성명(법인명), 주민번호, 사업자등록번호
                              Row(
                                children: [
                                  SizedBox(
                                    width: 260.w,
                                    child: AutoSizeText(
                                      '성명(법인명)',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntNmController,
                                      hintText: '성명(법인명)',
                                      onChanged: (value) {
                                        controller.wtwkAccdtInvstgUseOccpntNm =
                                            value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  SizedBox(
                                    width: 120.w,
                                    child: AutoSizeText(
                                      '주민번호',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntRgtNoController,
                                      hintText: '주민번호',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgUseOccpntRgtNo =
                                            value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  SizedBox(
                                    width: 120.w,
                                    child: AutoSizeText(
                                      '사업자등록번호',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntBizrNoController,
                                      hintText: '사업자등록번호',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgUseOccpntBizrNo =
                                            value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // 전화번호, 핸드폰번호
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 240.w,
                                    child: AutoSizeText(
                                      '전화번호',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntTelnoController,
                                      hintText: '전화번호',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgUseOccpntTelno =
                                            value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  SizedBox(
                                    width: 170.w,
                                    child: AutoSizeText(
                                      '핸드폰번호',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntCellNoController,
                                      hintText: '핸드폰번호',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgUseOccpntCellNo =
                                            value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // 주소
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 240.w,
                                    child: AutoSizeText(
                                      '주소',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntAdresController,
                                      hintText: '주소',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgUseOccpntAdres =
                                            value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // 비고(특이사항)
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 240.w,
                                    child: AutoSizeText(
                                      '비고(특이사항)',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: controller
                                          .wtwkAccdtInvstgUseOccpntRmrkController,
                                      hintText: '비고(특이사항)',
                                      onChanged: (value) {
                                        controller
                                                .wtwkAccdtInvstgUseOccpntRmrk =
                                            value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // 개인정보동의
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AutoSizeText(
                                    '개인정보동의',
                                    style: TextStyle(
                                      color: Color(0xFF1D1D1D),
                                      fontSize: 34.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Obx(() =>
                                    Checkbox(
                                      value: controller.wtwkAccdtInvstgUseOccpntPsnlInfoAgreYn.value,
                                      onChanged: (value) {
                                        controller.wtwkAccdtInvstgUseOccpntPsnlInfoAgreYn.value = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // 서명
                              Row(
                                children: [
                                  SizedBox(
                                    width: 240.w,
                                    child: AutoSizeText(
                                      '서명',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 34.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        DialogUtil.showAlertDialog(Get.context!, 2200, '서명',
                                            onOk: () async {
                                          final data = await controller.signatureGlobalKey.currentState?.toImage(pixelRatio: 3.0);
                                          final bytes = await data?.toByteData(format: ImageByteFormat.png);

                                          var image = bytes?.buffer.asUint8List();
                                          AppLog.d('image : $image');


                                          controller.wtwkAccdtInvstgUseOccpntSign = image!;
                                          controller.wtwkAccdtInvstgUseOccpntSignRx.value = image!;

                                          // uint8list to image
                                          // controller.wtwkAccdtInvstgUseOccpntSign = Image.memory(Uint8List.fromList(bytes!.buffer.asUint8List()));
                                          // Get.back();

                                        }, onCancel: () {
                                          //Get.back();
                                        },
                                            widget: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 300.h,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFFFFF),
                                                      borderRadius: BorderRadius.circular(6.r),
                                                      border: Border.all(
                                                          color: Color(0xFFD8D8D8), width: 1.w),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: controller.signaturePad
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        width: 1.sw,
                                        height: 150.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.circular(6.r),
                                          border: Border.all(
                                              color: Color(0xFFD8D8D8), width: 1.w),
                                        ),
                                        alignment: Alignment.center,
                                        child: Obx(() =>
                                          Container(
                                            child: Image.memory(controller.wtwkAccdtInvstgUseOccpntSignRx.value),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: AutoSizeText(
                    '무단점유 최초 등록',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Color(0xFF1D1D1D),
              thickness: 2,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140.w,
                  child: AutoSizeText(
                    '점유자 명',
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntNmController,
                    hintText: '점유자 명',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntNm = value;
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                SizedBox(
                  width: 160.w,
                  child: AutoSizeText(
                    '점유자 주소',
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntAdresController,
                    hintText: '점유자주소',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntAdres = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140.w,
                  child: AutoSizeText(
                    '전화번호',
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntNmController,
                    hintText: '전화번호',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntNm = value;
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                SizedBox(
                  width: 160.w,
                  child: AutoSizeText(
                    '핸드폰번호',
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntAdresController,
                    hintText: '핸드폰번호',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntAdres = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            // 무단점유정보
            Container(
              width: 1.sw,
              child: AutoSizeText(
                '무단점유 정보',
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              color: Color(0xFF1D1D1D),
              thickness: 2,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '점유면적(㎡)',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntAraController,
                    hintText: '점유면적(㎡)',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntAra = value;
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                AutoSizeText(
                  '점유목적',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntPurpsController,
                    hintText: '점유목적',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntPurps = value;
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                AutoSizeText(
                  '점유시작일자',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller:
                        controller.wtwkAccdtInvstgOccpntStrtDtController,
                    hintText: '점유시작일자',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntStrtDt = value;
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                AutoSizeText(
                  '점유종료일자',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomTextField(
                    controller: controller.wtwkAccdtInvstgOccpntEndDtController,
                    hintText: '점유종료일자',
                    onChanged: (value) {
                      controller.wtwkAccdtInvstgOccpntEndDt = value;
                    },
                  ),
                ),
              ],
            ),
            // 점유물 상세내용
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '점유물 상세내용',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20.w),
                CustomMicrophonewithpenButton(
                    controller.wtwkAccdtInvstgOccpntDtlController),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 150.h,
              child: CustomTextField(
                controller: controller.wtwkAccdtInvstgOccpntDtlController,
                hintText: '점유물 상세내용',
                onChanged: (value) {
                  controller.wtwkAccdtInvstgOccpntDtl = value;
                },
              ),
            ),
            SizedBox(height: 40.h),
            // 점유 참고사항
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '점유 참고사항',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20.w),
                CustomMicrophonewithpenButton(
                    controller.wtwkAccdtInvstgOccpntRmrkController),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 150.h,
              child: CustomTextField(
                controller: controller.wtwkAccdtInvstgOccpntRmrkController,
                hintText: '점유 참고사항',
                onChanged: (value) {
                  controller.wtwkAccdtInvstgOccpntRmrk = value;
                },
              ),
            ),
            SizedBox(height: 40.h),
            // 기타사항
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '기타사항',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20.w),
                CustomMicrophonewithpenButton(
                    controller.wtwkAccdtInvstgEtcRmrkController),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 150.h,
              child: CustomTextField(
                controller: controller.wtwkAccdtInvstgEtcRmrkController,
                hintText: '기타사항',
                onChanged: (value) {
                  controller.wtwkAccdtInvstgEtcRmrk = value;
                },
              ),
            ),
            SizedBox(height: 40.h),
            // 사진
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '사진',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.takePhoto();
                  },
                  child: Container(
                    width: 72.w,
                    height: 72.h,
                    margin: EdgeInsets.only(right: 20.w),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xFF1D1D1D),
                      size: 36.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Color(0xFFD8D8D8), width: 1.w),
              ),
              alignment: Alignment.center,
              height: 192.h,
              child: Obx(
                () => Row(
                  children: [
                    for (var i = 0;
                        i < controller.wtwkAccdtInvstgImages.length;
                        i++)
                      Container(
                        height: 300.h,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: borderLine, width: 1.w)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(controller.files[i]),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
