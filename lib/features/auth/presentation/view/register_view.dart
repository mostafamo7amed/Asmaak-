import 'package:asmaak/constants.dart';
import 'package:asmaak/core/services/app_references.dart';
import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/core/utils/widgets/custom_text_form_field.dart';
import 'package:asmaak/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:asmaak/features/auth/presentation/view/widgets/custom_password_field.dart';
import 'package:asmaak/features/home/presentation/views/user_home_root.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static const routeName = 'registerView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.read<RegisterCubit>().createUser(
                  userName: name!,
                  email: email!,
                  gender: '',
                  dateOfBirth: '',
                  userUid: state.user.uid,
                );
            AppReference.setData(key: uidKey, data: state.user.uid);
          } else if (state is RegisterError) {
            getSnackBar('حدث خطأ ما من فضلك حاول مرة اخرى');
          }
          if (state is RegisterCreateUserSuccess) {
            getSnackBar('تم التسجيل بنجاح');
            AppReference.setData(key: authKey, data: true);
            formKey.currentState!.reset();
            Navigator.pushReplacementNamed(context, UserHomeRoot.routeName);
          }
        },
        builder: (context, state) {
          return CustomProgressHud(
            isLoading: state is RegisterLoading ? true : false,
            child: Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
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
                title: SvgPicture.asset(
                  AssetsData.progress1,
                  fit: BoxFit.scaleDown,
                  height: 10,
                ),
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
                      child: Form(
                        key: formKey,
                        autovalidateMode: autoValidateMode,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'إنشاء حساب',
                              style: Styles.bold28
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'الاسم',
                              style: Styles.regular16,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomTextFormField(
                              hintText: 'أدخل الاسم',
                              maxLines: 1,
                              onSaved: (value) {
                                name = value;
                              },
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
                              style: Styles.regular16,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomTextFormField(
                              hintText: 'أدخل البريد الالكتروني',
                              maxLines: 1,
                              onSaved: (value) {
                                email = value;
                              },
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
                              showValidation: true,
                              onSaved: (value) {
                                password = value;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'تأكيد كلمة المرور',
                              style: Styles.regular16,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomPasswordFormField(
                              onSaved: (value) {
                                confirmPassword = value;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  if (password != confirmPassword) {
                                    getSnackBar('كلمة المرور غير متطابقة');
                                  } else {
                                    context.read<RegisterCubit>().registerUser(
                                          name: name!,
                                          email: email!,
                                          password: password!,
                                        );
                                  }
                                }
                              },
                              text: 'إنشاء حساب',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'لديك حساب؟ ',
                                      style: Styles.regular16.copyWith(
                                          color: AppColor.lightGrayColor),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacementNamed(
                                              context, LoginView.routeName);
                                        },
                                      text: 'تسجيل الدخول',
                                      style: Styles.bold16.copyWith(
                                          color: AppColor.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                           /* Center(
                              child: Text(
                                '- التسجيل عن طريق -',
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
                                  onTap: () {},
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
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: AppColor.primaryColor,
                                    child: CircleAvatar(
                                      radius: 23,
                                      backgroundColor: AppColor.whiteColor,
                                      child:
                                          SvgPicture.asset(AssetsData.google),
                                    ),
                                  ),
                                ),
                              ],
                            ),*/
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
