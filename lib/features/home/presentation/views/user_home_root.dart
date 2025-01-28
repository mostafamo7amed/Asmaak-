import 'package:asmaak/features/home/presentation/views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class UserHomeRoot extends StatefulWidget {
  const UserHomeRoot({super.key});
  static const routeName = 'rootHome';
  @override
  State<UserHomeRoot> createState() => _UserHomeRootState();
}

class _UserHomeRootState extends State<UserHomeRoot> {
  int mCurrentIndex = 0;
  int mCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        CategoryView()
        ,Scaffold(
          body: Text('wاختيارات'),
        )
        ,Scaffold(
          body: Text('اختيارات'),
        )
        ,Scaffold(
          body: Text('اختياراتg'),
        )
      ][mCurrentIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.lightGrayColor.withValues(alpha: 0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, -1 ), // changes position of shadow
              ),
            ],

            color: AppColor.whiteColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16),
            ),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            enableFeedback: false,
            selectedLabelStyle: Styles.tabsSelectedTextStyle,
            unselectedLabelStyle: Styles.tabsUnSelectedTextStyle,
            backgroundColor: Colors.transparent,
            currentIndex: mCurrentIndex,
            useLegacyColorScheme: false,
            onTap: (index) {
              mCurrentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.settings,
                    fit: BoxFit.scaleDown,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.settings,
                    colorFilter:
                    ColorFilter.mode(AppColor.orangeTextColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                  label: 'أختيارات'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.lesson,
                    fit: BoxFit.scaleDown,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.lesson,
                    colorFilter:
                    ColorFilter.mode(AppColor.orangeTextColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                  label: 'الاساسات'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.quiz,
                    colorFilter:
                    ColorFilter.mode(AppColor.lightGrayColor, BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.quiz,
                    colorFilter:
                    ColorFilter.mode(AppColor.orangeTextColor, BlendMode.srcIn),
                  ),
                  label: 'اختبارات'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.profile,
                    fit: BoxFit.scaleDown,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.profile,
                    colorFilter:
                    ColorFilter.mode(AppColor.orangeTextColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                  label: 'حسابي'),
            ],
          ),
        ),
      ),
    );
  }
}
