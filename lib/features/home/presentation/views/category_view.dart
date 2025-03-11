import 'dart:developer';

import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/lessons_grid_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/user_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    UserCubit.get(context).getUserLevel();
    UserCubit.get(context).getAllCategories();
    UserCubit.get(context).getTotalLearnedLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserLevelSuccessState) {}
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return CustomProgressHud(
          isLoading: state is UserGetCategoriesLoadingState ||
              state is GetUserLevelLoadingState,
          child: Scaffold(
            appBar: buildHomeAppBar(
              context,
            ),
            body: cubit.categories.isEmpty
                ? const Center(
                    child: Text('لا يوجد محتوى متاح حاليا'),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, LessonsGridView.routeName,
                              arguments: cubit.categories[index].id);
                        },
                        child: UserCategoryItem(
                          category: cubit.categories[index],
                          index: index,
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
