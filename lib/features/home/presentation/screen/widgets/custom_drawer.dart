import 'package:e_commerce/core/helper_functions/custom_dialog.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/features/auth/start_screen.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart'; // Assuming SVG icons

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            GestureDetector(
              onTap: () => Scaffold.of(context).closeDrawer(),
              child: CircleAvatar(
                radius: 23,
                backgroundColor: AppColors.greyFAColor,
                child: Transform.rotate(
                  angle: 7.85,

                  child: SvgPicture.asset(Assets.imagesMenu),
                ),
              ),
            ),

            SizedBox(),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      AppColors.grey9EColor, // Replace with actual image
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Mohamed Attalla",
                        style: AppTextStyles.style17Medium(context),
                      ),
                      Text(
                        'Verified Profile',
                        style: AppTextStyles.style13Regular(
                          context,
                        ).copyWith(color: AppColors.grey9EColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                DrawerItem(title: "Dark Mode", icon: Assets.imagesSun),
                Spacer(),
                Switch(value: false, onChanged: (val) {}),
              ],
            ),
            DrawerItem(
              title: "Account Information",
              icon: Assets.imagesInfoCircle,
            ),
            DrawerItem(title: "Password", icon: Assets.imagesLock),
            DrawerItem(title: "Order", icon: Assets.imagesBag),
            DrawerItem(title: "My Cards", icon: Assets.imagesWallet),
            DrawerItem(title: "Wishlist", icon: Assets.imagesHeart),
            DrawerItem(title: "Settings", icon: Assets.imagesSetting),

            Spacer(),

            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              onTap: () {
                customWarning(
                  context,
                  massage: "You have been logged out!",
                  onPressed: () {
                    CacheHelper.sharedPreferences.setBool(kIsLogin, false);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      StartScreen.routeName,
                      (route) => false,
                    );
                  },
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesLogout),
                  SizedBox(width: 12),
                  Text(
                    'Logout',
                    style: AppTextStyles.style15Medium(
                      context,
                    ).copyWith(color: AppColors.redColor),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.title, required this.icon});

  final String title;

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 25,
          height: 25,
          fit: BoxFit.scaleDown,
          color: AppColors.black20Color,
        ),
        SizedBox(width: 12),
        Text(title, style: AppTextStyles.style15Regular(context)),
      ],
    );
  }
}

// Usage: Scaffold(drawer: CustomDrawer(), ...)
