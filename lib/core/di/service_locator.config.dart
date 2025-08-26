// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_elk/core/network/remote/api_manager.dart' as _i464;
import 'package:ecommerce_elk/core/network/remote/dio_module.dart' as _i225;
import 'package:ecommerce_elk/features/auth/presentation/view_model/cubit/auth_cubit.dart'
    as _i429;
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart'
    as _i971;
import 'package:ecommerce_elk/features/home/data/data_source/remote/home_remote_data_source.dart'
    as _i157;
import 'package:ecommerce_elk/features/home/data/data_source/remote/home_remote_data_source_impl.dart'
    as _i406;
import 'package:ecommerce_elk/features/home/data/repository_impl.dart/home_repositroy_impl.dart'
    as _i849;
import 'package:ecommerce_elk/features/home/domain/repository/home_repository.dart'
    as _i633;
import 'package:ecommerce_elk/features/home/domain/use_case/get_product_use_case.dart'
    as _i117;
import 'package:ecommerce_elk/features/home/presentation/view_model/cubit/home_cubit.dart'
    as _i720;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i429.AuthCubit>(() => _i429.AuthCubit());
    gh.factory<_i971.CartCubit>(() => _i971.CartCubit());
    gh.singleton<_i464.ApiManager>(() => _i464.ApiManager());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providerInterceptor(),
    );
    gh.factory<_i157.HomeRemoteDataSource>(
      () => _i406.HomeRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i633.HomeRepository>(
      () => _i849.HomeRepositroyImpl(
        gh<_i157.HomeRemoteDataSource>(),
        gh<_i464.ApiManager>(),
      ),
    );
    gh.factory<_i117.GetProductUseCase>(
      () => _i117.GetProductUseCase(gh<_i633.HomeRepository>()),
    );
    gh.factory<_i720.HomeCubit>(
      () => _i720.HomeCubit(gh<_i117.GetProductUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i225.DioModule {}
