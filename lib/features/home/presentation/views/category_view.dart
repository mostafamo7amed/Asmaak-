import 'package:asmaak/features/home/presentation/views/lessons_grid_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/user_category_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../admin/domain/entity/category_entity.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final int length = 20;
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
      appBar: buildHomeAppBar(
        context,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LessonsGridView.routeName);
            },
            child: UserCategoryItem( category: categories[index], index: index,),
          );
        },
      ),
    );
  }
}
