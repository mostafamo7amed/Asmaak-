import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

AppBar buildAdminAppBar(context, {String title = '', bool showBack = false}) {
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
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: Styles.bold19.copyWith(color: AppColor.primaryColor),
    ),
    actions: [
      Visibility(
        visible: showBack,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      )
    ],
  );
}
