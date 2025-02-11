import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_result_dialog.dart';
import 'package:asmaak/features/home/presentation/views/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});
  static const routeName = 'quizView';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الاختبارات', showProgress: false,showProfile: false),

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
                    answer1: 'فهد',
                    answer2: 'نمر',
                    answer3: 'فراشة',
                    answer4: 'عصفور',
                    correctAnswer: 'فراشة',
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
                    answer1: 'فهد',
                    answer2: 'نمر',
                    answer3: 'فراشة',
                    answer4: 'عصفور',
                    correctAnswer: 'فراشة',
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
                    answer1: 'فهد',
                    answer2: 'نمر',
                    answer3: 'فراشة',
                    answer4: 'عصفور',
                    correctAnswer: 'فراشة',
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
                    answer1: 'فهد',
                    answer2: 'نمر',
                    answer3: 'فراشة',
                    answer4: 'عصفور',
                    correctAnswer: 'فراشة',
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
                        if(score == 4){
                          customResultDialog(
                            score: '٤',
                            context: context,
                            message: 'ممتاز,انت الأفضل!',
                          );
                        }else if(score == 3){
                          customResultDialog(
                            score: '٣',
                            context: context,
                            message: 'جيد جدا,انت رائع!',
                          );
                        }else if(score == 2){
                          customResultDialog(
                            score: '٢',
                            context: context,
                            message: 'أحسنت يا بطل!',
                          );
                        }else if(score == 1){
                          customResultDialog(
                            score: '١',
                            context: context,
                            message: 'شد حيلك أكثر!',
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
  }
}
