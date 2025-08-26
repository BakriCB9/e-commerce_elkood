part of 'cart_cubit.dart';

class CartState extends Equatable {
  final BaseState? getItemState;
  final BaseState? addItemState;
  final BaseState? deleteItemState;
  const CartState({this.addItemState, this.deleteItemState, this.getItemState});

  CartState copyWith({
    BaseState? getItemState,
    BaseState? addItemState,
    BaseState? deleteItemState,
  }) {
    return CartState(
      getItemState: getItemState ?? this.getItemState,
      addItemState: addItemState ?? this.addItemState,
      deleteItemState: deleteItemState ?? this.deleteItemState,
    );
  }

  @override
  List<Object?> get props => [getItemState, addItemState, deleteItemState];
}
