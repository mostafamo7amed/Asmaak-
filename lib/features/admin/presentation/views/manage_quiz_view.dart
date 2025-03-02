import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/admin/domain/entity/quiz_entity.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_quiz_view.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/custom_dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';
import '../../../home/presentation/views/widgets/counter_widget.dart';
import '../../../home/presentation/views/widgets/question_widget.dart';
import '../../domain/entity/category_entity.dart';
import 'manager/admin_cubit.dart';

class ManageQuizView extends StatefulWidget {
  const ManageQuizView({super.key});
  static const String routeName = 'manageQuizView';

  @override
  State<ManageQuizView> createState() => _ManageQuizViewState();
}

class _ManageQuizViewState extends State<ManageQuizView> {
  int currentQuestionIndex = 0;
  PageController pageController = PageController();
  List<CategoryEntity> categories = [];
  String? selectedCategory;
  @override
  void initState() {
    categories = AdminCubit.get(context).categories;
    selectedCategory = categories.first.id;
    AdminCubit.get(context).getQuiz(categoryId: selectedCategory!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if(state is DeleteQuizSuccessState){
          getSnackBar('تم حذف الاختبار بنجاح');
          AdminCubit.get(context).getQuiz(categoryId: selectedCategory!);
        }
      },
      builder: (context, state) {
        var quiz = AdminCubit.get(context).quiz;
        return CustomProgressHud(
          isLoading: state is GetQuizLoadingState || state is DeleteQuizLoadingState,
          child: Scaffold(
            appBar: buildAdminAppBar(context,
                title: 'ادارة الاختبارات', showBack: true),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(children: [
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
                          AdminCubit.get(context)
                              .getQuiz(categoryId: selectedCategory!);
                        });
                      },
                      list: categories.map((e) => e.name).toList()),
                  const SizedBox(
                    height: 10,
                  ),
                  quiz == null?
                  const Center(child: Text('لا يوجد اختبار')):
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CounterWidget(
                              number: "١",
                              isSelected:
                                  currentQuestionIndex == 0 ? true : false,
                              isCorrect: false,
                              isWrong: false,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CounterWidget(
                              number: "٢",
                              isSelected:
                                  currentQuestionIndex == 1 ? true : false,
                              isCorrect: false,
                              isWrong: false,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CounterWidget(
                              number: "٣",
                              isSelected:
                                  currentQuestionIndex == 2 ? true : false,
                              isCorrect: false,
                              isWrong: false,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CounterWidget(
                              number: "٤",
                              isSelected:
                                  currentQuestionIndex == 3 ? true : false,
                              isCorrect: false,
                              isWrong: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: pageController,
                            children: [
                              QuestionWidget(
                                videoUrl: quiz.question1!.videoUrl,
                                isManage: true,
                                answer1: quiz.question1!.answer1,
                                answer2: quiz.question1!.answer2,
                                answer3: quiz.question1!.answer3,
                                answer4: quiz.question1!.answer4,
                                correctAnswer: quiz.question1!.correctAnswer,
                              ),
                              QuestionWidget(
                                isManage: true,
                                videoUrl: quiz.question2!.videoUrl,
                                answer1: quiz.question2!.answer1,
                                answer2: quiz.question2!.answer2,
                                answer3: quiz.question2!.answer3,
                                answer4: quiz.question2!.answer4,
                                correctAnswer: quiz.question2!.correctAnswer,
                              ),
                              QuestionWidget(
                                isManage: true,
                                videoUrl: quiz.question3!.videoUrl,
                                answer1: quiz.question3!.answer1,
                                answer2: quiz.question3!.answer2,
                                answer3: quiz.question3!.answer3,
                                answer4: quiz.question3!.answer4,
                                correctAnswer: quiz.question3!.correctAnswer,
                              ),
                              QuestionWidget(
                                isManage: true,
                                videoUrl: quiz.question4!.videoUrl,
                                answer1: quiz.question4!.answer1,
                                answer2: quiz.question4!.answer2,
                                answer3: quiz.question4!.answer3,
                                answer4: quiz.question4!.answer4,
                                correctAnswer: quiz.question4!.correctAnswer,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (currentQuestionIndex > 0) {
                                  pageController
                                      .jumpToPage(--currentQuestionIndex);
                                  setState(() {});
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  size: 30,
                                  Icons.arrow_back,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (currentQuestionIndex < 3) {
                                  pageController
                                      .jumpToPage(++currentQuestionIndex);
                                  setState(() {});
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  size: 30,
                                  Icons.arrow_forward,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onPressed: () {
                            customAlertDialog(
                              context: context,
                              message: 'هل تريد حذف الاختبار؟',
                              onConfirm: () {
                                context
                                    .read<AdminCubit>()
                                    .deleteQuiz(categoryId: selectedCategory!);
                                Navigator.pop(context);
                              },
                            );
                          },
                          text: 'حذف الاختبار',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    color: AppColor.greenColor,
                    onPressed: () {
                      Navigator.pushNamed(context, AddQuizView.routeName,
                          arguments: selectedCategory);
                    },
                    text: 'اضافة',
                  ),
                  SizedBox(
                    height: 30,
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
