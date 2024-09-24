import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ldi/screens/gis/gis_screen.dart';
import 'package:ldi/screens/np_screen.dart';

import '../screens/accdtlnvstg/accdtlnvstg_screen.dart';
import '../screens/lp_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

class AppRoute {

  static const home = '/';
  static const login = '/login';
  static const gis = '/gis'; // GIS
  static const lp = '/lp'; // 토지보상
  static const np = '/np'; // 국유재산

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: gis, page: () => GisScreen()),
    GetPage(name: lp, page: () => lpScreen()),
    GetPage(name: np, page: () => npScreen()),
  ];

}