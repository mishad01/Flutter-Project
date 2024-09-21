import 'package:coffee_shop/data_model/coffe.dart';
import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, textTheme),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildImage(),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.coffee.name,
                style: textTheme.titleLarge!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffee.type,
                        style: textTheme.bodySmall!.copyWith(fontSize: 12),
                      ),
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
                ],
              ),
            ],
          )
        ],
      ),
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

  AppBar buildAppBar(BuildContext context, TextTheme textTheme) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(22.0),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
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
}
