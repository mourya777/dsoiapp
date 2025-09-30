import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ScreenPage/LoginPage.dart';
import '../ScreenPage/MenuPage.dart';
import '../ScreenPage/OrderPage.dart';
import '../ScreenPage/SplashScreenPage.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const menu = '/menu';
  static const order = '/order';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: menu, page: () => MenuPage()),
    GetPage(name: menu, page: () => OrdersPage(category: '',)),
  ];
}
