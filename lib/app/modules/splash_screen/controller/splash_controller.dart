import 'package:get/get.dart';
import '../../../router/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    nextPage();
    super.onInit();
  }

  nextPage() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        return Get.offAllNamed(Routes.NUMBER_PAGE);
      },
    );
  }
}
