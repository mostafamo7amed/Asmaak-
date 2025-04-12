import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class MyPointsView extends StatefulWidget {
  const MyPointsView({super.key});
  static const String routeName = 'myPointsView';

  @override
  State<MyPointsView> createState() => _MyPointsViewState();
}

class _MyPointsViewState extends State<MyPointsView> {
  @override
  void initState() {
    UserCubit.get(context).getUserLevel();
    UserCubit.get(context).getTotalLearnedLessons();
    UserCubit.get(context).getQuizHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserLevelSuccessState) {
          if ((UserCubit.get(context).allLessonsCount) / 2 ==
              UserCubit.get(context).totalLessonLearned) {
            UserCubit.get(context).updateLevelAndCoins(
                'مستوى متوسط',
                UserCubit.get(context).levelEntity!.coins,
                UserCubit.get(context).levelEntity!.diamonds);
          }
          if ((UserCubit.get(context).allLessonsCount) ==
              UserCubit.get(context).totalLessonLearned) {
            UserCubit.get(context).updateLevelAndCoins(
                'مستوى متقدم',
                UserCubit.get(context).levelEntity!.coins,
                UserCubit.get(context).levelEntity!.diamonds);
          }
        }
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return CustomProgressHud(
          isLoading: state is GetUserLevelLoadingState ||
              state is GetUserProgressLoadingState,
          child: Scaffold(
            appBar: customAppBar(context,
                title: 'نقاطي',
                showProgress: false,
                showProfile: false,
                showBack: true),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: buildAuthLinearGradient(),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            width: 50,
                            AssetsData.lez,
                          ),
                          Text(
                            cubit.levelEntity?.level ?? 'مستوى مبتدئ',
                            style: Styles.bold23
                                .copyWith(color: AppColor.purpleColor),
                          ),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'نقاطي',
                            style: Styles.bold16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cubit.levelEntity?.coins.toString() ?? '0',
                          style: Styles.bold19
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          AssetsData.coins,
                          fit: BoxFit.cover,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cubit.levelEntity?.diamonds.toString() ?? '0',
                          style: Styles.bold19
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          AssetsData.diamond,
                          fit: BoxFit.cover,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'تقدمي',
                            style: Styles.bold16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            cubit.totalLessonLearned.toString(),
                            style: Styles.bold19
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: LinearProgressBar(
                              maxSteps: cubit.allLessonsCount == 0
                                  ? 1
                                  : cubit.allLessonsCount,
                              progressType: LinearProgressBar
                                  .progressTypeLinear, // Use Linear progress
                              currentStep: cubit.totalLessonLearned,
                              progressColor: AppColor.orangeTextColor,
                              backgroundColor: AppColor.checkBoxColor,
                              minHeight: 30,
                              borderRadius: BorderRadius.circular(10), //  NEW
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            cubit.allLessonsCount.toString(),
                            style: Styles.bold19
                                .copyWith(color: AppColor.primaryColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: AppColor.pinkColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'النتائج السابقة',
                      style: Styles.bold19.copyWith(color: AppColor.pinkColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    cubit.quizHistoryList.isEmpty
                        ? const Center(child: Text('لا يوجد نتائج سابقة'))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.quizHistoryList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => LastResultWidget(
                              message:
                                  cubit.quizHistoryList[index].result ?? '',
                              result:
                                  cubit.quizHistoryList[index].score.toString(),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SvgPicture.asset(
                            AssetsData.spider,
                            width: 130,
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LastResultWidget extends StatelessWidget {
  const LastResultWidget({
    super.key,
    required this.message,
    required this.result,
  });
  final String message;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.yellowTextColor.withValues(alpha: .4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .26,
          ),
          Icon(
            Icons.star,
            color: AppColor.purpleColor,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            message,
            style: Styles.bold16.copyWith(color: AppColor.purpleColor),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '$result/٤',
            style: Styles.bold16.copyWith(color: AppColor.purpleColor),
          ),
        ],
      ),
    );
  }
}
