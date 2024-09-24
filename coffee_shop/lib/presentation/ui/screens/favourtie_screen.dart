import 'package:coffee_shop/controller/coffee_fav_controller.dart';
import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart'; // Add GetX import
import 'package:intl/intl.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavourtieScreenState();
}

class _FavourtieScreenState extends State<FavouriteScreen> {
  // Instantiate the CoffeeFavController
  final CoffeeFavController coffeeFavController =
      Get.put(CoffeeFavController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Favourites',
          style: textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
      body: Obx(() {
        // Check if the list is empty
        if (coffeeFavController.listFavouriteGridCoffee.isEmpty) {
          return Center(child: Text('No favorite coffee added yet!'));
        }

        // Build the grid of favorite coffee items
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: buildGridCoffee(),
        );
      }),
    );
  }

  Widget buildGridCoffee() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: coffeeFavController
          .listFavouriteGridCoffee.length, // Use the controller's list
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 220,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // Access coffee from the controller's list
        Coffee coffee = coffeeFavController.listFavouriteGridCoffee[index];

        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        coffee.image,
                        height: 135,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0x111111).withOpacity(0.5),
                              Color(0x313131).withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AssetPath.icStarFilled,
                              height: 12,
                              width: 12,
                            ),
                            Gap(10),
                            Text(
                              '${coffee.rate}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  coffee.type,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 2,
                        locale: 'en_US',
                        symbol: '\$',
                      ).format(coffee.price),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    /*Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),*/
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
