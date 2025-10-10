import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/features/home/presentation/cubits/product_cubit.dart';
import 'package:e_commerce/features/home/presentation/screen/product_detail_screen.dart';
import 'package:e_commerce/features/home/presentation/screen/widgets/brand_item.dart';
import 'package:e_commerce/features/home/presentation/screen/widgets/product_item.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/bottom_nav_bar.dart';
import '../cubits/category_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    context.read<CategoryCubit>().fetchCategory();
    context.read<ProductCubit>().fetchProducts();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeSliverAppBar(searchController: _searchController),
            BrandBlocBuild(),
            ProductBlocBuild(),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}

class BrandBlocBuild extends StatelessWidget {
  const BrandBlocBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SliverFillRemaining(
            child: SizedBox(
                child: Center(child: CircularProgressIndicator())),
          );
        } else if (state is CategoryFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                'Error: ${state.message}',
                style: AppTextStyles.style17Medium(
                  context,
                ).copyWith(color: AppColors.redColor),
              ),
            ),
          );
        } else if (state is CategorySuccess) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Brand',
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
                ),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.category.length,
                    itemBuilder: (context, index) =>
                        BrandItem(category: state.category[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arraival',
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
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        }
        return const SliverFillRemaining(child: SizedBox.shrink());
      },
    );
  }
}

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: true,

      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            radius: 23,
            backgroundColor: AppColors.greyFAColor,
            child: SvgPicture.asset(Assets.imagesMenu),
          ),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 23,
            backgroundColor: AppColors.greyFAColor,
            child: IconButton(
              icon: SvgPicture.asset(
                Assets.imagesBag,
                color: AppColors.black20Color,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],

      backgroundColor: Colors.transparent,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: AppTextStyles.style15Regular(
                      context,
                    ).copyWith(color: AppColors.grey9EColor),
                    prefixIcon: SvgPicture.asset(
                      Assets.imagesSearch,
                      fit: BoxFit.scaleDown,
                    ),
                    filled: true,
                    fillColor: AppColors.greyFAColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.purpleColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesVoice,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductBlocBuild extends StatelessWidget {
  const ProductBlocBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.purpleColor),
            ),
          );
        } else if (state is ProductFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                'Error: ${state.message}',
                style: AppTextStyles.style17Medium(
                  context,
                ).copyWith(color: AppColors.redColor),
              ),
            ),
          );
        } else {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.60,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProductDetailScreen.routeName,
                      );
                    },
                    child: ProductItem(
                      product: state is ProductSuccess
                          ? state.products[index]
                          : null,
                    ),
                  );
                },
                childCount: state is ProductSuccess ? state.products.length : 0,
              ),
            ),
          );
        }
      },
    );
  }
}
