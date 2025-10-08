import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/features/home/presentation/screen/product_detail_screen.dart';
import 'package:e_commerce/features/home/presentation/screen/widgets/brand_item.dart';
import 'package:e_commerce/features/home/presentation/screen/widgets/product_item.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

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
            SliverAppBar(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
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
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            final brands = [
                              {'name': 'Nike', 'logo': Assets.imagesTest2},
                              {'name': 'Adidas', 'logo': Assets.imagesTest2},
                              {'name': 'Puma', 'logo': Assets.imagesTest2},
                              {'name': 'Reebok', 'logo': Assets.imagesTest2},
                              {
                                'name': 'Under Armour',
                                'logo': Assets.imagesTest2,
                              },
                            ];
                            return Padding(
                              padding:  EdgeInsets.only(
                                  left: index == 0 ? 16.0 : 0, right: index==4 ? 16.0 : 0
                              ),
                              child: BrandItem(
                                name: brands[index]['name']!,
                                logoPath: brands[index]['logo']!,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                        ),
                      ),
                    ],
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
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.60,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProductDetailScreen.routeName);
                    },
                    child: ProductItem(),
                  );
                }, childCount: 10),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height:20)),
          ],
        ),
      ),
    );
  }
}


