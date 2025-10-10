import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/entities/product_entity.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  static const String routeName = '/productDetail';
  final ProductEntity product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSizeIndex = 0;
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.whiteColor,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: AppColors.black20Color),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.whiteColor,
              child: IconButton(
                icon: SvgPicture.asset(
                  Assets.imagesHeart,
                  color: AppColors.black20Color,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Image.network(
                widget.product.imageUrl,
                height: 500,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Product Title and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name',
                            style: AppTextStyles.style13Regular(
                              context,
                            ).copyWith(color: AppColors.grey9EColor),
                          ),
                          const Spacer(),
                          Text(
                            'Price',
                            style: AppTextStyles.style13Regular(
                              context,
                            ).copyWith(color: AppColors.grey9EColor),
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.style22SemiBold(context),
                            ),
                          ),
                          Text(
                            '\$ ${widget.product.price}',
                            style: AppTextStyles.style22SemiBold(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Size', style: AppTextStyles.style17Medium(context)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() => selectedSizeIndex = index),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizeItem(
                              isSelected: selectedSizeIndex == index,
                              size: sizes[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppTextStyles.style17Medium(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.product.description,
                        style: AppTextStyles.style15Regular(
                          context,
                        ).copyWith(color: AppColors.grey9EColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: AppTextStyles.style17Medium(context),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: AppTextStyles.style13Regular(
                            context,
                          ).copyWith(color: AppColors.grey9EColor),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Number of reviews:  ${widget.product.reviewsCount.toString()}",
                                  style: AppTextStyles.style15Medium(context),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.product.rating.toString(),
                                          style: AppTextStyles.style15Medium(
                                            context,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'rating',
                                          style:
                                          AppTextStyles.style11Medium(
                                            context,
                                          ).copyWith(
                                            color: AppColors.grey9EColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                            (i) => Icon(
                                          i < widget.product.rating.floor()
                                              ? Icons.star
                                              : Icons.star_border,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: AppTextStyles.style15Medium(context),
                              ),
                              Text(
                                'with VAT',
                                style: AppTextStyles.style11Regular(
                                  context,
                                ).copyWith(color: AppColors.grey9EColor),
                              ),
                            ],
                          ),
                          Text(
                            '\$ ${widget.product.price}',
                            style: AppTextStyles.style17Medium(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonBottomNavigation(
        title: "Add to Cart",
        onPressed: () {},
      ),
    );
  }
}

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key,
    required this.isSelected,
    required this.size,
  });

  final bool isSelected;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.purpleColor
            : AppColors.greyFAColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          size,
          style: AppTextStyles.style17Medium(context).copyWith(
            color: isSelected ? Colors.white : AppColors.grey9EColor,
          ),
        ),
      ),
    );
  }
}