import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      title: 'Bookly App',
      home: const SplashView(),
    );
  }
}
