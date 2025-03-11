import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/my_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

AppBar customAppBar(
  context, {
  required String title,
  bool showProgress = true,
  showBack = true,
  showProfile = true,
  currentProgress = 1,
  totalProgress = 50,
}) {
  return AppBar(
    toolbarHeight: 70,
    shadowColor: AppColor.lightGrayColor,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    leadingWidth: MediaQuery.of(context).size.width / 3,
    leading: Visibility(
      visible: showProfile,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, MyProfileView.routeName,
                  arguments: true),
              child: CircleAvatar(
                radius: 20,
                child: SvgPicture.asset(
                  AssetsData.profile,
                  height: 25,
                  width: 25,
                  fit: BoxFit.scaleDown,
                  colorFilter:
                      ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                var cubit = UserCubit.get(context);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        cubit.levelEntity != null
                            ? cubit.levelEntity!.coins.toString()
                            : '0',
                        style: Styles.bold13
                            .copyWith(color: AppColor.primaryColor),
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
                        cubit.levelEntity != null
                            ? cubit.levelEntity!.diamonds.toString(): '0',
                        style: Styles.bold13
                            .copyWith(color: AppColor.primaryColor),
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
                );
              },
            ),
          )
        ],
      ),
    ),
    centerTitle: true,
    titleSpacing: 0,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.bold19.copyWith(color: AppColor.primaryColor),
        ),
        SizedBox(
          height: 10,
        ),
        Visibility(
          visible: showProgress,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2.7,
            child: LinearProgressBar(
              maxSteps: totalProgress,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: currentProgress,
              progressColor: AppColor.orangeTextColor,
              backgroundColor: AppColor.checkBoxColor,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10), //  NEW
            ),
          ),
        )
      ],
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
      ),
    ],
  );
}
