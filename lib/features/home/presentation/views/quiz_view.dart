import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_result_dialog.dart';
import 'package:asmaak/features/home/presentation/views/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key, required this.categoryId});
  static const routeName = 'quizView';

  final String categoryId;

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int currentQuestionIndex = 0;
  PageController pageController = PageController();
  bool? question1, q1IsAnswered = false;
  bool? question2, q2IsAnswered = false;
  bool? question3, q3IsAnswered = false;
  bool? question4, q4IsAnswered = false;

  int score = 0;
  int isFinished = 0;
  @override
  void initState() {
    UserCubit.get(context).getQuiz(categoryId: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          appBar: customAppBar(context,
              title: 'الاختبارات', showProgress: false, showProfile: false),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CounterWidget(
                      number: "١",
                      isSelected: currentQuestionIndex == 0 ? true : false,
                      isCorrect: question1 == null
                          ? false
                          : question1 == true
                              ? true
                              : false,
                      isWrong: question1 == null
                          ? false
                          : question1 == true
                              ? false
                              : true,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CounterWidget(
                      number: "٢",
                      isSelected: currentQuestionIndex == 1 ? true : false,
                      isCorrect: question2 == null
                          ? false
                          : question2 == true
                              ? true
                              : false,
                      isWrong: question2 == null
                          ? false
                          : question2 == true
                              ? false
                              : true,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CounterWidget(
                      number: "٣",
                      isSelected: currentQuestionIndex == 2 ? true : false,
                      isCorrect: question3 == null
                          ? false
                          : question3 == true
                              ? true
                              : false,
                      isWrong: question3 == null
                          ? false
                          : question3 == true
                              ? false
                              : true,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CounterWidget(
                      number: "٤",
                      isSelected: currentQuestionIndex == 3 ? true : false,
                      isCorrect: question4 == null
                          ? false
                          : question4 == true
                              ? true
                              : false,
                      isWrong: question4 == null
                          ? false
                          : question4 == true
                              ? false
                              : true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      QuestionWidget(
                        answer1: cubit.quiz?.question1?.answer1 ?? '',
                        answer2: cubit.quiz?.question1?.answer2 ?? '',
                        answer3: cubit.quiz?.question1?.answer3 ?? '',
                        answer4: cubit.quiz?.question1?.answer4 ?? '',
                        correctAnswer:
                            cubit.quiz?.question1?.correctAnswer ?? '',
                        videoUrl: cubit.quiz?.question1?.videoUrl ?? '',
                        answerChanged: (value) {
                          if (!q1IsAnswered!) {
                            question1 = value;
                            if (question1 == true) {
                              score++;
                            }
                            isFinished++;
                            q1IsAnswered = true;
                            setState(() {});
                          }
                        },
                      ),
                      QuestionWidget(
                        answer1: cubit.quiz?.question2?.answer1 ?? '',
                        answer2: cubit.quiz?.question2?.answer2 ?? '',
                        answer3: cubit.quiz?.question2?.answer3 ?? '',
                        answer4: cubit.quiz?.question2?.answer4 ?? '',
                        correctAnswer:
                            cubit.quiz?.question2?.correctAnswer ?? '',
                        videoUrl: cubit.quiz?.question2?.videoUrl ?? '',
                        answerChanged: (value) {
                          if (!q2IsAnswered!) {
                            question2 = value;
                            if (question2 == true) {
                              score++;
                            }
                            isFinished++;
                            q2IsAnswered = true;
                            setState(() {});
                          }
                        },
                      ),
                      QuestionWidget(
                        answer1: cubit.quiz?.question3?.answer1 ?? '',
                        answer2: cubit.quiz?.question3?.answer2 ?? '',
                        answer3: cubit.quiz?.question3?.answer3 ?? '',
                        answer4: cubit.quiz?.question3?.answer4 ?? '',
                        correctAnswer:
                            cubit.quiz?.question3?.correctAnswer ?? '',
                        videoUrl: cubit.quiz?.question3?.videoUrl ?? '',
                        answerChanged: (value) {
                          if (!q3IsAnswered!) {
                            question3 = value;
                            if (question3 == true) {
                              score++;
                            }
                            isFinished++;
                            q3IsAnswered = true;
                            setState(() {});
                          }
                        },
                      ),
                      QuestionWidget(
                        answer1: cubit.quiz?.question4?.answer1 ?? '',
                        answer2: cubit.quiz?.question4?.answer2 ?? '',
                        answer3: cubit.quiz?.question4?.answer3 ?? '',
                        answer4: cubit.quiz?.question4?.answer4 ?? '',
                        correctAnswer:
                            cubit.quiz?.question4?.correctAnswer ?? '',
                        videoUrl: cubit.quiz?.question4?.videoUrl ?? '',
                        answerChanged: (value) {
                          if (!q4IsAnswered!) {
                            question4 = value;
                            if (question4 == true) {
                              score++;
                            }
                            isFinished++;
                            q4IsAnswered = true;
                            setState(() {});
                          }
                        },
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
                          pageController.jumpToPage(--currentQuestionIndex);
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
                          pageController.jumpToPage(++currentQuestionIndex);
                          setState(() {});
                        } else {
                          if (isFinished == 4) {
                            if (score == 4) {
                              cubit.updateLevelAndCoins(
                                  cubit.levelEntity!.level,
                                  cubit.levelEntity!.coins +
                                      cubit.quiz!.points!,
                                  cubit.levelEntity!.diamonds +
                                      cubit.quiz!.diamonds!);
                              customResultDialog(
                                result: 'ممتاز',
                                score: '٤',
                                context: context,
                                message: 'ممتاز,انت الأفضل!',
                                coins: cubit.quiz?.points.toString(),
                                diamonds: cubit.quiz?.diamonds.toString(),
                              );
                            } else if (score == 3) {
                              cubit.updateLevelAndCoins(
                                  cubit.levelEntity!.level,
                                  cubit.levelEntity!.coins +
                                      cubit.quiz!.points!,
                                  cubit.levelEntity!.diamonds +
                                      cubit.quiz!.diamonds!);
                              customResultDialog(
                                score: '٣',
                                result: 'جيد جدا',
                                context: context,
                                message: 'جيد جدا,انت رائع!',
                                coins: cubit.quiz?.points.toString(),
                                diamonds: cubit.quiz?.diamonds.toString(),
                              );
                            } else if (score == 2) {
                              cubit.updateLevelAndCoins(
                                  cubit.levelEntity!.level,
                                  cubit.levelEntity!.coins +
                                      cubit.quiz!.points!,
                                  cubit.levelEntity!.diamonds +
                                      cubit.quiz!.diamonds!);
                              customResultDialog(
                                score: '٢',
                                result: 'جيد',
                                context: context,
                                message: 'أحسنت يا بطل!',
                                coins: cubit.quiz?.points.toString(),
                                diamonds: cubit.quiz?.diamonds.toString(),
                              );
                            } else if (score == 1) {
                              cubit.updateLevelAndCoins(
                                  cubit.levelEntity!.level,
                                  cubit.levelEntity!.coins +
                                      cubit.quiz!.points!,
                                  cubit.levelEntity!.diamonds +
                                      cubit.quiz!.diamonds!);
                              customResultDialog(
                                score: '١',
                                result: 'ضعيف',
                                context: context,
                                message: 'شد حيلك أكثر!',
                                coins: cubit.quiz?.points.toString(),
                                diamonds: cubit.quiz?.diamonds.toString(),
                              );
                            } else {
                              cubit.updateLevelAndCoins(
                                  cubit.levelEntity!.level,
                                  cubit.levelEntity!.coins +
                                      cubit.quiz!.points!,
                                  cubit.levelEntity!.diamonds +
                                      cubit.quiz!.diamonds!);
                              customResultDialog(
                                score: '0',
                                result: 'ضعيف',
                                context: context,
                                message: 'لا تقلق حاول في مرة اخرى!',
                                coins: 0.toString(),
                                diamonds: 0.toString(),
                              );
                            }
                          }
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
                  height: 100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
