import 'package:get/get.dart';

import '../controllers/latihan1_controller.dart';

class Latihan1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Latihan1Controller>(
      () => Latihan1Controller(),
    );
  }
}
