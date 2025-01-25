import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_manager/app_styles.dart';
import 'on_boarding_2_view.dart';

class OnBoarding1View extends StatelessWidget {
  const OnBoarding1View({super.key});
  static const String routeName = 'onBoarding1View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(AssetsData.fly),
                Spacer(),
                SvgPicture.asset(AssetsData.onBoardingTop),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .25,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(AssetsData.fly)),
                      SvgPicture.asset(
                        AssetsData.snail,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'اهلا و سهلا',
                  style: Styles.bold23
                      .copyWith(color: AppColor.whiteColor, shadows: [
                    Shadow(
                        color: AppColor.lightGrayColor,
                        blurRadius: 10,
                        offset: const Offset(1, 3))
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Text(
                    'سعيدين بوجودكم معنا يا ابطال',
                    textAlign: TextAlign.center,
                    style: Styles.bold23
                        .copyWith(color: AppColor.whiteColor, shadows: [
                      Shadow(
                          color: AppColor.lightGrayColor,
                          blurRadius: 10,
                          offset: const Offset(1, 3))
                    ]),
                  ),
                ),
                CustomButton(
                  textColor: AppColor.primaryColor,
                  color: AppColor.whiteColor,
                  text: 'سجل دخولك',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, OnBoarding2View.routeName);
                  },
                ),
                Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0, left: 10),
                  child: SvgPicture.asset(AssetsData.onBoardingBottom2),
                ),
                SvgPicture.asset(AssetsData.onBoardingBottom),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
