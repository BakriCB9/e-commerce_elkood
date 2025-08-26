import 'dart:convert';

import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/constant/app_values.dart';
import 'package:ecommerce_elk/core/utils/app_shared_prefrence.dart';
import 'package:ecommerce_elk/features/cart/presentation/model/cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());
  List<CartItemModel> listOfCartItems = [];

  ///? Add item
  Future<void> addProductToCart(CartItemModel cartItem) async {
    final isExist = listOfCartItems.any((item) => item.id == cartItem.id);

    if (isExist) {
      emit(
        state.copyWith(
          addItemState: BaseErrorState(errorMessage: "item already exist"),
        ),
      );
      return;
    }
    listOfCartItems.add(cartItem);
    final result = await SharedPreferencesUtils.saveData(
      key: AppValues.cartItemsKey,
      value: jsonEncode(listOfCartItems.map((e) => e.toJson()).toList()),
    );
    if (result) {
      emit(
        CartState(
          addItemState: BaseSuccessState<String>(data: "Item added to cart"),
          getItemState: BaseSuccessState<List<CartItemModel>>(
            data: listOfCartItems,
          ),
        ),
      );
    }
  }

  ///? get All item
  getCartProducts() async {
    emit(state.copyWith(getItemState: BaseLoadingState()));

    final cartItems = SharedPreferencesUtils.getString(AppValues.cartItemsKey);
    if (cartItems != null) {
      List<dynamic> listOfItem = jsonDecode(cartItems);

      final allItems = listOfItem
          .map((e) => CartItemModel.fromJson(e))
          .toList();
      emit(
        state.copyWith(
          getItemState: BaseSuccessState<List<CartItemModel>>(data: allItems),
        ),
      );
      listOfCartItems = allItems;
      return;
    }
    emit(
      state.copyWith(
        getItemState: BaseSuccessState<List<CartItemModel>>(data: []),
      ),
    );
  }

  ///? delete item
  Future<void> deleteProductFromCart(int id) async {
    emit(state.copyWith(deleteItemState: null));

    final item = listOfCartItems.firstWhere((element) => element.id == id);
    final result = listOfCartItems.remove(item);

    if (result) {
      await SharedPreferencesUtils.saveData(
        key: AppValues.cartItemsKey,
        value: jsonEncode(listOfCartItems.map((e) => e.toJson()).toList()),
      );
      emit(
        state.copyWith(
          deleteItemState: BaseSuccessState<String>(
            data: "Item deleted from cart",
          ),
          getItemState: BaseSuccessState<List<CartItemModel>>(
            data: List.from(listOfCartItems),
          ),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        deleteItemState: BaseErrorState(errorMessage: "Item not found"),      
      ),
    );
  }
}
