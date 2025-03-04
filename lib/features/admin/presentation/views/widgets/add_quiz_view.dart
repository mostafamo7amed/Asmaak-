import 'dart:io';

import 'package:asmaak/core/helper_functions/get_snack_bar.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/core/utils/widgets/custom_text_form_field.dart';
import 'package:asmaak/features/admin/domain/entity/question_entity.dart';
import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'custom_answer_widget.dart';

class AddQuizView extends StatefulWidget {
  const AddQuizView({super.key, required this.selectedCategory});
  static const String routeName = 'addQuiz';
  final String selectedCategory;

  @override
  State<AddQuizView> createState() => _AddQuizViewState();
}

class _AddQuizViewState extends State<AddQuizView> {
  int q1GroupValue = -1;
  int q2GroupValue = -1;
  int q3GroupValue = -1;
  int q4GroupValue = -1;
  String? correctAnswer1, correctAnswer2, correctAnswer3, correctAnswer4;
  TextEditingController q1Answer1Controller = TextEditingController();
  TextEditingController q1Answer2Controller = TextEditingController();
  TextEditingController q1Answer3Controller = TextEditingController();
  TextEditingController q1Answer4Controller = TextEditingController();
  TextEditingController q2Answer1Controller = TextEditingController();
  TextEditingController q2Answer2Controller = TextEditingController();
  TextEditingController q2Answer3Controller = TextEditingController();
  TextEditingController q2Answer4Controller = TextEditingController();
  TextEditingController q3Answer1Controller = TextEditingController();
  TextEditingController q3Answer2Controller = TextEditingController();
  TextEditingController q3Answer3Controller = TextEditingController();
  TextEditingController q3Answer4Controller = TextEditingController();
  TextEditingController q4Answer1Controller = TextEditingController();
  TextEditingController q4Answer2Controller = TextEditingController();
  TextEditingController q4Answer3Controller = TextEditingController();
  TextEditingController q4Answer4Controller = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController diamondController = TextEditingController();
  File? video1, video2, video3, video4;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AddQuizSuccessState) {
          getSnackBar('تم اضافة الاختبار بنجاح');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddQuizLoadingState,
          child: Scaffold(
            appBar: buildAdminAppBar(context,
                title: 'اضافة اختبار', showBack: true),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'السؤال الاول',
                        style: Styles.bold16
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          video1 = await AdminCubit.get(context)
                              .getQuestionVideoFromGallery();
                          setState(() {});
                        },
                        child: DottedBorder(
                          padding: const EdgeInsets.all(20),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: AppColor.lightGrayColor,
                          dashPattern: const [3, 3],
                          strokeWidth: 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                video1 != null
                                    ? video1!.path.split('/').last
                                    : 'اضافة فيديو',
                                style: Styles.regular16
                                    .copyWith(color: AppColor.lightGrayColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomAnswerWidget(
                        controller: q1Answer1Controller,
                        q1GroupValue: q1GroupValue,
                        value: 1,
                        hintText: 'الاجابة الاول',
                        onChanged: (value) {
                          q1GroupValue = value;
                          correctAnswer1 = q1Answer1Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q1Answer2Controller,
                        q1GroupValue: q1GroupValue,
                        value: 2,
                        hintText: 'الاجابة الثانية',
                        onChanged: (value) {
                          q1GroupValue = value;
                          correctAnswer1 = q1Answer2Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q1Answer3Controller,
                        q1GroupValue: q1GroupValue,
                        value: 3,
                        hintText: 'الاجابة الثالثة',
                        onChanged: (value) {
                          q1GroupValue = value;
                          correctAnswer1 = q1Answer3Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q1Answer4Controller,
                        q1GroupValue: q1GroupValue,
                        value: 4,
                        hintText: 'الاجابة الرابعة',
                        onChanged: (value) {
                          q1GroupValue = value;
                          correctAnswer1 = q1Answer4Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.lightGrayColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'السؤال الثاني',
                        style: Styles.bold16
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          video2 = await AdminCubit.get(context)
                              .getQuestionVideoFromGallery();
                          setState(() {});
                        },
                        child: DottedBorder(
                          padding: const EdgeInsets.all(20),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: AppColor.lightGrayColor,
                          dashPattern: const [3, 3],
                          strokeWidth: 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                video2 != null
                                    ? video2!.path.split('/').last
                                    : 'اضافة فيديو',
                                style: Styles.regular16
                                    .copyWith(color: AppColor.lightGrayColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomAnswerWidget(
                        controller: q2Answer1Controller,
                        q1GroupValue: q2GroupValue,
                        value: 1,
                        hintText: 'الاجابة الاول',
                        onChanged: (value) {
                          q2GroupValue = value;
                          correctAnswer2 = q2Answer1Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q2Answer2Controller,
                        q1GroupValue: q2GroupValue,
                        value: 2,
                        hintText: 'الاجابة الثانية',
                        onChanged: (value) {
                          q2GroupValue = value;
                          correctAnswer2 = q2Answer2Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q2Answer3Controller,
                        q1GroupValue: q2GroupValue,
                        value: 3,
                        hintText: 'الاجابة الثالثة',
                        onChanged: (value) {
                          q2GroupValue = value;
                          correctAnswer2 = q2Answer3Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q2Answer4Controller,
                        q1GroupValue: q2GroupValue,
                        value: 4,
                        hintText: 'الاجابة الرابعة',
                        onChanged: (value) {
                          q2GroupValue = value;
                          correctAnswer2 = q2Answer4Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.lightGrayColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'السؤال الثالث',
                        style: Styles.bold16
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          video3 = await AdminCubit.get(context)
                              .getQuestionVideoFromGallery();
                          setState(() {});
                        },
                        child: DottedBorder(
                          padding: const EdgeInsets.all(20),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: AppColor.lightGrayColor,
                          dashPattern: const [3, 3],
                          strokeWidth: 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                video3 != null
                                    ? video3!.path.split('/').last
                                    : 'اضافة فيديو',
                                style: Styles.regular16
                                    .copyWith(color: AppColor.lightGrayColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomAnswerWidget(
                        controller: q3Answer1Controller,
                        q1GroupValue: q3GroupValue,
                        value: 1,
                        hintText: 'الاجابة الاول',
                        onChanged: (value) {
                          q3GroupValue = value;
                          correctAnswer3 = q3Answer1Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q3Answer2Controller,
                        q1GroupValue: q3GroupValue,
                        value: 2,
                        hintText: 'الاجابة الثانية',
                        onChanged: (value) {
                          q3GroupValue = value;
                          correctAnswer3 = q3Answer2Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q3Answer3Controller,
                        q1GroupValue: q3GroupValue,
                        value: 3,
                        hintText: 'الاجابة الثالثة',
                        onChanged: (value) {
                          q3GroupValue = value;
                          correctAnswer3 = q3Answer3Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q3Answer4Controller,
                        q1GroupValue: q3GroupValue,
                        value: 4,
                        hintText: 'الاجابة الرابعة',
                        onChanged: (value) {
                          q3GroupValue = value;
                          correctAnswer3 = q3Answer4Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.lightGrayColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'السؤال الرابع',
                        style: Styles.bold16
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          video4 = await AdminCubit.get(context)
                              .getQuestionVideoFromGallery();
                          setState(() {});
                        },
                        child: DottedBorder(
                          padding: const EdgeInsets.all(20),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: AppColor.lightGrayColor,
                          dashPattern: const [3, 3],
                          strokeWidth: 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                video4 != null
                                    ? video4!.path.split('/').last
                                    :
                                'اضافة فيديو',
                                style: Styles.regular16
                                    .copyWith(color: AppColor.lightGrayColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomAnswerWidget(
                        controller: q4Answer1Controller,
                        q1GroupValue: q4GroupValue,
                        value: 1,
                        hintText: 'الاجابة الاول',
                        onChanged: (value) {
                          q4GroupValue = value;
                          correctAnswer4 = q4Answer1Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q4Answer2Controller,
                        q1GroupValue: q4GroupValue,
                        value: 2,
                        hintText: 'الاجابة الثانية',
                        onChanged: (value) {
                          q4GroupValue = value;
                          correctAnswer4 = q4Answer2Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q4Answer3Controller,
                        q1GroupValue: q4GroupValue,
                        value: 3,
                        hintText: 'الاجابة الثالثة',
                        onChanged: (value) {
                          q4GroupValue = value;
                          correctAnswer4 = q4Answer3Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      CustomAnswerWidget(
                        controller: q4Answer4Controller,
                        q1GroupValue: q4GroupValue,
                        value: 4,
                        hintText: 'الاجابة الرابعة',
                        onChanged: (value) {
                          q4GroupValue = value;
                          correctAnswer4 = q4Answer4Controller.text;
                          setState(() {});
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.lightGrayColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'المكافأت',
                        style: Styles.bold16
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: pointController,
                        prefixIcon: Image.asset(AssetsData.coins),
                        hintText: 'النقاط',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال عدد النقاط';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: diamondController,
                        prefixIcon: Image.asset(AssetsData.diamond),
                        hintText: 'الجواهر',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال عدد الجواهر';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColor.lightGrayColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        height: 45,
                        text: 'حفظ',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (video1 != null &&
                                video2 != null &&
                                video3 != null &&
                                video4 != null) {
                              if (correctAnswer1 != null &&
                                  correctAnswer2 != null &&
                                  correctAnswer3 != null &&
                                  correctAnswer4 != null) {
                                AdminCubit.get(context).addQuiz(
                                  q1Video: video1,
                                  q2Video: video2,
                                  q3Video: video3,
                                  q4Video: video4,
                                  diamonds: int.parse(diamondController.text),
                                  point: int.parse(pointController.text),
                                  categoryId: widget.selectedCategory,
                                  question1: QuestionEntity(
                                      '',
                                      q1Answer1Controller.text,
                                      q1Answer2Controller.text,
                                      q1Answer3Controller.text,
                                      q1Answer4Controller.text,
                                      correctAnswer1!),
                                  question2: QuestionEntity(
                                      '',
                                      q2Answer1Controller.text,
                                      q2Answer2Controller.text,
                                      q2Answer3Controller.text,
                                      q2Answer4Controller.text,
                                      correctAnswer2!),
                                  question3: QuestionEntity(
                                      '',
                                      q3Answer1Controller.text,
                                      q3Answer2Controller.text,
                                      q3Answer3Controller.text,
                                      q3Answer4Controller.text,
                                      correctAnswer3!),
                                  question4: QuestionEntity(
                                      '',
                                      q4Answer1Controller.text,
                                      q4Answer2Controller.text,
                                      q4Answer3Controller.text,
                                      q4Answer4Controller.text,
                                      correctAnswer4!),
                                );
                              } else {
                                getSnackBar('الرجاء تحديد الاجابة الصحيحة');
                              }
                            } else {
                              getSnackBar('الرجاء ادخال جميع الفيديوهات');
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
