import 'package:asmaak/core/services/app_references.dart';
import 'package:asmaak/core/utils/extensions.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/core/utils/widgets/custom_view_lesson_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper_functions/isLessonLearned.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class LessonsGridView extends StatefulWidget {
  const LessonsGridView({super.key, required this.categoryId});

  final String categoryId;
  static const routeName = 'lessons-grid';

  @override
  State<LessonsGridView> createState() => _LessonsGridViewState();
}

class _LessonsGridViewState extends State<LessonsGridView> {
  @override
  void initState() {
    UserCubit.get(context).getAllLessons(widget.categoryId);
    UserCubit.get(context).getCategoryProgress(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is MarkAsDoneSuccessState) {
          UserCubit.get(context).getAllLessons(widget.categoryId);
          UserCubit.get(context).getCategoryProgress(widget.categoryId);
        }
        if (state is GetCategoryProgressSuccessState) {
          AppReference.setData(
              key: widget.categoryId,
              data: UserCubit.get(context).categoryProgress.length.toString());
        }
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return CustomProgressHud(
          isLoading: state is UserGetLessonsLoadingState ||
              state is MarkAsDoneLoadingState ||
              state is GetCategoryProgressLoadingState,
          child: Scaffold(
            appBar: customAppBar(
              context,
              title: 'الدروس',
              currentProgress: cubit.categoryProgress.isEmpty
                  ? 0 : cubit.categoryProgress.length,
              totalProgress: cubit.lessons.isEmpty ? 50 : cubit.lessons.length,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: cubit.lessons.isEmpty
                  ? const Center(child: Text('لا توجد دروس متاحه حاليا'))
                  : GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.lessons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            customViewLessonDialog(
                              image: cubit.lessons[index].coverImage,
                              video: cubit.lessons[index].video,
                              context: context,
                              message: cubit.lessons[index].title,
                              lessonId: cubit.lessons[index].id,
                              categoryId: widget.categoryId,
                            );
                          },
                          child: Card(
                            elevation: 2,
                            color: isLessonLearned(cubit.lessons[index].id,
                                    cubit.categoryProgress)
                                ? AppColor.opacityColor
                                : AppColor.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      cubit.lessons[index].coverImage,
                                      fit: BoxFit.fill,
                                    ).cornerRadiusWithClipRRect(14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    cubit.lessons[index].title,
                                    style: Styles.bold16,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ),
        );
      },
    );
  }
}
