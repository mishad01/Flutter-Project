import 'package:crud_app/data/network_caller.dart';
import 'package:crud_app/data/network_response.dart';
import 'package:crud_app/data/urls.dart';
import 'package:get/get.dart';

class DeleteProductController extends GetxController {
  bool deleteProductControllerApiInProgress = false;
  bool isSuccess = false;
  Future<bool> deleteProduct(String id) async {
    deleteProductControllerApiInProgress = true;
    update(); // Notify the UI that the API call is in progress

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.deleteProduct(id));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      isSuccess = false;
    }

    deleteProductControllerApiInProgress = false;
    update(); // Notify the UI to update after the API call

    return isSuccess; // Ensure yo
  }
}
