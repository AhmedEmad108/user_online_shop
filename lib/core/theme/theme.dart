import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Cairo',
  scaffoldBackgroundColor: AppColor.white,
  primaryColor: AppColor.primaryColor,
  useMaterial3: false,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.transparent,
    elevation: 0.0,
    titleTextStyle: AppStyle.styleBold30().copyWith(
      color: AppColor.black,
    ),
    iconTheme: const IconThemeData(color: AppColor.black),
    centerTitle: true,
    foregroundColor: AppColor.black,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColor.black,
    secondary: AppColor.grey,
    tertiary: AppColor.grey3,
    onTertiary: AppColor.lightPrimaryColor.withOpacity(0.2),
    shadow: AppColor.grey,
    onPrimary: AppColor.white,
    onSecondary: AppColor.white,
    onSurface: AppColor.grey5,
  ),
  textTheme: TextTheme(
    bodySmall: AppStyle.styleSemiBold18().copyWith(
      color: AppColor.grey2,
    ),
    bodyMedium: AppStyle.styleSemiBold22().copyWith(
      color: AppColor.black,
    ),
    titleLarge: AppStyle.styleBold30(),
    // bodyMedium: TextStyle(
    //   color: AppColor.black,
    // ),
  ),
  // iconTheme: const IconThemeData(
  //   color: AppColor.black,
  // ),
  // inputDecorationTheme: const InputDecorationTheme(
  //   enabledBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(color: AppColor.black),
  //   ),
  // ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColor.grey3Dark,
  primaryColor: AppColor.primaryColor,
  useMaterial3: false,
  fontFamily: 'Cairo',
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.transparent,
    elevation: 0.0,
    titleTextStyle: AppStyle.styleBold30().copyWith(
      color: AppColor.white,
    ),
    iconTheme: const IconThemeData(color: AppColor.white),
    centerTitle: true,
    foregroundColor: AppColor.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColor.white,
    secondary: AppColor.white,
    tertiary: AppColor.grey900,
    onTertiary: AppColor.grey900,
    shadow: AppColor.grey900,
    onPrimary: AppColor.black,
    onSecondary: AppColor.grey3Dark,
    onSurface: AppColor.grey5,
  ),
  textTheme: TextTheme(
    bodySmall: AppStyle.styleSemiBold18().copyWith(
      color: AppColor.grey,
    ),
    bodyMedium: AppStyle.styleSemiBold22().copyWith(
      color: AppColor.white,
    ),
    titleLarge: AppStyle.styleBold30().copyWith(
      color: AppColor.white,
    ),
  ),
);
