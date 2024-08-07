import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/accdtlnvstg/accdtlnvstg_screen.dart';
import '../screens/bsns/select/bsns_select_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

class AppRoute {

  static const home = '/';
  static const login = '/login';
  static const bsnsSelect = '/bsnsSelect'; // 사업구역 선택
  static const accdtlnvstg = '/accdtlnvstg'; // 실태조사서

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: bsnsSelect, page: () => BsnsSelectScreen()),
    GetPage(name: accdtlnvstg, page: () => AccdtlnvstgScreen()),
  ];

}