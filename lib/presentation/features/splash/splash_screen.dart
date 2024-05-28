import 'dart:async';

import 'package:coc_base_prediction/presentation/bases/resources/asset_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/value_res.dart';
import 'package:coc_base_prediction/presentation/features/home/home_screen.dart';
import 'package:coc_base_prediction/presentation/widgets/coc_backgrounds.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: CocBackgroundSplash(),
        child: Center(
          child: Image.asset(
            CocImageAssets.logo,
            width: getScreenWidth(100),
          ),
        ),
      ),
    );
  }
}
