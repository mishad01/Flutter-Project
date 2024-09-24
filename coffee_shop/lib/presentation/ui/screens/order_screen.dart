import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/screens/map_screen.dart';
import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:coffee_shop/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    this.coffee,
  });
  final Coffee? coffee;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderOption = 'Deliver';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //backgroundColor: Colors.white70,
      appBar: const CustomAppBar(title: 'Order'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildOrderOption(),
            const Gap(20),
            _buildAddressInfo(),
            _buildCoffeeItemCount(),
            const Gap(10),
            const Divider(height: 10, thickness: 4, color: Color(0xffF9F2ED)),
            const Gap(10),
            _buildPaymentSummary(),
            const Gap(80),
            _buildBuySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderOption() {
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
                width: 185,
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

  Widget _buildAddressInfo() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 180,
      width: 315,
      //color: Colors.yellow,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Address',
            style: textTheme.titleLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gap(15),
          Text(
            'Jl. Kpg Sutoyo',
            style: textTheme.titleLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Gap(10),
          Text(
            'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
            style: textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          Gap(10),
          Row(children: [
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('Edit Address'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 40),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.shade300)),
              icon: Icon(Icons.edit, size: 15),
            ),
            Gap(5),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('Add Note'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 40),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.shade300)),
              icon: Icon(Icons.note_add, size: 15),
            )
          ]),
          Gap(5),
          Divider(
            color: Color(0xffE3E3E3),
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeItemCount() {
    return SizedBox(
      height: 70,
      width: 315,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.coffee?.image ?? AssetPath.coffee1,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              )),
          Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.coffee?.name ?? 'Order First',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.coffee?.type ?? 'Order First',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          Spacer(),
          ItemCount(
            initialValue: 1,
            minValue: 1,
            maxValue: 20,
            onChanged: (value) {},
            decimalPlaces: 0,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(327, 56),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Aligns leading and action on opposite sides
            children: [
              const Row(
                children: [
                  Icon(Icons.local_offer,
                      color: Colors.green), // Leading icon or widget
                  SizedBox(width: 20), // Space between the icon and text
                  Text('1 Discount is Applied',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              IconButton(
                onPressed: () {
                  // Action button functionality
                },
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Colors.grey), // Action icon
              ),
            ],
          ),
        ),
        Gap(10),
        Text(
          'Payment Summary',
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Gap(10),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  NumberFormat.currency(
                    decimalDigits: 2,
                    symbol: '\$',
                    locale: 'en_US',
                  ).format(
                    widget.coffee?.price ?? 0.00,
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Fee',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  NumberFormat.currency(
                    decimalDigits: 2,
                    symbol: '\$',
                    locale: 'en_US',
                  ).format(
                    widget.coffee?.price ?? 0.0,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBuySection() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 165,
      width: 400,
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        /*color: Colors.yellow,*/
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/wallet.png'),
                  Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cash/Wallet',
                          style: textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(5),
                        Text(
                          '\$5.53',
                          style: textTheme.titleLarge!.copyWith(
                              fontSize: 12, color: AppColors.themeColor),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                ],
              ),
              Gap(10),
              SizedBox(
                width: 327,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LocationScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeColor,
                        foregroundColor: Colors.white,
                        minimumSize: Size(327, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text('Buy')),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
