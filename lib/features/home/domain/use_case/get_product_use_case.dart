import 'package:ecommerce_elk/core/network/common/api_result.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUseCase {
  final HomeRepository _homeRepository;
  const GetProductUseCase(this._homeRepository);
  Future<Result<(List<String>, List<ProductEntity>)>> call() async {
    final result = await _homeRepository.getAllProduct();
    switch (result) {
      ///! i do that beacuse Cubit do not have to make action it have to only manage state of data 
      ///? i make list of category from list of Product 
      case SuccessResult():
        {
          final listOfCategory = result.data
              .map((e) => e.category)
              .toSet()
              .toList();
          return SuccessResult<(List<String>, List<ProductEntity>)>((
            listOfCategory,
            result.data,
          ));
        }
      case FailureResult():
        return FailureResult(result.errorMessage);
    }
  }
}
