import 'package:asmaak/core/utils/widgets/custom_text_form_field.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'custom_answer_widget.dart';

class AddQuizView extends StatefulWidget {
  const AddQuizView({super.key});
  static const String routeName = 'addQuiz';

  @override
  State<AddQuizView> createState() => _AddQuizViewState();
}

class _AddQuizViewState extends State<AddQuizView> {
  int q1GroupValue = -1;
  int q2GroupValue = -1;
  int q3GroupValue = -1;
  int q4GroupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAdminAppBar(context, title: 'اضافة اختبار', showBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'السؤال الاول',
                style: Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // cubit.pickImage();
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
                        'اضافة فديو',
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
                q1GroupValue: q1GroupValue,
                value: 1,
                hintText: 'الاجابة الاول',
                onChanged: (value) {
                  q1GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q1GroupValue,
                value: 2,
                hintText: 'الاجابة الثانية',
                onChanged: (value) {
                  q1GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q1GroupValue,
                value: 3,
                hintText: 'الاجابة الثالثة',
                onChanged: (value) {
                  q1GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q1GroupValue,
                value: 4,
                hintText: 'الاجابة الرابعة',
                onChanged: (value) {
                  q1GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColor.lightGrayColor,),
              SizedBox(
                height: 10,
              ),
              Text(
                'السؤال الثاني',
                style: Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // cubit.pickImage();
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
                        'اضافة فديو',
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
                q1GroupValue: q2GroupValue,
                value: 1,
                hintText: 'الاجابة الاول',
                onChanged: (value) {
                  q2GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q2GroupValue,
                value: 2,
                hintText: 'الاجابة الثانية',
                onChanged: (value) {
                  q2GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q2GroupValue,
                value: 3,
                hintText: 'الاجابة الثالثة',
                onChanged: (value) {
                  q2GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q2GroupValue,
                value: 4,
                hintText: 'الاجابة الرابعة',
                onChanged: (value) {
                  q2GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColor.lightGrayColor,),
              SizedBox(
                height: 10,
              ),
              Text(
                'السؤال الثالث',
                style: Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // cubit.pickImage();
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
                        'اضافة فديو',
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
                q1GroupValue: q3GroupValue,
                value: 1,
                hintText: 'الاجابة الاول',
                onChanged: (value) {
                  q3GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q3GroupValue,
                value: 2,
                hintText: 'الاجابة الثانية',
                onChanged: (value) {
                  q3GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q3GroupValue,
                value: 3,
                hintText: 'الاجابة الثالثة',
                onChanged: (value) {
                  q3GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q3GroupValue,
                value: 4,
                hintText: 'الاجابة الرابعة',
                onChanged: (value) {
                  q3GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColor.lightGrayColor,),
              SizedBox(
                height: 10,
              ),
              Text(
                'السؤال الرابع',
                style: Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // cubit.pickImage();
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
                        'اضافة فديو',
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
                q1GroupValue: q4GroupValue,
                value: 1,
                hintText: 'الاجابة الاول',
                onChanged: (value) {
                  q4GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q4GroupValue,
                value: 2,
                hintText: 'الاجابة الثانية',
                onChanged: (value) {
                  q4GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q4GroupValue,
                value: 3,
                hintText: 'الاجابة الثالثة',
                onChanged: (value) {
                  q4GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              CustomAnswerWidget(
                q1GroupValue: q4GroupValue,
                value: 4,
                hintText: 'الاجابة الرابعة',
                onChanged: (value) {
                  q4GroupValue = value;
                  setState(() {});
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColor.lightGrayColor,),
              SizedBox(
                height: 10,
              ),
              Text(
                'المكافأت',
                style: Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onSaved: (p0) {

                },
                prefixIcon: Image.asset(AssetsData.coins),
                hintText: 'النقاط',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء ادخال النقاط';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onSaved: (p0) {

                },
                prefixIcon: Image.asset(AssetsData.diamond),
                hintText: 'الجواهر',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء ادخال الجواهر';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 20,),
              Divider(
                color: AppColor.lightGrayColor,),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                height: 45,
                text: 'حفظ',
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
