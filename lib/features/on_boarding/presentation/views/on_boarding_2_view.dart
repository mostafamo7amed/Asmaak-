import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/core/utils/app_manager/app_styles.dart';
import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/features/auth/presentation/view/login_view.dart';
import 'package:asmaak/features/auth/presentation/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';

class OnBoarding2View extends StatelessWidget {
  const OnBoarding2View({super.key});
  static const String routeName = 'OnBoarding2View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: SvgPicture.asset(
                      AssetsData.logo,
                      fit: BoxFit.scaleDown,
                    )),
                Text(
                  'مرحبا بكم في تطبيق أسمعك',
                  textAlign: TextAlign.center,
                  style:
                      Styles.bold19.copyWith(color: AppColor.lightGreenColor),
                ),
                SizedBox(height: 10,),
                Text(
                  'تعلم معنا لغة الإشارة في أبسط صورها، سجل دخولك معنا واستمتع.',
                  textAlign: TextAlign.center,
                  style:
                      Styles.regular13.copyWith(color: AppColor.lightGrayColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                  color: AppColor.primaryColor,
                  text: 'تسجيل دخول',
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'ليس لديك حساب؟ ',
                              style: Styles.regular13
                                  .copyWith(color: AppColor.lightGrayColor),
                            ),
                            TextSpan(
                              text: 'إنشاء حساب جديد',
                              style: Styles.regular13
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.primaryColor),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'إنشاء حساب جديد',
                          textAlign: TextAlign.center,
                          style: Styles.bold16
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
