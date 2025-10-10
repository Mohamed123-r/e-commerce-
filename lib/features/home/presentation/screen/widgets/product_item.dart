import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.product});

  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    product!.imageUrl,
                    errorBuilder: (context, error, stackTrace) =>
                        Center(child: Icon(Icons.error)),

                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  child: IconButton(
                    icon: SvgPicture.asset(Assets.imagesHeart),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product!.name,
                style: AppTextStyles.style13Medium(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '\$ ${product!.price.toStringAsFixed(2)}',
                style: AppTextStyles.style15Medium(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
