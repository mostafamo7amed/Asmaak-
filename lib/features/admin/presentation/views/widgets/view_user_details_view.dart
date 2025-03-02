import 'package:asmaak/features/auth/domain/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import 'build_admin_appbar.dart';

class ViewUserDetailsView extends StatelessWidget {
  const ViewUserDetailsView({super.key, required this.user});
  static const routeName = 'view-user-details';
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAdminAppBar(context, title: 'تفاصيل المستخدم', showBack: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الاسم',
                style: Styles.bold19.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user.name ?? '',
                  style: Styles.bold19.copyWith(color: AppColor.grayColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'البريد الالكتروني',
                style: Styles.bold19.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user.email ?? '',
                  style: Styles.bold19.copyWith(color: AppColor.grayColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'تاريخ الميلاد',
                style: Styles.bold19.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user.dateOfBirth ?? 'لم يتم التحديث بعد',
                  style: Styles.bold19.copyWith(color: AppColor.grayColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'الجنس',
                style: Styles.bold19.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user.gender ?? 'لم يتم التحديث بعد',
                  style: Styles.bold19.copyWith(color: AppColor.grayColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'المستوي',
                style: Styles.bold19.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user.level ?? '',
                  style: Styles.bold19.copyWith(color: AppColor.grayColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    AssetsData.snail,
                    fit: BoxFit.scaleDown,
                    width: 100,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
