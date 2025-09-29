import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/Bloc/CardEvents.dart';
import 'package:food_order_app/Bloc/CardState.dart';
import 'package:food_order_app/models/CartModel.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddCart>(_onAddCart);
    on<AddQuantity>(_onAddQuantity);
    on<ReduceQuantity>(_onReduceQuantity);
    on<RemoveCart>(_onRemoveCart);
  }

  void _onAddCart(AddCart event, Emitter<CartState> emit) {
    final carts = List<CartModel>.from(state.carts);

    final index =
    carts.indexWhere((element) => element.productModel == event.product);

    if (index != -1) {
      carts[index] =
          CartModel(productModel: carts[index].productModel, quantity: carts[index].quantity + 1);
    } else {
      carts.add(CartModel(productModel: event.product, quantity: 1));
    }

    emit(state.copyWith(
      carts: carts,
      total: _calculateTotal(carts),
    ));
  }

  void _onAddQuantity(AddQuantity event, Emitter<CartState> emit) {
    final carts = List<CartModel>.from(state.carts);

    final index =
    carts.indexWhere((element) => element.productModel == event.product);

    if (index != -1) {
      carts[index] =
          CartModel(productModel: carts[index].productModel, quantity: carts[index].quantity + 1);
    }

    emit(state.copyWith(
      carts: carts,
      total: _calculateTotal(carts),
      items:_itemsno(carts),
    ));
  }

  void _onReduceQuantity(ReduceQuantity event, Emitter<CartState> emit) {
    final carts = List<CartModel>.from(state.carts);

    final index =
    carts.indexWhere((element) => element.productModel == event.product);

    if (index != -1 && carts[index].quantity > 1) {
      carts[index] =
          CartModel(productModel: carts[index].productModel, quantity: carts[index].quantity - 1);
    }

    emit(state.copyWith(
      carts: carts,
      total: _calculateTotal(carts),
      items:_itemsno(carts),
    ));
  }

  void _onRemoveCart(RemoveCart event, Emitter<CartState> emit) {
    final carts = List<CartModel>.from(state.carts)
      ..removeWhere((element) => element.productModel == event.product);

    emit(state.copyWith(
      carts: carts,
      total: _calculateTotal(carts),
      items:_itemsno(carts),
    ));
  }

  double _calculateTotal(List<CartModel> carts) {
    return carts.fold(
        0, (sum, item) => sum + item.quantity * item.productModel.price);
  }
}
int _itemsno(List<CartModel> carts){
  return carts.fold(
     0,(sum, items)=> sum+items.quantity);
}


