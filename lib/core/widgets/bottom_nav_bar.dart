import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  static const String routeName = '/bottomNavBar';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
      }),

      items: [
        FlashyTabBarItem(
          icon: SvgPicture.asset(Assets.imagesHome),
          title: Text(
            'Home',
            style: AppTextStyles.style15Medium(
              context,
            ).copyWith(color: AppColors.purpleColor),
          ),
        ),
        FlashyTabBarItem(
          icon: SvgPicture.asset(Assets.imagesHeart),
          title: Text(
            'Wishlist',
            style: AppTextStyles.style15Medium(
              context,
            ).copyWith(color: AppColors.purpleColor),
          ),
        ),
        FlashyTabBarItem(
          icon: SvgPicture.asset(Assets.imagesBag),
          title: Text(
            'Cart',
            style: AppTextStyles.style15Medium(
              context,
            ).copyWith(color: AppColors.purpleColor),
          ),
        ),
        FlashyTabBarItem(
          icon: SvgPicture.asset(Assets.imagesWallet),
          title: Text(
            'Wallet',
            style: AppTextStyles.style15Medium(
              context,
            ).copyWith(color: AppColors.purpleColor),
          ),
        ),
      ],
    );
  }
}
