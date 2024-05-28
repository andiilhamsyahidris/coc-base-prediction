import 'package:coc_base_prediction/presentation/bases/resources/route_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/theme_res.dart';
import 'package:flutter/material.dart';

class CocApp extends StatefulWidget {
  const CocApp._internal();
  static const CocApp instance = CocApp._internal();

  factory CocApp() => instance;

  @override
  State<CocApp> createState() => _CocAppState();
}

class _CocAppState extends State<CocApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: CocRoute.splashRoute,
      theme: getCocTheme(false),
      darkTheme: getCocTheme(true),
    );
  }
}
