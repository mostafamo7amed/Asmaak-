import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/counter_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(context, title: 'الاختبارات',),
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
                  isCorrect: true,
                  isWrong: false,
                ),
                SizedBox(
                  width: 15,
                ),
                CounterWidget(
                  number: "٢",
                  isSelected: currentQuestionIndex == 1 ? true : false,
                  isCorrect: false,
                  isWrong: true,
                ),
                SizedBox(
                  width: 15,
                ),
                CounterWidget(
                  number: "٣",
                  isSelected: currentQuestionIndex == 2 ? true : false,
                  isCorrect: false,
                  isWrong: false,
                ),
                SizedBox(
                  width: 15,
                ),
                CounterWidget(
                  number: "٤",
                  isSelected: currentQuestionIndex == 3 ? true : false,
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
                controller: pageController,
                children: [
                  QuestionWidget(),
                  QuestionWidget(),
                  QuestionWidget(),
                  QuestionWidget(),
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
