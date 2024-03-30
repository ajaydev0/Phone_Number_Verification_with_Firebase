import 'package:get/get.dart';

import '../modules/HomePage/bindings/home_page_binding.dart';
import '../modules/HomePage/views/home_page_view.dart';
import '../modules/NumberPage/bindings/number_page_binding.dart';
import '../modules/NumberPage/views/number_page_view.dart';
import '../modules/OtpPage/bindings/otp_page_binding.dart';
import '../modules/OtpPage/views/otp_page_view.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initialPage = Routes.splashScreen;
  static final pages = [
    GetPage(
      name: _Path.splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.NUMBER_PAGE,
      page: () => const NumberPageView(),
      binding: NumberPageBinding(),
    ),
    GetPage(
      name: Routes.OTP_PAGE,
      page: () => const OtpPageView(),
      binding: OtpPageBinding(),
    ),
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
