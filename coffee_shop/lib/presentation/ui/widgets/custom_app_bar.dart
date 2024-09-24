import 'package:coffee_shop/controller/coffee_fav_controller.dart';
import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/screens/favourtie_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actionIcon,
    this.coffee,
  }) : super(key: key);

  final String title;
  final IconData? actionIcon;
  final Coffee? coffee;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70); // Moved to this level
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool onFavTap = false; // Moved to state

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    // Instantiate the CoffeeFavController
    final CoffeeFavController coffeeFavController =
        Get.put(CoffeeFavController());

    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      title: Text(
        widget.title,
        style: textTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            coffeeFavController.addCoffee(widget.coffee!);
            onFavTap = !onFavTap;
            Get.snackbar(
              '${widget.coffee!.name}',
              'added to favorites',
              duration: Duration(seconds: 1),
              margin: EdgeInsets.only(bottom: 10),
              snackPosition: SnackPosition.BOTTOM,
            );
            setState(() {}); // This ensures the state is updated
            Get.to(() => FavouriteScreen()); // Navigate to FavouriteScreen
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              onFavTap ? Icons.favorite : widget.actionIcon,
              color: onFavTap ? Colors.red : null,
            ),
          ),
        )
      ],
    );
  }
}
