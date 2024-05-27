import 'package:flutter/material.dart';

var toolbarHeight = getScreenHeight(75);

class CocSpace {
  static const double noSpace = 0.0;
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}

class CocCardSize {
  static double xl = CocSizeConfig.screenWidth * 0.92;
}

class CocIconSize {
  static const double sm = 15;
  static const double md = 24;
  static const double lg = 28;
}

class CocCircleButtonSize {
  static const double md = 48;
}

class CocToolbar {
  static const double height = 56.0;
}

class CocImageSize {
  static const double thumbnailMd = 100.0;
  static const double thumbnailLg = 150.0;
  static const double iconAction = 28.0;
  static const double logoHeight = 64.0;
  static const double logoAppbar = 35.0;
}

class CocProgressIndicator {
  static const double radius = 50.0;
  static const double width = 10.0;
}

class CocRadius {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double cardRadius = 20.0;
  static const double iconAvatar = 24.0;
  static const double lg = 32.0;
  static const double avatarRadius = 48.0;
  static const double xl = 64.0;
  static const double circle = 100.0;
  static const double blurRadius = 10.0;
}

class CocElevation {
  static const double level0 = 0;
  static const double level1 = 1.5;
  static const double level2 = 2.5;
  static const double cardElevation = 5;
}

class CocPadding {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double iconpad = 12.0;
  static const double md = 16.0;
  static const double cardPadding = 18.0;
  static const double lg = 24.0;
  static const double menuPadding = 28.0;
  static const double xl = 32.0;
  static const double horizontalMain = 35.0;
  static const double topMain = 50.0;
}

class CocSizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getScreenHeight(double inputHeight) {
  return (inputHeight / 812.0) * CocSizeConfig.screenHeight;
}

double getScreenWidth(double inputWidth) {
  return (inputWidth / 375.0) * CocSizeConfig.screenWidth;
}
