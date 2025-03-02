import 'package:asmaak/features/admin/presentation/views/manage_notification_view.dart';
import 'package:asmaak/features/admin/presentation/views/manage_users_view.dart';
import 'package:asmaak/features/admin/presentation/views/manage_view.dart';
import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../core/services/app_references.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';
import '../../../auth/presentation/manager/login_cubit/login_cubit.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  static const routeName = 'AdminRootHome';

  @override
  State<AdminHomeView> createState() => _UserHomeRootState();
}

class _UserHomeRootState extends State<AdminHomeView> {
  int mCurrentIndex = 0;
  int mCounter = 0;

  @override
  void initState() {
    context.read<AdminCubit>().getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LogOutState){
          AppReference.removeData(key: authKey);
          AppReference.removeData(key: uidKey);
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: [
            ManageView(),
            ManageUsersView(),
            ManageNotificationView(),
            Scaffold(),
          ][mCurrentIndex],
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColor.lightGrayColor.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, -1), // changes position of shadow
                ),
              ],
              color: AppColor.whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
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
                  if (index == 3) {
                    customAlertDialog(
                      context: context,
                      message: 'هل تريد تسجيل الخروج؟',
                      onConfirm: () {
                        context.read<LoginCubit>().logout();
                        Navigator.pop(context);
                      },
                    );
                  } else {
                    mCurrentIndex = index;
                    setState(() {});
                  }
                },
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        height: 22,
                        AssetsData.setting,
                        colorFilter: ColorFilter.mode(
                            AppColor.lightGrayColor, BlendMode.srcIn),
                      ),
                      activeIcon: SvgPicture.asset(
                        height: 22,
                        AssetsData.setting,
                        colorFilter: ColorFilter.mode(
                            AppColor.orangeTextColor, BlendMode.srcIn),
                      ),
                      label: 'الادارة'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(AssetsData.teacher,
                          height: 22,
                          colorFilter: ColorFilter.mode(
                              AppColor.lightGrayColor, BlendMode.srcIn)),
                      activeIcon: SvgPicture.asset(
                        height: 22,
                        AssetsData.teacher,
                        colorFilter: ColorFilter.mode(
                            AppColor.orangeTextColor, BlendMode.srcIn),
                      ),
                      label: 'المستخدمين'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          height: 22,
                          AssetsData.users,
                          colorFilter: ColorFilter.mode(
                              AppColor.lightGrayColor, BlendMode.srcIn)),
                      activeIcon: SvgPicture.asset(
                        height: 22,
                        AssetsData.users,
                        colorFilter: ColorFilter.mode(
                            AppColor.orangeTextColor, BlendMode.srcIn),
                      ),
                      label: 'الاشعارات'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.logout,
                        color: AppColor.lightGrayColor,
                      ),
                      activeIcon: Icon(
                        Icons.logout,
                        color: AppColor.orangeTextColor,
                      ),
                      label: 'خروج'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
