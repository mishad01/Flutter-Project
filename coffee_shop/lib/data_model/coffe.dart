class Coffee {
  final String image;
  final String name;
  final String type;
  final double rate;
  final int review;
  final String description;
  final double price;

  Coffee(
      {required this.image,
      required this.name,
      required this.type,
      required this.rate,
      required this.review,
      required this.description,
      required this.price});
}

final listGridCoffe = [
  Coffee(
    image: 'assets/images/coffee1.png',
    name: 'Coffee Mocha',
    type: 'Deep Foam',
    rate: 4.8,
    review: 230,
    description:
        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo',
    price: 100,
  ),
  Coffee(
    image: 'assets/images/coffee3.png',
    name: 'Flat White',
    type: 'Espresso',
    rate: 4.8,
    review: 230,
    description:
        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo',
    price: 3.53,
  ),
  Coffee(
    image: 'assets/images/coffee2.png',
    name: 'Mocha Fusi',
    type: 'Ice/Hot',
    rate: 4.8,
    review: 230,
    description:
        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo',
    price: 7.53,
  ),
  Coffee(
    image: 'assets/images/coffee4.png',
    name: 'Caffe Panna',
    type: 'Ice/Hot',
    rate: 4.8,
    review: 230,
    description:
        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo',
    price: 5.53,
  ),
];
List<Coffee> listFavouriteGridCoffee = [];
