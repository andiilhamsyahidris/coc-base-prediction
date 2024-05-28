import 'package:coc_base_prediction/presentation/bases/resources/asset_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/value_res.dart';
import 'package:coc_base_prediction/presentation/widgets/coc_backgrounds.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
