import 'package:coffee_shop/data_model/coffe.dart';
import 'package:get/get.dart';

class CoffeeFavController extends GetxController {
  var listFavouriteGridCoffee = <Coffee>[].obs;

  void addCoffee(Coffee coffee) {
    if (!listFavouriteGridCoffee.contains(coffee)) {
      listFavouriteGridCoffee.add(coffee);
    }
  }
}
