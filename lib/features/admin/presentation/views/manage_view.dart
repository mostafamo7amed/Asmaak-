import 'package:asmaak/features/admin/presentation/views/manage_category_view.dart';
import 'package:asmaak/features/admin/presentation/views/manage_lesson_view.dart';
import 'package:asmaak/features/admin/presentation/views/manage_quiz_view.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/admin_panel_item.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ManageView extends StatelessWidget {
  const ManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAdminAppBar(context,title: 'أسمعك'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحبا بك, مدير النظام',style: Styles.bold19.copyWith(color: AppColor.primaryColor),),
              const SizedBox(height: 5,),
              Text("يمكنك أدارة المحتوي والاختبارات هنا",style: Styles.regular16.copyWith(color: AppColor.lightGrayColor),),
              const Spacer(),
              Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(AssetsData.fly,)
              ),
              SizedBox(height: 30,),
              AdminPanelItem(
                title: 'إدارة المحتوي',
                icon: AssetsData.settings,
                onTap: () {
                  Navigator.pushNamed(context, ManageCategoryView.routeName);
                },
              ),
              SizedBox(height: 10,),
              AdminPanelItem(
                title: 'إدارة الدروس',
                icon: AssetsData.lesson,
                onTap: () {
                  Navigator.pushNamed(context, ManageLessonView.routeName);

                },
              ),
              SizedBox(height: 10,),
              AdminPanelItem(
                title: 'إدارة الاختبارات',
                icon: AssetsData.teacher,
                onTap: () {
                  Navigator.pushNamed(context, ManageQuizView.routeName);
                },
              ),
              Spacer(flex: 2,),
              Align(
                alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(AssetsData.logo,height: 120,)),
            ],
          ),
        ),
      ),
    );

  }
}


