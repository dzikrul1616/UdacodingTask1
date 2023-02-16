import 'package:get/get.dart';

import '../controllers/api_controller.dart';

class ApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiController>(
      () => ApiController(),
    );
  }
}
