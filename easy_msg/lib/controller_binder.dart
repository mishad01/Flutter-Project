import 'package:easy_msg/ui/controller/sign_in_controller.dart';
import 'package:easy_msg/ui/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController()); // Removed the arrow function
    Get.put(SignUpController()); // Removed the arrow function
  }
}
