import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_quiz_view.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/custom_dropdown_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../home/presentation/views/widgets/counter_widget.dart';
import '../../../home/presentation/views/widgets/question_widget.dart';

class ManageQuizView extends StatefulWidget {
  const ManageQuizView({super.key});
  static const String routeName = 'manageQuizView';

  @override
  State<ManageQuizView> createState() => _ManageQuizViewState();
}

class _ManageQuizViewState extends State<ManageQuizView> {
  int currentQuestionIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAdminAppBar(context, title: 'ادارة الاختبارات', showBack: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddQuizView.routeName);
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
            CustomDropdownList(onChanged: (value) {

            }, list: ['حيوانات', 'عائلة', 'مشاعر', ]
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CounterWidget(
                        number: "١",
                        isSelected: currentQuestionIndex == 0 ? true : false,
                        isCorrect: false,
                        isWrong: false,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CounterWidget(
                        number: "٢",
                        isSelected: currentQuestionIndex == 1 ? true : false,
                        isCorrect: false,
                        isWrong: false,
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
                      physics: NeverScrollableScrollPhysics(),
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
                    height: 20,
                  ),
                  CustomButton(onPressed: () {

                  },
                  text: 'حذف الاختبار',),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
