import 'package:crud_app/data/network_caller.dart';
import 'package:crud_app/data/network_response.dart';
import 'package:crud_app/data/urls.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  bool isSuccess = false;
  bool updateProductApiInProgress = false;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> updateProduct(
    String? id,
    String productName,
    int productCode,
    String img,
    int qty,
    int unitPrice,
    int totalPrice,
  ) async {
    updateProductApiInProgress = true;
    update(); // Notify the UI to show loading state

    Map<String, dynamic> editData = {
      "ProductName": productName,
      "ProductCode": productCode,
      "Img": img,
      "Qty": qty,
      "UnitPrice": unitPrice,
      "TotalPrice": totalPrice
    };

    // Sending POST request
    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.editProduct(id!), editData);

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      // Handle possible null for errorMessage
      _errorMessage = response.errorMessage ?? "Unknown error occurred";
      isSuccess = false;
    }

    updateProductApiInProgress = false;
    update(); // Notify the UI to hide loading state
    return isSuccess;
  }
}
