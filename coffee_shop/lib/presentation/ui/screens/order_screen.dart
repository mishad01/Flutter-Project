import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    required this.coffee,
  });
  final Coffee coffee;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderOption = 'Deliver';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'Order'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              _buildOrderOption(),
              Gap(20),
              _buildAddressInfo(textTheme),
              Gap(10),
              SizedBox(
                height: 70,
                width: 315,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.coffee.image,
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
                          widget.coffee.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.coffee.type,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
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
              )
            ],
          ),
        ));
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

  Widget _buildAddressInfo(TextTheme textTheme) {
    return Container(
      height: 180,
      width: 315,
      //color: Colors.yellow,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Adress',
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
          Gap(10),
          Divider(
            color: Colors.grey.shade300,
            // height: 4,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
