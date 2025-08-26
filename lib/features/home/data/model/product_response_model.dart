import 'package:ecommerce_elk/features/home/data/model/product_model.dart';

class ProductResponseModel {
  final List<Product> listOfProducts;
  ProductResponseModel({required this.listOfProducts});

  factory ProductResponseModel.fromJson(List<dynamic> data) {
    return ProductResponseModel(
      listOfProducts: data
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
