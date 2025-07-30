class ProductsModel {
  final int productId;
  final int categoryId;
  final String productName;
  final String? productImg;
  final String productDescription;
  final String productPrice;
  ProductsModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    this.productImg,
    required this.productDescription,
    required this.productPrice,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      productId: json['id'],
      categoryId: json['category_id'],
      productName: json['name'],
      productImg: json['img'],
      productDescription: json['description'],
      productPrice: json['price'],
    );
  }
}
