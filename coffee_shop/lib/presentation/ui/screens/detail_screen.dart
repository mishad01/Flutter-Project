import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/screens/order_screen.dart';
import 'package:coffee_shop/presentation/ui/utils/app_colors.dart';
import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:coffee_shop/presentation/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.coffee,
  });
  final Coffee coffee;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String sizeSelected = 'M';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Details',
        actionIcon: Icons.favorite_border_outlined,
        coffee: widget.coffee,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        children: [
          buildImage(),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.coffee.name,
                style: textTheme.titleLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              buildMainInfo(textTheme),
              const Gap(10),
              const Divider(),
              const Gap(10),
              buildDescription(textTheme),
              const Gap(10),
              buildSizeButton(textTheme),
              const Gap(40),
              buildPriceSection(),
            ],
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, TextTheme textTheme) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(22.0),
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      title: Text(
        'Details',
        style: textTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage(AssetPath.icHeartBorder),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        widget.coffee.image,
        width: 315,
        height: 225,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMainInfo(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.coffee.type,
              style: textTheme.bodySmall!.copyWith(fontSize: 12),
            ),
            Gap(10),
            Row(
              children: [
                Image.asset(AssetPath.icStarFilled),
                Gap(10),
                Text(
                  '${widget.coffee.rate}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff2A2A2A),
                  ),
                ),
                Gap(10),
                Text(
                  '(${widget.coffee.review})',
                  style: textTheme.titleLarge!.copyWith(
                    fontSize: 12,
                    color: Color(0xffA2A2A2),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
            children: [
          AssetPath.bike,
          AssetPath.bean,
          AssetPath.milk,
        ].map((e) {
          return Container(
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: const Color(0xffEDEDED).withOpacity(0.35),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            height: 35,
            width: 35,
            child: Image.asset(e),
          );
        }).toList()),
      ],
    );
  }

  Widget buildDescription(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Gap(10),
        ReadMoreText(
          widget.coffee.description,
          trimLength: 110,
          trimMode: TrimMode.Length,
          trimCollapsedText: 'Read More',
          trimExpandedText: 'Read less',
          style: TextStyle(color: Colors.grey, fontSize: 15),
          moreStyle: TextStyle(
            color: Color(0xffC67C4E),
            fontWeight: FontWeight.w600,
          ),
          lessStyle: TextStyle(
            color: Color(0xffC67C4E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget buildSizeButton(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Gap(20),
        Row(
          children: ['S', '', 'M', '', 'L'].map(
            (e) {
              if (e == '') return const Gap(10);
              bool isSelected = sizeSelected == e;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    sizeSelected = e;
                    setState(() {});
                  },
                  child: Container(
                    height: 43,
                    width: 96,
                    decoration: BoxDecoration(
                      color: Color(isSelected ? 0xffF9F2ED : 0xDEDEDE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(isSelected ? 0xffC67C4E : 0xffE3E3E3),
                        width: 1,
                      ),
                    ),
                    child: Center(child: Text(e)),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget buildPriceSection() {
    return Container(
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
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Price',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Color(0xff909090),
                  ),
                ),
                Text(
                  NumberFormat.currency(
                    decimalDigits: 2,
                    locale: 'en_US',
                    symbol: '\$',
                  ).format(widget.coffee.price),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 217,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => OrderScreen(
                        coffee: widget.coffee,
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: Colors.white,
                    minimumSize: Size(217, 62),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Text('Buy')),
          )
        ],
      ),
    );
  }
}
