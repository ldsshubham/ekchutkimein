class CartTotalModel {
  final int totalPrice;
  final int discount;
  final int finalAmount;

  CartTotalModel({
    required this.totalPrice,
    required this.discount,
    required this.finalAmount,
  });
  factory CartTotalModel.fromJson(Map<String, dynamic> json) {
    return CartTotalModel(
      totalPrice: json['total_amount'],
      discount: json['discount'],
      finalAmount: json['final_amount'],
    );
  }
}
