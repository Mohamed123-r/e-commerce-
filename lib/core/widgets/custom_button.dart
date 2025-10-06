import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});

  final String title;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      color: AppColors.purpleColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: AppTextStyles.style17Medium(
          context,
        ).copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
