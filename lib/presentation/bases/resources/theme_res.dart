import 'package:coc_base_prediction/presentation/bases/resources/color_res.dart';
import 'package:flutter/material.dart';

ThemeData getCocTheme(bool isDark) {
  return ThemeData(
    primaryColor: CocColor.mainColor,
    brightness: isDark ? Brightness.dark : Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: CocColor.mainColor,
      onPrimary: CocColor.textColor,
      error: CocColor.errorColor,
      background: isDark ? CocColor.textColorDark : CocColor.bgColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
    ),
  );
}
