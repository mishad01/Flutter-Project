import 'package:crud_app/data/model/product_model.dart';
import 'package:crud_app/data/network_caller.dart';
import 'package:crud_app/data/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  // Variables to hold product list and API status
  bool getProductListApiInProgress = false;
  bool isSuccess = false;
  List<ProductModel> productList = [];

  // Method to fetch product list
  Future<bool> getProductList() async {
    // Set loading state to true
    getProductListApiInProgress = true;
    update(); // Notify GetX about the state change

    // Call the API
    final response = await NetworkCaller.getRequest(Urls.readGetProduct);

    // Check if the request was successful
    if (response.isSuccess) {
      // Clear the existing product list
      productList.clear();

      // Parse the response data and update the product list
      final jsonProductList = response.responseData['data'];
      for (Map<String, dynamic> json in jsonProductList) {
        ProductModel productModel = ProductModel.fromJson(json);
        productList.add(productModel);
      }

      // Set success status
      isSuccess = true;
    } else {
      // In case of failure, show a message and set success to false
      Get.snackbar('Error', 'Failed to fetch product list. Try again.',
          snackPosition: SnackPosition.BOTTOM);
      isSuccess = false;
    }

    // Set loading state to false and notify GetX about the state change
    getProductListApiInProgress = false;
    update();

    return isSuccess;
  }
}
