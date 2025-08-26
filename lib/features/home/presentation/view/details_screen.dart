import 'package:ecommerce_elk/core/utils/custom_cache_network_image.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const DetailsScreen({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: CustomCacheNetworkImage(imageUrl: productEntity.image),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price: ${productEntity.price}"),
                  Text("rate: ${productEntity.rating.rate}"),
                ],
              ),
              Text(
                "description",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(productEntity.description),
            ],
          ),
        ),
      ),
    );
  }
}
