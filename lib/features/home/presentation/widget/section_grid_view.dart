import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/core/utils/custom_snack_bar.dart';
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/presentation/widget/item_of_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionGridView extends StatelessWidget {
  final List<ProductEntity>? listOfProducts;
  const SectionGridView({required this.listOfProducts, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen: (pre, cur) {
        if (pre.addItemState != cur.addItemState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state.addItemState is BaseSuccessState) {
          final message = state.addItemState as BaseSuccessState<String>;
          CustomSnackBar.showSnackBar(context, message.data ?? "");
        }
        if (state.addItemState is BaseErrorState) {
          final message = state.addItemState as BaseErrorState;
          CustomSnackBar.showSnackBar(
            context,
            message.errorMessage,
            color: AppColors.red,
          );
        }
      },
      child: GridView.builder(
        itemCount: listOfProducts?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.detailsScreen,
              arguments: listOfProducts![index],
            ),
            child: ItemOfGridView(productEntity: listOfProducts![index]),
          );
        },
      ),
    );
  }
}
