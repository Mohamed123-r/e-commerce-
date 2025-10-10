import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_style.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.category});

  final CategoryEntity category;

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
            child: Center(
              child: SvgPicture.network(category.imageUrl, fit: BoxFit.scaleDown),
            ),
          ),
          const SizedBox(width: 8),
          Text(category.name, style: AppTextStyles.style15Regular(context)),
        ],
      ),
    );
  }
}
