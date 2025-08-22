class ProductDetailsModel {
  final int productId;
  final String categoryName;
  final String productName;
  final String productDesc;
  final String price;
  final String discount;
  final int stock;
  final String finalPrice;

  ProductDetailsModel({
    required this.finalPrice,
    required this.productId,
    required this.categoryName,
    required this.productName,
    required this.productDesc,
    required this.price,
    required this.discount,
    required this.stock,
  });
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      productId: json['id'],
      categoryName: json['category_name'],
      productName: json['name'],
      productDesc: json['description'],
      price: json['price'],
      discount: json['discount'],
      stock: json['in_stock'],
      finalPrice:
          json['final_price'] ??
          json['price'], // Assuming final_price is optional
    );
  }
}
