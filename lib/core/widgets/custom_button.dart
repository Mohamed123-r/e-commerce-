import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed,  this.isMinWidth =false,  this.isSecondary=false});

  final String title;

  final VoidCallback onPressed;
  final bool isMinWidth ;
  final bool isSecondary ;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth:isMinWidth ? 200 : MediaQuery.of(context).size.width,
      height: 50,
      color: isSecondary ?AppColors.grey9EColor :  AppColors.purpleColor,
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
