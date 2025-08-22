import 'package:constructo_user/src/features/product/model/product_image_model.dart';

class ProductsModel {
  final int productId;
  final String? productName;
  final String? productCategory;
  final String? productDescription;
  final String? productPrice;
  final List<ProductImageModel>? images;

  ProductsModel({
    required this.productId,
    this.images,
    this.productCategory,
    this.productName,
    this.productDescription,
    this.productPrice,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      productId: json['product_id'],
      productName: json['name'] as String?,
      productCategory: json['category_name'] as String?,
      productDescription: json['description'] as String?,
      productPrice: json['price']?.toString(), // handles int/double/string/null
      images: json['images'] != null
          ? (json['images'] as List)
                .map((img) => ProductImageModel.fromJson(img))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': productId,
      'product_category': productCategory,
      'name': productName,
      'img': images,
      'description': productDescription,
      'price': productPrice,
    };
  }
}
