import 'package:constructo_user/src/constants/strings.dart';

class AppCategory {
  final String name;
  final String imgPath;
  final String appDesc;
  final double price;
  final double stock;

  AppCategory( {
    required this.name,
    required this.imgPath,
    required this.appDesc,
    required this.price,
    required this.stock
  });
}

List<AppCategory> appCategories = [
  AppCategory(
    name: 'Cement',
    imgPath: '${AppString.images}cement.jpg',
    appDesc:
        'High-quality Portland cement, ideal for all types of construction. Fast setting and strong. Suitable for concrete, mortar, and plaster.',
    price: 350.0,
    stock: 120,
  ),
  AppCategory(stock: 10,
    name: 'Paint',
    imgPath: '${AppString.images}paint.png',
    appDesc: 'Durable wall paint with rich color options.',
    price: 1200.0,
  ),
  AppCategory(stock: 130,
    name: 'Pipes',
    imgPath: '${AppString.images}pipes.jpg',
    appDesc: 'PVC pipes suitable for plumbing and drainage.',
    price: 250.0,
  ),
  AppCategory(
    stock: 1920,
    name: 'Red Sand',
    imgPath: '${AppString.images}redsand.webp',
    appDesc: 'Pure red sand used for plastering.',
    price: 80.0,
  ),
  AppCategory(
    stock: 1200,
    name: 'Rope',
    imgPath: '${AppString.images}rope.jpg',
    appDesc: 'Heavy-duty industrial rope for multiple uses.',
    price: 100.0,
  ),
  AppCategory(
    stock: 10,
    name: 'Sand',
    imgPath: '${AppString.images}sand.jpg',
    appDesc: 'Fine river sand for construction works.',
    price: 75.0,
  ),
];
