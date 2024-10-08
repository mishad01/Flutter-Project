import 'package:crud_app/controller/add_new_product_controller.dart';
import 'package:crud_app/controller/delete_product_controller.dart';
import 'package:crud_app/controller/product_list_controller.dart';
import 'package:crud_app/controller/update_product_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewProductController());
    Get.lazyPut(() => ProductListController());
    Get.lazyPut(() => UpdateProductController());
    Get.lazyPut(() => DeleteProductController());
  }
}
