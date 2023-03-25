import 'package:News_API/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.whiteColor,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.whiteColor,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.blackColor,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.blackColor,
      ));
}
