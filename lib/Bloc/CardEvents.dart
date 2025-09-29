import 'package:equatable/equatable.dart';
import 'package:food_order_app/models/MyProductModel.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddCart extends CartEvent {
  final MyProductModel product;
  const AddCart(this.product);

  @override
  List<Object?> get props => [product];
}

class AddQuantity extends CartEvent {
  final MyProductModel product;
  const AddQuantity(this.product);

  @override
  List<Object?> get props => [product];
}

class ReduceQuantity extends CartEvent {
  final MyProductModel product;
  const ReduceQuantity(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveCart extends CartEvent {
  final MyProductModel product;
  const RemoveCart(this.product);

  @override
  List<Object?> get props => [product];
}