import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxInt carousalCurrentIndex = 0.obs;
  //int get carousalCurrentIndex => _carousalCurrentIndex.value;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
