import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_category_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/admin_category_item.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ManageCategoryView extends StatefulWidget {
  const ManageCategoryView({super.key});

  static const String routeName = 'manageCategoryView';

  @override
  State<ManageCategoryView> createState() => _ManageCategoryViewState();
}

class _ManageCategoryViewState extends State<ManageCategoryView> {
  @override
  void initState() {
    context.read<AdminCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AddCategorySuccessState) {
          getSnackBar('تم اضافة المحتوى بنجاح');
          context.read<AdminCubit>().getCategories();
        } else if (state is AddCategoryErrorState) {
          getSnackBar('حدث خطأ ما من فضلك حاول مرة اخرى');
        }
        if (state is DeleteCategorySuccessState) {
          getSnackBar('تم حذف المحتوى بنجاح');
          context.read<AdminCubit>().getCategories();
        }
        if (state is EditCategorySuccessState) {
          getSnackBar('تم تعديل المحتوى بنجاح');
          context.read<AdminCubit>().getCategories();
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddCategoryLoadingState ||
              state is GetCategoriesLoadingState,
          child: Scaffold(
            appBar: buildAdminAppBar(context,
                title: 'ادارة المحتوى', showBack: true),
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
            body: context.read<AdminCubit>().categories.isEmpty
                ? const Center(
                    child: Text('لا يوجد محتوى'),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: context.read<AdminCubit>().categories.length,
                    itemBuilder: (context, index) {
                      return AdminCategoryItem(
                        index: index,
                        categoryEntity:
                            context.read<AdminCubit>().categories[index],
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
