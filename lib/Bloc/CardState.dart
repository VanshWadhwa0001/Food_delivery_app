import 'package:equatable/equatable.dart';
import 'package:food_order_app/models/CartModel.dart';

class CartState extends Equatable {
  final List<CartModel> carts;
  final double total;
  final int items;

  const CartState({
    this.carts = const [],
    this.total = 0.0,
    this.items =1,
  });

  CartState copyWith({
    List<CartModel>? carts,
    double? total,
    int? items,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      total: total ?? this.total,
      items: items ?? this.items
    );
  }

  @override
  List<Object?> get props => [carts, total, items];
}