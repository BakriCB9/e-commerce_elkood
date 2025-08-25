import 'package:ecommerce_elk/core/constant/app_values.dart';
import 'package:ecommerce_elk/core/di/service_locator.dart';
import 'package:ecommerce_elk/core/routes/route_generator.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/core/theme/app_theme.dart';
import 'package:ecommerce_elk/core/utils/app_shared_prefrence.dart';
import 'package:ecommerce_elk/core/utils/bloc_observer.dart';
import 'package:ecommerce_elk/features/auth/presentation/view/login_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoutes,
      theme: AppTheme.lightTheme,
      title: AppValues.appTitle,
      initialRoute: Routes.loginScreen,
    );
  }
}
