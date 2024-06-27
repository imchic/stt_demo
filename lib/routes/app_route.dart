import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:stt_demo/screens/bsns/bsns_select_screen.dart';
import 'package:stt_demo/screens/login/login_screen.dart';

import '../screens/home/home_screen.dart';

class AppRoute {

  static const home = '/';
  static const login = '/login';
  static const bsnsSelect = '/bsnsSelect';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: bsnsSelect, page: () => BsnsSelectScreen()),
  ];

}