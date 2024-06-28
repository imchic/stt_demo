import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stt_demo/routes/app_route.dart';
import 'package:stt_demo/utils/colors.dart';

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
          colorScheme: lightColorScheme,
          useMaterial3: false,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: false,
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppRoute.login,
        getPages: AppRoute.routes,
      ),
      // material 3 버전에서는 아래와 같이 사용
    );
  }
}
