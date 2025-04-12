import 'package:asmaak/constants.dart';
import 'package:asmaak/core/services/app_references.dart';
import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/core/utils/extensions.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/auth/presentation/view/login_view.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/my_points_view.dart';
import 'package:asmaak/features/home/presentation/views/notification_view.dart';
import 'package:asmaak/features/home/presentation/views/privacy_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';
import '../../../auth/presentation/manager/login_cubit/login_cubit.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key, this.showBack = false});
  static const String routeName = 'myProfileView';
  final bool? showBack;

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  void initState() {
    UserCubit.get(context).getUser(AppReference.getData(key: uidKey));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, loginState) {
        if (loginState is LogOutState) {
          AppReference.removeData(key: authKey);
          AppReference.removeData(key: uidKey);
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      },
      builder: (context, loginState) {
        return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is PikImageSuccessState) {
              UserCubit.get(context)
                  .updateUserPhoto(UserCubit.get(context).pikedImage!);
            }
          },
          builder: (context, state) {
            var cubit = UserCubit.get(context);
            return CustomProgressHud(
              isLoading: state is GetUserLoadingState,
              child: Scaffold(
                appBar: customAppBar(context,
                    title: 'حسابي',
                    showProgress: false,
                    showProfile: false,
                    showBack: widget.showBack!),
                body: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: buildAuthLinearGradient(),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width * .5,
                              width: MediaQuery.of(context).size.width * .5,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColor.lightPinkColor
                                        .withValues(alpha: 0.7),
                                    radius: 90,
                                    child: cubit.pikedImage != null
                                        ? Image.file(
                                            cubit.pikedImage!,
                                            height: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .5) -
                                                4,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .5) -
                                                4,
                                            fit: BoxFit.cover,
                                          ).cornerRadiusWithClipRRect(90)
                                        : cubit.userEntity!.image != ''
                                            ? Image.network(
                                                cubit.userEntity!.image!,
                                                height: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .5) -
                                                    4,
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .5) -
                                                    4,
                                                fit: BoxFit.cover,
                                              ).cornerRadiusWithClipRRect(90)
                                            : SvgPicture.asset(
                                                AssetsData.spider,
                                                height: 90,
                                                width: 90,
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.getImageFromGallery();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: AppColor.lightPinkColor,
                                        radius: 20,
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColor.whiteColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  AppColor.lightGrayColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              cubit.userEntity?.name ?? '',
                              style: Styles.bold16
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, EditProfileView.routeName);
                            },
                            child: Container(
                              color:
                                  AppColor.lightGrayColor.withValues(alpha: 0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: AppColor.primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'تعديل الملف الشخصي',
                                    style: Styles.bold16
                                        .copyWith(color: AppColor.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, NotificationView.routeName);
                            },
                            child: Container(
                              color:
                                  AppColor.lightGrayColor.withValues(alpha: 0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications_none,
                                    color: AppColor.primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'الاشعارات',
                                    style: Styles.bold16
                                        .copyWith(color: AppColor.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, PrivacyView.routeName);
                            },
                            child: Container(
                              color:
                                  AppColor.lightGrayColor.withValues(alpha: 0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock,
                                    color: AppColor.primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'خصوصية',
                                    style: Styles.bold16
                                        .copyWith(color: AppColor.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyPointsView.routeName);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                color: AppColor.whiteColor,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetsData.teacher,
                                        height: 30,
                                        width: 25,
                                        colorFilter: ColorFilter.mode(
                                            AppColor.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'نقاطي',
                                        style: Styles.bold19.copyWith(
                                            color: AppColor.primaryColor),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(
                                        AssetsData.warm,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              customAlertDialog(
                                context: context,
                                message: 'هل تريد تسجيل الخروج؟',
                                onConfirm: () {
                                  context.read<LoginCubit>().logout();
                                  Navigator.pop(context);
                                },
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                color: AppColor.whiteColor,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: AppColor.primaryColor,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'خروج',
                                        style: Styles.bold19.copyWith(
                                            color: AppColor.primaryColor),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(
                                        AssetsData.snail,
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
