class CartItem {
  final int? productId;
  final String productName;
  final int price;
  final int quantity;
  final int discount;
  final int finalAmount;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.finalAmount,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['product_id'],
      productName: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      discount: json['discount'],
      finalAmount: json['final_amount'],
    );
  }
}
