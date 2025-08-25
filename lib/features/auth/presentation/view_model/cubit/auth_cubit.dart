import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/constant/app_values.dart';
import 'package:ecommerce_elk/core/utils/app_shared_prefrence.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  login(String email) async {
    emit(state.copyWith(loginState: BaseLoadingState()));

    await Future.delayed(Duration(seconds: 2));
    await SharedPreferencesUtils.saveData(key: AppValues.email, value: email);

    emit(state.copyWith(loginState: BaseSuccessState()));
  }

  register(String email, String userName) async {
    emit(state.copyWith(registerState: BaseLoadingState()));
    await Future.delayed(Duration(seconds: 2));
    await SharedPreferencesUtils.saveData(key: AppValues.email, value: email);
    await SharedPreferencesUtils.saveData(
      key: AppValues.userName,
      value: userName,
    );
    emit(state.copyWith(registerState: BaseSuccessState()));
  }
}
