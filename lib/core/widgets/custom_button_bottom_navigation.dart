
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class CustomButtonBottomNavigation extends StatelessWidget {
  const CustomButtonBottomNavigation({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 75,
      color: AppColors.purpleColor,
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.style17Medium(
          context,
        ).copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}

