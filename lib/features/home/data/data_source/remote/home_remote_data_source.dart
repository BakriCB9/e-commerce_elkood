import 'package:ecommerce_elk/features/home/data/model/product_response_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<ProductResponseModel> getAllProduct();
}
