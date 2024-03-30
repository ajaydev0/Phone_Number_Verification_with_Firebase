part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const NUMBER_PAGE = _Path.NUMBER_PAGE;
  static const OTP_PAGE = _Path.OTP_PAGE;
  static const HOME_PAGE = '/home-page';
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const NUMBER_PAGE = '/number-page';
  static const OTP_PAGE = '/otp-page';
}
