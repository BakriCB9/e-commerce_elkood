import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/core/utils/custom_snack_bar.dart';
import 'package:ecommerce_elk/features/cart/presentation/model/cart_item_model.dart';
import 'package:ecommerce_elk/features/cart/presentation/view/widget/cart_item.dart';
import 'package:ecommerce_elk/features/cart/presentation/view/widget/section_invoice.dart';
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CartCubit, CartState>(
        listenWhen: (pre, cur) {
          if (pre.deleteItemState != cur.deleteItemState) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state.deleteItemState is BaseSuccessState) {
            final message = state.deleteItemState as BaseSuccessState;
            CustomSnackBar.showSnackBar(context, message.data);
          }
          if (state.deleteItemState is BaseErrorState) {
            final message = state.deleteItemState as BaseErrorState;
            CustomSnackBar.showSnackBar(
              context,
              message.errorMessage,
              color: AppColors.red,
            );
          }
        },
        buildWhen: (pre, cur) {
          if (pre.getItemState != cur.getItemState) {
            return true;
          }
          return false;
        },

        builder: (context, state) {
          if (state.getItemState is BaseLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state.getItemState is BaseSuccessState) {
            final result =
                state.getItemState as BaseSuccessState<List<CartItemModel>>;

            return result.data!.isEmpty
                ? Center(child: Text('Cart is empty'))
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(15),
                          itemCount: result.data?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CartItem(
                                cartItemModel: result.data![index],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SectionInvoice(
                          subTotal:
                              result.data?.fold(
                                0.0,
                                (sum, e) => e.price + sum!,
                              ) ??
                              0,
                        ),
                      ),
                    ],
                  );
          }
          return SizedBox();
        },
      ),
    );
  }
}
