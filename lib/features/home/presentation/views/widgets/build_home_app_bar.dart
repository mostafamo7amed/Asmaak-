import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

AppBar buildHomeAppBar(context) {
  return AppBar(
    toolbarHeight: 70,
    shadowColor: AppColor.lightGrayColor,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        radius: 25,
        child: SvgPicture.asset(
          AssetsData.profile,
          height: 25,
          width: 25,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
        ),
      ),
    ),
    centerTitle: true,
    titleSpacing: 0,
    title: Column(
      children: [
        Text(
          'أَسْمَعُك',
          textAlign: TextAlign.center,
          style: Styles.bold19.copyWith(color: AppColor.primaryColor),
        ),
        Text(
          'لغه الاشاره العربيه',
          textAlign: TextAlign.center,
          style: Styles.bold13.copyWith(color: AppColor.primaryColor),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '10',
                style: Styles.bold13.copyWith(color: AppColor.primaryColor),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                AssetsData.coins,
                fit: BoxFit.scaleDown,
              ),
            ]),
            const SizedBox(
              height: 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '5',
                style: Styles.bold13.copyWith(color: AppColor.primaryColor),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                AssetsData.diamond,
                fit: BoxFit.scaleDown,
              ),
            ])
          ],
        ),
      )
    ],
  );
}
