
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class CustomButtonBottomNavigation extends StatelessWidget {
  const CustomButtonBottomNavigation({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback onPressed;
 final  bool isLoading ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 75,
      color: AppColors.purpleColor,
      onPressed: onPressed,
      child:
      isLoading
          ? const CircularProgressIndicator(
              color: AppColors.whiteColor,
            )
          :


      Text(
        title,
        style: AppTextStyles.style17Medium(
          context,
        ).copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}

