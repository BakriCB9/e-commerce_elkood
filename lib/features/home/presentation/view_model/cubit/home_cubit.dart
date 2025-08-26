import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/network/common/api_result.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/domain/use_case/get_product_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getProductUseCase) : super(HomeState());
  final GetProductUseCase _getProductUseCase;

  getProducts() async {
    emit(state.copyWith(productState: BaseLoadingState()));
    final result = await _getProductUseCase();
    switch (result) {
      case SuccessResult():
        {
          emit(
            state.copyWith(
              productState:
                  BaseSuccessState<(List<String>, List<ProductEntity>)>(
                    data: result.data,
                  ),
            ),
          );
        }
      case FailureResult():
        emit(
          state.copyWith(
            productState: BaseErrorState(errorMessage: result.errorMessage),
          ),
        );
    }
  }
}
