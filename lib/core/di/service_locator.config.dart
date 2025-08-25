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
    gh.singleton<_i464.ApiManager>(() => _i464.ApiManager());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providerInterceptor(),
    );
    return this;
  }
}

class _$DioModule extends _i225.DioModule {}
