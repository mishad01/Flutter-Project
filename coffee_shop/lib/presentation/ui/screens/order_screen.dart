import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderOption = 'Deliver';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Order'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              _buildorderOption(),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['Deliver', 'Pickup'].map(
          (e) {
            bool isSelected = orderOption == e;
            return GestureDetector(
              onTap: () {
                orderOption = e;
                setState(() {});
              },
              child: Container(
                width: 170,
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
