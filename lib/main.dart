import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stt_demo/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(800, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Kwater',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          dividerTheme: const DividerThemeData(
            space: 0,
            thickness: 1,
            color: Colors.transparent,
          ),
        ),
        initialRoute: AppRoute.login,
        getPages: AppRoute.routes,
      ),
    );
  }
}
