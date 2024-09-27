import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/splash/splash_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor App',
      theme: AppTheme.light(context),
      home: const SplashScreen(),
    );
  }
}
