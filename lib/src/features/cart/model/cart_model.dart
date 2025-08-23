import 'package:constructo_user/src/features/cart/model/cart_item_model.dart';
import 'package:constructo_user/src/features/cart/model/cart_total_model.dart';

class CartModel {
  final int cartId;
  final int userId;
  final List<CartItem> items;
  final CartTotalModel totalCartprice;

  CartModel({
    required this.cartId,
    required this.userId,
    required this.items,
    required this.totalCartprice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>?;
    final List<CartItem> itemsList = itemsJson != null
        ? itemsJson.map((item) => CartItem.fromJson(item)).toList()
        : <CartItem>[];

    return CartModel(
      cartId: json['cart_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      items: itemsList,
      totalCartprice: json['total'] != null
          ? CartTotalModel.fromJson(json['total'])
          : CartTotalModel(totalPrice: 0, discount: 0, finalAmount: 0),
    );
  }
}
