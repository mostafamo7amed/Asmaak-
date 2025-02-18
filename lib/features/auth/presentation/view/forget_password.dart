import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/core/utils/widgets/custom_text_form_field.dart';
import 'package:asmaak/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static const routeName = 'ForgetPassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? email;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginResetPasswordSuccess) {
            getSnackBar('تم ارسال الرقم السري الى بريدك الالكتروني');
            formKey.currentState!.reset();
          }
          if (state is LoginResetPasswordError) {
            getSnackBar('حدث خطأ ، يرجى المحاولة مرة اخرى');
          }
        },
        builder: (context, state) {
          return CustomProgressHud(
            isLoading: state is LoginResetPasswordLoading ? true : false,
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
                  AssetsData.progress2,
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: autoValidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'نسيت الرقم السري',
                              style: Styles.bold28
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                            hintText: 'أدخل البريد الإلكتروني',
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
                          CustomButton(
                            onPressed: () {
                             /* if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context
                                    .read<LoginCubit>()
                                    .resetPassword(email!);
                              }*/
                            },
                            text: 'أرسال الرمز',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
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
