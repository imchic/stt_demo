import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/routes/app_route.dart';
import 'package:ldi/utils/colors.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    return ScreenUtilInit(
      designSize: Size(1280, 800),
      minTextAdapt: true,
      splitScreenMode: true,
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
        initialRoute: AppRoute.login,
        getPages: AppRoute.routes,
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   const Locale('ko','KR'),
        // ],
      ),
      // material 3 버전에서는 아래와 같이 사용
    );
  }
}
