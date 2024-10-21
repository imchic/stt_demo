import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldm/screens/gis/gis_controller.dart';


class GisScreen extends GetView<GisController> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 0.0.h, bottom: 0.0.h, left: 0.0.w, right: 0.0.w),
      child: controller.gisWebview,
    );
  }

}
