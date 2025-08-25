import 'package:ecommerce_elk/core/di/service_locator.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/features/app_section/app_section.dart';
import 'package:ecommerce_elk/features/auth/presentation/view/login_screen.dart';
import 'package:ecommerce_elk/features/auth/presentation/view/register_screen.dart';
import 'package:ecommerce_elk/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_elk/features/home/presentation/view/home_screen.dart';
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

      case Routes.appSection:
        return MaterialPageRoute(builder: (_) => AppSection());
    }
    return null;
  }
}
