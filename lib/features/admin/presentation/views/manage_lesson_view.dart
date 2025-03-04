import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/core/utils/widgets/custom_view_lesson_dialog.dart';
import 'package:asmaak/features/admin/domain/entity/category_entity.dart';
import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_lesson_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/custom_dropdown_list.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/edit_lesson_dialog.dart';
import 'package:asmaak/features/home/domain/entity/lesson_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';

class ManageLessonView extends StatefulWidget {
  const ManageLessonView({super.key});
  static const routeName = 'manageLessonView';

  @override
  State<ManageLessonView> createState() => _ManageLessonViewState();
}

class _ManageLessonViewState extends State<ManageLessonView> {
  List<CategoryEntity> categories = [];
  String? selectedCategory;
  @override
  void initState() {
    categories = AdminCubit.get(context).categories;
    if (categories.isNotEmpty) {
      selectedCategory = categories.first.id;
      context.read<AdminCubit>().getLessons(selectedCategory!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AddLessonSuccessState) {
          getSnackBar('تم اضافة الدرس بنجاح');
          context.read<AdminCubit>().getLessons(selectedCategory!);
        }
        if (state is DeleteLessonSuccessState) {
          getSnackBar('تم حذف الدرس بنجاح');
          context.read<AdminCubit>().getLessons(selectedCategory!);
        }
        if (state is EditLessonSuccessState) {
          getSnackBar('تم تعديل الدرس بنجاح');
          context.read<AdminCubit>().getLessons(selectedCategory!);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading:
              state is AddLessonLoadingState || state is GetLessonsLoadingState,
          child: Scaffold(
            appBar: buildAdminAppBar(context,
                title: 'ادارة الدروس', showBack: true),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (selectedCategory != null) {
                  addLessonDialog(context, selectedCategory!);
                } else {
                  getSnackBar('اختر المحتوى');
                }
              },
              backgroundColor: AppColor.greenColor,
              child: Text(
                'اضافة',
                style: Styles.bold16.copyWith(color: AppColor.whiteColor),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdownList(
                      onChanged: (value) {
                        setState(() {
                          for (var element in categories) {
                            if (element.name == value) {
                              selectedCategory = element.id;
                              break;
                            }
                          }
                          AdminCubit.get(context).getLessons(selectedCategory!);
                        });
                      },
                      list: categories.map((e) => e.name).toList()),
                  const SizedBox(
                    height: 10,
                  ),
                  AdminCubit.get(context).lessons.isEmpty
                      ? Expanded(child: Center(child: Text('لا يوجد دروس')))
                      : Expanded(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: AdminCubit.get(context).lessons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => customViewLessonDialog(
                                context: context,
                                message: AdminCubit.get(context)
                                    .lessons[index]
                                    .title,
                                image: AdminCubit.get(context)
                                    .lessons[index]
                                    .coverImage,
                                video: AdminCubit.get(context)
                                    .lessons[index]
                                    .video,
                                isManage: false,
                              ),
                              child: AdminLessonItem(
                                lessonEntity:
                                    AdminCubit.get(context).lessons[index],
                                selectedCategory: selectedCategory!,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdminLessonItem extends StatelessWidget {
  const AdminLessonItem({
    super.key,
    required this.lessonEntity,
    required this.selectedCategory,
  });

  final LessonEntity lessonEntity;
  final String selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColor.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                lessonEntity.coverImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              lessonEntity.title,
              style: Styles.bold16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    customAlertDialog(
                      context: context,
                      message: 'هل تريد حذف هذا الدرس؟',
                      onConfirm: () {
                        AdminCubit.get(context).deleteLesson(
                            lessonId: lessonEntity.id,
                            categoryId: selectedCategory);
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.redColor)),
                    child: Icon(
                      Icons.delete,
                      color: AppColor.redColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    editLessonDialog(context, lessonEntity, selectedCategory);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.greenColor)),
                    child: Icon(
                      Icons.edit,
                      color: AppColor.greenColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
