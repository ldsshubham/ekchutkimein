import 'package:constructo_user/src/routing/apppages.dart';
import 'package:constructo_user/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Cunstructo',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}