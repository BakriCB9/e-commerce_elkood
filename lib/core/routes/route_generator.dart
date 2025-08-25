import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? getRoutes(RouteSettings setting){
    final arg=setting.arguments;
    switch(setting.name){
     case  Routes.loginScreen :
      //  return  PageRouteBuilder(pageBuilder: pageBuilder);
    }
    return null;
  }
}