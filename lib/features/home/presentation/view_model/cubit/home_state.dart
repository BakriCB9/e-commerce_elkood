part of 'home_cubit.dart';

 class HomeState extends Equatable {
 final  BaseState? productState;
  const HomeState({this.productState});
  
  HomeState copyWith({BaseState? productState}){
    return HomeState(productState: productState ??this.productState);
  }
  @override
  List<Object?> get props => [productState];
}


