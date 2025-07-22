import 'package:constructo_user/src/constants/strings.dart';

class AppCategory {
  final String name;
  final String imgPath;
  final String appDesc;
  final double price;
  final double stock;

  AppCategory({
    required this.name,
    required this.imgPath,
    required this.appDesc,
    required this.price,
    required this.stock,
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
  AppCategory(
    stock: 10,
    name: 'Paint',
    imgPath: '${AppString.images}paint.png',
    appDesc: 'Durable wall paint with rich color options.',
    price: 1200.0,
  ),
  AppCategory(
    stock: 130,
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

class FarmingServices {
  final String name;
  final String imgPath;
  final String appDesc;
  final double price;
  final String availability; // ✅ Add this

  FarmingServices(
     {
    required this.name,
    required this.imgPath,
    required this.appDesc,
    required this.price,
     required this.availability,
  });
}

final List<FarmingServices> farmingServices = [
  FarmingServices(
    name: 'Tractor Service',
    imgPath: '${AppString.images}tractor.jpg',
    appDesc:
        'Powerful tractor with driver available for field ploughing, leveling, and preparation. Ideal for all soil types.',
    price: 500.0, // per hour
    availability: '2hrs', // ✅ Add this
  ),
  FarmingServices(
    name: 'Irrigation Setup',
    imgPath: '${AppString.images}irrigation.jpg',
    appDesc: 'Efficient drip and sprinkler system setup for your farm.',
    price: 350.0, availability: '1hr',
  ),
  FarmingServices(
    name: 'Harvesting Service',
    imgPath: '${AppString.images}harvesting.jpg',
    appDesc:
        'Machine-assisted harvesting for crops like wheat, rice, and maize.',
    price: 700.0, availability: '3hrs',
  ),
  FarmingServices(
    name: 'Soil Tilling',
    imgPath: '${AppString.images}tilling.jpg',
    appDesc: 'Advanced tilling equipment to aerate and prepare your soil.',
    price: 400.0, availability: '4hrs',
  ),
  FarmingServices(
    name: 'Fertilizer Spraying',
    imgPath: '${AppString.images}spraying.jpg',
    appDesc: 'Automated spraying services for liquid fertilizer or pesticides.',
    price: 300.0, availability: '5hrs',
  ),
  FarmingServices(
    name: 'Manual Labor',
    imgPath: '${AppString.images}labor.jpg',
    appDesc:
        'Trained farm workers available for sowing, weeding, and other manual tasks.',
    price: 250.0, availability: '6hrs',
  ),
];
