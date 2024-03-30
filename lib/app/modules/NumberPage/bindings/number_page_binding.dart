import 'package:get/get.dart';

import '../controllers/number_page_controller.dart';

class NumberPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumberPageController>(
      () => NumberPageController(),
    );
  }
}
