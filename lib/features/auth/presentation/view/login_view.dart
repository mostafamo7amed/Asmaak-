import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/core/utils/widgets/custom_text_form_field.dart';
import 'package:asmaak/features/auth/presentation/view/register_view.dart';
import 'package:asmaak/features/auth/presentation/view/widgets/custom_password_field.dart';
import 'package:asmaak/features/home/presentation/views/user_home_root.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import 'forget_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Icon(
              size: 30,
              Icons.arrow_back_ios,
              color: AppColor.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(AssetsData.progress1,fit: BoxFit.scaleDown,height: 10,),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
           physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Text(
                    'دخول',
                    style: Styles.bold28.copyWith(color: AppColor.primaryColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*Text(
                    'الاسم',
                    style: Styles.regular16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    hintText: 'مثل : هيفاء تركي',
                    maxLines: 1,
                    onSaved: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'الاسم مطلوب';
                      }
                      return null;
                    },
                  ),*/
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'البريد الإلكتروني',
                    style: Styles.regular16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    hintText: 'أدخل بريدك الالكتروني',
                    maxLines: 1,
                    onSaved: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'البريد الإلكتروني مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'كلمة المرور',
                    style: Styles.regular16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomPasswordFormField(
                    onSaved: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ForgetPassword.routeName);
                        },
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: Styles.regular13
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, UserHomeRoot.routeName);
                    },
                    text: 'تسجيل الدخول',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'ليس لديك حساب؟ ',
                            style: Styles.regular16
                                .copyWith(color: AppColor.lightGrayColor),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushReplacementNamed(context, RegisterView.routeName);
                            },
                            text: 'إنشاء حساب',
                            style: Styles.bold16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '- تسجيل الدخول عن طريق -',
                      style: Styles.regular13
                          .copyWith(color: AppColor.lightGrayColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
            
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColor.primaryColor,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: AppColor.whiteColor,
                            child: SvgPicture.asset(AssetsData.apple),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
            
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColor.primaryColor,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: AppColor.whiteColor,
                            child: SvgPicture.asset(AssetsData.google),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
