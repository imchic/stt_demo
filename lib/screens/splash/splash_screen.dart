
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ldm/routes/app_route.dart';

import '../../utils/dialog_util.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:2), () {
      Get.offNamed(AppRoute.login);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2560.w,
      height: 1600.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          children: [
            // progressbar
            Image.asset('assets/images/bg_splash.png', width: 2560.w, height: 1600.h, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
