import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/features/home/presentation/views/notification_view.dart';
import 'package:asmaak/features/home/presentation/views/privacy_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: 'حسابي',
          showProgress: false,
          showProfile: false,
          showBack: false),
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
                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * .5,
                    width: MediaQuery.of(context).size.width * .5,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.lightPinkColor.withValues(alpha: 0.7),
                          radius: 90,
                          child: SvgPicture.asset(
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
                    
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColor.lightPinkColor,
                              radius: 20,
                              child: Icon(
                                Icons.edit,
                                color: AppColor.whiteColor,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrayColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text('اسم المستخدم',style: Styles.bold16.copyWith(color: AppColor.primaryColor),),
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, EditProfileView.routeName);

                  },
                  child: Container(
                    color: AppColor.lightGrayColor.withValues(alpha: 0.2),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.person,color: AppColor.primaryColor,size: 30,),
                        SizedBox(width: 15,),
                        Text('تعديل الملف الشخصي',style: Styles.bold16.copyWith(color: AppColor.primaryColor),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NotificationView.routeName);
                  },
                  child: Container(
                    color: AppColor.lightGrayColor.withValues(alpha: 0.2),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.notifications_none,color: AppColor.primaryColor,size: 30,),
                        SizedBox(width: 15,),
                        Text('الاشعارات',style: Styles.bold16.copyWith(color: AppColor.primaryColor),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PrivacyView.routeName);
                  },
                  child: Container(
                    color: AppColor.lightGrayColor.withValues(alpha: 0.2),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.lock,color: AppColor.primaryColor,size: 30,),
                        SizedBox(width: 15,),
                        Text('خصوصية',style: Styles.bold16.copyWith(color: AppColor.primaryColor),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
