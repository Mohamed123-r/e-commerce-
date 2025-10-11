import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/features/home/presentation/screen/product_detail_screen.dart';
import 'package:e_commerce/features/home/presentation/screen/widgets/product_item.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  static const String routeName = '/category';
  final CategoryEntity category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        context,
        widgetTitle: Container(
          width: 70,
          height: 45,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.greyFAColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SvgPicture.network(
              widget.category.imageUrl,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 88),
              Row(
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "333 items",
                        style: AppTextStyles.style17Medium(context),
                      ),
                      Text(
                        "Available in stock",
                        style: AppTextStyles.style15Regular(
                          context,
                        ).copyWith(color: AppColors.grey9EColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.greyFAColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sort),
                        const SizedBox(width: 4),
                        Text(
                          "Sort",
                          style: AppTextStyles.style15Medium(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailScreen.routeName,
                      // arguments: state is ProductSuccess
                      //     ? state.products[index]
                      //     : null,
                    );
                  },
                  child: ProductItem(
                    product: ProductEntity(
                      id: "1",
                      name: 'Product 1',
                      price: 100,
                      imageUrl:
                          'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                      description: 'Description 1',
                      stock: 10,
                      rating: 4.5,
                      color: 'red',
                      reviewsCount: 10,
                      weight: 10,
                    ),
                    // state is ProductSuccess
                    //     ? state.products[index]
                    //     : null,
                  ),
                ),

                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
