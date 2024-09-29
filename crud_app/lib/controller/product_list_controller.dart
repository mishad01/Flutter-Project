import 'package:crud_app/data/model/product_model.dart';
import 'package:crud_app/data/network_caller.dart';
import 'package:crud_app/data/network_response.dart';
import 'package:crud_app/data/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool getProductListApiInProgress = false;
  bool isSuccess = false;
  List<ProductModel> productList = [];

  Future<bool> getProductList() async {
    getProductListApiInProgress = true;
    update();

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.readGetProduct);
    if (response.isSuccess) {
      productList.clear();

      final jsonProductList = response.responseData['data'];

      for (Map<String, dynamic> j in jsonProductList) {
        ProductModel product = ProductModel.fromJson(j);
        productList.add(product);
      }
      isSuccess = true;
    } else {
      Get.snackbar('Error', 'Failed to fetch product list. Try again.',
          snackPosition: SnackPosition.BOTTOM);
      isSuccess = false;
    }
    getProductListApiInProgress = false;
    update();
    return isSuccess;
  }
}
