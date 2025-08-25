import 'package:ecommerce_elk/core/constant/app_values.dart';
import 'package:ecommerce_elk/core/di/service_locator.dart';
import 'package:ecommerce_elk/core/routes/route_generator.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([configureDependencies()]);
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
     home: Container(),
    );
  }
}
