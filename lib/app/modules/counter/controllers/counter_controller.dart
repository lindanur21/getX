import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

 void increment() {
    if (count.value >= 100) {
      Get.snackbar("error", "mencapai angka maksimum");
    } else {
      count.value++;
    }
  }

  void decrement() {
    if (count.value <= 1) {
      Get.snackbar("error", "mencapai angka minimum");
    } else {
      count.value--;
    }
  }
}
