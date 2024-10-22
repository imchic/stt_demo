import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldm/routes/app_route.dart';
import 'package:ldm/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KwaterLdiApp());
}

class KwaterLdiApp extends StatelessWidget with WidgetsBindingObserver {
  const KwaterLdiApp({super.key});

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

    // top statusbar hide
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return ScreenUtilInit(
      designSize: Size(2560, 1640),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      child: GetMaterialApp(
        title: 'Kwater',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          // unselectedWidgetColor: Color(0xFFD8D8D8),
          radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith(
                  (states) {
                if (states.contains(WidgetState.selected)) {
                  return Theme.of(Get.context!).colorScheme.primary;
                }
                return Color(0xFFD8D8D8);
              },
            ),
          ),
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Pretendard'
        ),
        darkTheme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Pretendard'
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppRoute.splash,
        getPages: AppRoute.routes,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ko', 'KR'),
        ],
      ),
      // material 3 버전에서는 아래와 같이 사용
    );
  }



}
