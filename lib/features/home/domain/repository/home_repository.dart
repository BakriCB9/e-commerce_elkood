import 'package:ecommerce_elk/core/network/common/api_result.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';

abstract interface class HomeRepository {
  Future<Result<List<ProductEntity>>> getAllProduct();
}