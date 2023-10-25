import 'package:bookly/features/splash/presentation/views/widget/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
