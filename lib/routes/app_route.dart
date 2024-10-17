import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ldi/screens/gis/gis_screen.dart';
import 'package:ldi/screens/np_screen.dart';
import 'package:ldi/screens/splash/splash_binding.dart';

import '../screens/gis/gis_binding.dart';
import '../screens/lp_binding.dart';
import '../screens/lp_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/np_binding.dart';
import '../screens/splash/splash_screen.dart';

class AppRoute {

  static const splash = '/splash';
  static const login = '/login';
  static const gis = '/gis'; // GIS
  static const lp = '/lp'; // 토지보상
  static const np = '/np'; // 국유재산

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen(), binding: SplashBinding(), middlewares: [

    ]),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: gis, page: () => GisScreen(), binding: GisBinding()),
    GetPage(name: lp, page: () => lpScreen(), binding: LpBinding()),
    GetPage(name: np, page: () => npScreen(), binding: NpBinding()),
  ];

}