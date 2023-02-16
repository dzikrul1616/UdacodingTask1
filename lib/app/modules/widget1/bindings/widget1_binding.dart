import 'package:get/get.dart';

import '../controllers/widget1_controller.dart';

class Widget1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Widget1Controller>(
      () => Widget1Controller(),
    );
  }
}
