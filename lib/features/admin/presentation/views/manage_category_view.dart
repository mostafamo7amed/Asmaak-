import 'package:asmaak/core/utils/widgets/custom_alert_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_category_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/edit_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../core/helper_functions/get_random_color.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ManageCategoryView extends StatelessWidget {
  const ManageCategoryView({super.key});
  static const String routeName = 'manageCategoryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAdminAppBar(context, title: 'ادارة المحتوي', showBack: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.greenColor,
        onPressed: () {
          addCategoryDialog(context);
        },
        child: Text('اضافة',style: Styles.bold16.copyWith(color: AppColor.whiteColor),),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, LessonsGridView.routeName);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: index < colors.length ? colors[index] : getRandomColor(),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(width: 100, height: 100, AssetsData.cate),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'حيوانات',
                      style: Styles.bold19.copyWith(color: AppColor.whiteColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 10,),
                  GestureDetector(
                    onTap: () {
                      customAlertDialog(
                        context: context,
                        message: 'هل تريد حذف هذا المحتوى؟',
                        onConfirm: () {
                          //Navigator.pop(context);
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.whiteColor)),
                      child: Icon(
                        Icons.delete,
                        color: AppColor.whiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => editCategoryDialog(context),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.whiteColor)),
                      child: Icon(
                        Icons.edit,
                        color: AppColor.whiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
