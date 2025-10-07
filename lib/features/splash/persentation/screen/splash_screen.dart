import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../auth/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, StartScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purpleColor,
      child: Center(
        child: Image.asset(Assets.imagesLogo, width: 60, height: 40),
      ),
    );
  }
}
