import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/core/utils/custom_cache_network_image.dart';
import 'package:ecommerce_elk/features/cart/presentation/model/cart_item_model.dart';
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CartItem({required this.cartItemModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.pink, width: 0.5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Center(
                child: CustomCacheNetworkImage(imageUrl: cartItemModel.image),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItemModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("Price: ${cartItemModel.price}"),
                  Text("Rate: ${cartItemModel.rating.rate}"),
                ],
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => context.read<CartCubit>().deleteProductFromCart(
                cartItemModel.id,
              ),
              child: Icon(Icons.delete, color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
