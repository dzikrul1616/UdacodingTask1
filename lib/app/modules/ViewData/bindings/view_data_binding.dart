import 'package:get/get.dart';

import '../controllers/view_data_controller.dart';

class ViewDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewDataController>(
      () => ViewDataController(),
    );
  }
}
