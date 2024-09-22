import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderOption = 'Deliver';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: const CustomAppBar(title: 'Order'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              _buildorderOption(),
              Gap(10),
              Container(
                height: 120,
                width: 315,
                color: Colors.yellow,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Adress',
                      style: textTheme.titleLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Delivery Adress',
                      style: textTheme.titleLarge!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container _buildorderOption() {
    return Container(
      height: 48,
      width: 315,
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: ['Deliver', 'Pickup'].map(
          (e) {
            bool isSelected = orderOption == e;
            return GestureDetector(
              onTap: () {
                orderOption = e;
                setState(() {});
              },
              child: Container(
                width: 190,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.themeColor : Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
