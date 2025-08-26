import 'package:ecommerce_elk/core/constant/app_assets.dart';
import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/core/utils/custom_cache_network_image.dart';
import 'package:ecommerce_elk/features/cart/presentation/model/cart_item_model.dart';
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ItemOfGridView extends StatelessWidget {
  final ProductEntity productEntity;
  const ItemOfGridView({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          color: Colors.white,
          border: Border.all(color: AppColors.pink, width: 0.5),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: CustomCacheNetworkImage(imageUrl: productEntity.image),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              productEntity.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text("price: ${productEntity.price}"),
            Text("rate: ${productEntity.rating.rate}"),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                textStyle: TextStyle(fontSize: 15),
              ),
              onPressed: () => context.read<CartCubit>().addProductToCart(
                CartItemModel(
                  id: productEntity.id,
                  title: productEntity.title,
                  price: productEntity.price,
                  description: productEntity.description,
                  category: productEntity.category,
                  image: productEntity.image,
                  rating: RatingItemCart(
                    rate: productEntity.rating.rate,
                    count: productEntity.rating.count,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SvgAssets.cartSvg, color: AppColors.white),
                  Text("Add to cart"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
