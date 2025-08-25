part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final BaseState? loginState;
  final BaseState? registerState;
  const AuthState({this.loginState, this.registerState});

  AuthState copyWith({BaseState? loginState, BaseState? registerState}) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
    );
  }

  @override
  List<Object?> get props => [loginState, registerState];
}
