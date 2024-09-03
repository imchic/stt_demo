import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/accdtlnvstg/accdtlnvstg_screen.dart';
import '../screens/bsns/select/lp_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

class AppRoute {

  static const home = '/';
  static const login = '/login';
  static const lp = '/lp'; // 토지보상
  static const np = '/np'; // 국유재산

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: lp, page: () => lpScreen()),
    GetPage(name: np, page: () => Container()),
  ];

}