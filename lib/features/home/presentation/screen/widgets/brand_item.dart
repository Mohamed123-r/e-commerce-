import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.name, required this.logoPath});

  final String name;
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.greyFAColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Image.asset(logoPath, width: 24, height: 24)),
          ),
          const SizedBox(width: 8),
          Text(name, style: AppTextStyles.style15Regular(context)),
        ],
      ),
    );
  }
}
