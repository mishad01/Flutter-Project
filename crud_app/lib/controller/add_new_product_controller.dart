import 'package:crud_app/data/network_caller.dart';
import 'package:crud_app/data/network_response.dart';
import 'package:crud_app/data/urls.dart';
import 'package:get/get.dart';

class AddNewProductController extends GetxController {
  bool isSuccess = false;
  bool addNewProductInProgress = false;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> addNewProduct(
    String productName,
    int productCode,
    String img,
    int qty,
    int unitPrice,
    int totalPrice,
  ) async {
    addNewProductInProgress = true;
    update(); // Notify the UI to show loading state

    Map<String, dynamic> inputData = {
      "ProductName": productName,
      "ProductCode": productCode,
      "Img": img,
      "Qty": qty,
      "UnitPrice": unitPrice,
      "TotalPrice": totalPrice,
    };

    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.addNewProductUrl, inputData);

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
      isSuccess = false;
    }
    addNewProductInProgress = false;
    update(); // Notify the UI to hide loading state
    return isSuccess;
  }
}
