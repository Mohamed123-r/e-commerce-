import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppBar(
  BuildContext context, {
  Widget widgetTitle = const SizedBox(),
}) {
  return AppBar(
    centerTitle: true,
    title: widgetTitle,
    leading: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          radius: 23,
          backgroundColor:AppColors.greyFAColor ,
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
          backgroundColor: AppColors.greyFAColor ,
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
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
