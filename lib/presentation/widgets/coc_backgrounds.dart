import 'package:coc_base_prediction/presentation/bases/resources/asset_res.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BoxDecoration CocBackgroundSplash() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(CocImageAssets.backgroundSplash),
          fit: BoxFit.cover));
}
