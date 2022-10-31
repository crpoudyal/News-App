import 'package:News_API/pages/splash_page.dart';
import 'package:News_API/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News_API',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeUtils.lightTheme,
      darkTheme: ThemeUtils.darkTheme,
      home: SplashPage(),
    );
  }
}
