import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ScreenPage/LoginPage.dart';
import '../ScreenPage/SplashScreenPage.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginView()),
  ];
}
