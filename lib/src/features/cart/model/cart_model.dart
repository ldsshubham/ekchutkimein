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
    final List<dynamic> itemsJson = json['items'] as List<dynamic>;
    final List<CartItem> itemsList = itemsJson
        .map((item) => CartItem.fromJson(item))
        .toList();

    return CartModel(
      cartId: json['cart_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      items: itemsList,
      totalCartprice: CartTotalModel.fromJson(json['total']),
    );
  }
}
