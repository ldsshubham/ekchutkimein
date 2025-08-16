class ProductDetailsModel {
  final int productId;
  final int categoryId;
  final String productName;
  final String productDesc;
  final String price;
  final String discount;
  final int stock;
  final String finalPrice;
  ProductDetailsModel({
    required this.finalPrice,
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.productDesc,
    required this.price,
    required this.discount,
    required this.stock,
  });
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      productId: json['id'],
      categoryId: json['category_id'],
      productName: json['name'],
      productDesc: json['description'],
      price: json['price'],
      discount: json['discount'],
      stock: json['stock'],
      finalPrice:
          json['final_price'] ??
          json['price'], // Assuming final_price is optional
    );
  }
}
