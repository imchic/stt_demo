import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

    // statusbar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(
      designSize: Size(712, 1138),
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
