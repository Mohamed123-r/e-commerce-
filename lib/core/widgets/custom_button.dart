import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    this.color = AppColors.purpleColor2,
    this.isMinWidth = false,
    required this.onPressed,
  });

  final String title;

  final String? icon;

  final Color color;

  final bool isMinWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: isMinWidth ? 160 : MediaQuery.of(context).size.width,
      height: 46,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null ? const SizedBox() : SvgPicture.asset(icon!),
          SizedBox(width: icon != null ? 8 : 0),
          Text(
            title,
            style: AppTextStyles.style14W600SemiBold(
              context,
            ).copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
