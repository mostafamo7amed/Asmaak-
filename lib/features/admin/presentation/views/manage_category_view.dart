import 'package:asmaak/features/admin/domain/entity/category_entity.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_category_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/admin_category_item.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ManageCategoryView extends StatelessWidget {
  ManageCategoryView({super.key});
  static const String routeName = 'manageCategoryView';

  final List<CategoryEntity> categories = [
    CategoryEntity(
      id: 1,
      name: 'الحيوانات',
      image: AssetsData.cate,
    ),
    CategoryEntity(
      id: 2,
      name: 'الطعام',
      image: AssetsData.foods,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAdminAppBar(context, title: 'ادارة المحتوى', showBack: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.greenColor,
        onPressed: () {
          addCategoryDialog(context);
        },
        child: Text(
          'اضافة',
          style: Styles.bold16.copyWith(color: AppColor.whiteColor),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, LessonsGridView.routeName);
            },
            child: AdminCategoryItem(
              index: index,
              categoryEntity: categories[index],
            ),
          );
        },
      ),
    );
  }
}
