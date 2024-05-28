import 'package:coc_base_prediction/presentation/bases/resources/string_res.dart';
import 'package:coc_base_prediction/presentation/features/home/home_screen.dart';
import 'package:coc_base_prediction/presentation/features/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CocRoute {
  static const String splashRoute = '/';
  static const String mainRoute = '/main';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case CocRoute.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case CocRoute.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(CocStrings.noRouteFound.tr()),
            ),
            body: Center(child: Text(CocStrings.noRouteFound.tr())),
          ));
}
