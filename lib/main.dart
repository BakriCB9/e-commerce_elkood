import 'package:ecommerce_elk/core/constant/app_values.dart';
import 'package:ecommerce_elk/core/di/service_locator.dart';
import 'package:ecommerce_elk/core/routes/route_generator.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/core/theme/app_theme.dart';
import 'package:ecommerce_elk/core/utils/app_shared_prefrence.dart';
import 'package:ecommerce_elk/core/utils/bloc_observer.dart';
import 'package:ecommerce_elk/features/cart/presentation/view_model.dart/cubit/cart_cubit.dart';
import 'package:ecommerce_elk/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([configureDependencies(), SharedPreferencesUtils.init()]);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider  (
          create: (context) => serviceLocator.get<HomeCubit>()..getProducts(),
        )    ,
        BlocProvider  (
          create: (context) => serviceLocator.get<CartCubit>()..getCartProducts(),
        ),
      ],  
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoutes,
        theme: AppTheme.lightTheme,
        title: AppValues.appTitle,
        initialRoute: SharedPreferencesUtils.getString(AppValues.email) == null
            ? Routes.loginScreen
            : Routes.appSection,
      ),
    );
  }
}
