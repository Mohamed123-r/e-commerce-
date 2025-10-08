import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static const String routeName = '/productDetail';

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
            Image.asset(
              Assets.imagesTest1,
              height: 500,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Product Title and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Men\'s Printed Pullover Hoodie',
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
                          Text(
                            'Nike Club Fleece',
                            style: AppTextStyles.style22SemiBold(context),
                          ),
                          Text(
                            '\$120',
                            style: AppTextStyles.style22SemiBold(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Size', style: AppTextStyles.style17Medium(context)),
                      Text(
                        'Size Guide',
                        style: AppTextStyles.style15Regular(
                          context,
                        ).copyWith(color: AppColors.grey9EColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 60,

                    child: GestureDetector(
                      onTap: () => setState(() {}),
                      child: Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: SizeItem(
                              selectedSizeIndex: false,
                              sizes: sizes[0],
                            ),
                          ),
                          Expanded(
                            child: SizeItem(
                              selectedSizeIndex: true,
                              sizes: sizes[1],
                            ),
                          ),
                          Expanded(
                            child: SizeItem(
                              selectedSizeIndex: false,
                              sizes: sizes[2],
                            ),
                          ),
                          Expanded(
                            child: SizeItem(
                              selectedSizeIndex: false,
                              sizes: sizes[3],
                            ),
                          ),
                          Expanded(
                            child: SizeItem(
                              selectedSizeIndex: false,
                              sizes: sizes[4],
                            ),
                          ),
                        ],
                      ),
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
                        'The Nike Throwback Pullover Hoodie is made from Nike Throwback Terry fabric that blends performance feel with a cozy fleece.',
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
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              Assets.imagesTest2,
                            ), // Assume image
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ron Richards',
                                      style: AppTextStyles.style15Medium(
                                        context,
                                      ),
                                    ),
                                    Text(
                                      '13 Sep 2020',
                                      style: AppTextStyles.style11Regular(
                                        context,
                                      ).copyWith(color: AppColors.grey9EColor),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '4.0',
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
                                          i < 4
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
                      const SizedBox(height: 4),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget...',
                        style: AppTextStyles.style15Regular(
                          context,
                        ).copyWith(color: AppColors.grey9EColor),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
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
                            '\$125',
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
    required this.selectedSizeIndex,
    required this.sizes,
  });

  final bool selectedSizeIndex;
  final String sizes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,

      decoration: BoxDecoration(
        color: selectedSizeIndex
            ? AppColors.purpleColor
            : AppColors.greyFAColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          sizes,
          style: AppTextStyles.style17Medium(context).copyWith(
            color: selectedSizeIndex ? Colors.white : AppColors.grey9EColor,
          ),
        ),
      ),
    );
  }
}
