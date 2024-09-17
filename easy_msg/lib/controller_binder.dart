import 'package:easy_msg/ui/controller/sign_in_controller.dart';
import 'package:easy_msg/ui/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
  }
}
