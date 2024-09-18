import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void selectedCategoryTab() {
    changeIndex(1);
  }

  void backToHome() {
    Get.offAll(() => BottomNavBarController());
  }
}
