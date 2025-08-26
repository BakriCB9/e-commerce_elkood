import 'package:ecommerce_elk/core/network/common/api_result.dart';
import 'package:ecommerce_elk/core/network/remote/api_manager.dart';
import 'package:ecommerce_elk/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositroyImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final ApiManager _apiManager;
  HomeRepositroyImpl(this._homeRemoteDataSource, this._apiManager);
  @override
  Future<Result<List<ProductEntity>>> getAllProduct() async {
    final result = await _apiManager.execute(() {
      return _homeRemoteDataSource.getAllProduct();
    });
    switch (result) {
      case SuccessResult():
        return SuccessResult(
          result.data.listOfProducts.map((e) => e.toProductEntity()).toList(),
        );

      case FailureResult():
        return FailureResult(result.errorMessage);
    }
  }
}
