import 'package:user_online_shop/core/utils/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleBold52() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 52),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular24() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 24),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold30() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 30),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold13() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 13),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold24() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 24),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleSemiBold22() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 22),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 18),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular13() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 13),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleBold16() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 16),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold22() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 22),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold17() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 16),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold28() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 28),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleRegular22() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 22),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleSemiBold11() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 11),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium15() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 15),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular26() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 26),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleRegular16() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 16),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleRegular11() {
    return TextStyle(
      fontSize: getResponsiveFonetSize(fontSize: 11),
      fontWeight: FontWeight.normal,
    );
  }
}

double getResponsiveFonetSize({required double fontSize}) {
  double scaleFactor = getScaleFactor(/*context*/);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(/*BuildContext context*/) {
  // double width = MediaQuery.of(context).size.width;
  var platform = PlatformDispatcher.instance;
  var physicalSizeWidth = platform.views.first.physicalSize.width;
  var devicePixelRatio = platform.views.first.devicePixelRatio;
  var width = physicalSizeWidth / devicePixelRatio;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1536;
  }
}
