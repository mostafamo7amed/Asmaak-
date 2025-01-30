import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../../core/helper_functions/pike_date.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import 'custom_app_bar.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});
  static const routeName = 'editProfileView';

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String? dateText = '23/05/2010';
  int selectedGender = 2;
  int notificationGroup = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'تعديل حسابي',
        showProfile: false,
        showProgress: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'الاسم',
                  style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onSaved: (p0) {},
                  controller: TextEditingController(text: 'هيفاء تركي'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الاسم مطلوب';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'البريد الالكتروني',
                  style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: TextEditingController(text: 'haifa@gmail.com'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'البريد الالكتروني مطلوب';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'تاريخ الميلاد',
                  style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: AppColor.primaryColor.withValues(alpha: .6),
                  ),
                  controller: TextEditingController(text: dateText),
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? date = await pickDate(context);
                    if (date != null) {
                      dateText = DateFormat('yyyy/MM/dd').format(date);
                      setState(() {});
                    }
                  },
                  onSaved: (value) {
                    dateText = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'الجنس',
                  style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = 1;
                          });
                        }),
                    Text(
                      'ذكر',
                      style:
                          Styles.bold19.copyWith(color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: 2,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = 2;
                          });
                        }),
                    Text(
                      'انثى',
                      style:
                          Styles.bold19.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'تلقي الاشعارات',
                  style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: notificationGroup,
                        onChanged: (value) {
                          setState(() {
                            notificationGroup = 1;
                          });
                        }),
                    Text(
                      'نعم',
                      style:
                          Styles.bold19.copyWith(color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Radio(
                        value: 2,
                        groupValue: notificationGroup,
                        onChanged: (value) {
                          setState(() {
                            notificationGroup = 2;
                          });
                        }),
                    Text(
                      'لا  ',
                      style:
                          Styles.bold19.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  height: 45,
                  onPressed: () {},
                  text: 'حفظ التعديلات',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
