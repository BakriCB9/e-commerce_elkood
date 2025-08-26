import 'package:ecommerce_elk/core/di/service_locator.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/features/app_section/app_section.dart';
import 'package:ecommerce_elk/features/auth/presentation/view/login_screen.dart';
import 'package:ecommerce_elk/features/auth/presentation/view/register_screen.dart';
import 'package:ecommerce_elk/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/presentation/view/details_screen.dart';
import 'package:ecommerce_elk/features/home/presentation/view/search_screen.dart';
import 'package:ecommerce_elk/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? getRoutes(RouteSettings setting) {
    final arg = setting.arguments;
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator.get<AuthCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => serviceLocator.get<AuthCubit>(),
            child: RegisterScreen(),
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) =>
              SearchScreen(listOfProducts: arg as List<ProductEntity>),
        );
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(productEntity: arg as ProductEntity),
        );
      case Routes.appSection:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => serviceLocator.get<HomeCubit>()..getProducts(),
              ),
              BlocProvider(
                create: (_) =>
                    serviceLocator.get<CartCubit>()..getCartProducts(),
              ),
            ],
            child: AppSection(),
          ),
        );
    }
    return null;
  }
}
