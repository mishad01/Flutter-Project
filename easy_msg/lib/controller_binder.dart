import 'package:easy_msg/ui/controller/bottom_nav_bar_controller.dart';
import 'package:easy_msg/ui/controller/forgot_password_controller.dart';
import 'package:easy_msg/ui/controller/sign_in_controller.dart';
import 'package:easy_msg/ui/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(BottomNavBarController());
    Get.put(ForgotPasswordController());
  }
}
