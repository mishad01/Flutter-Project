import 'package:e_learning_app/view_model/auth/login_in_controller.dart';
import 'package:e_learning_app/view_model/auth/sign_up_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInController());
    Get.put(SignUpController());
  }
}
