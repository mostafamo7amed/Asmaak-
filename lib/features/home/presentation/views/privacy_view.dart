import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});
  static const routeName = 'privacy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shadowColor: AppColor.lightGrayColor,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: SizedBox(),
        leadingWidth: 0,
        centerTitle: true,
        titleSpacing: 0,
        title: SvgPicture.asset(
          AssetsData.progress1,
          fit: BoxFit.scaleDown,
          height: 10,
        ),
        actions: [
          Visibility(
            visible: true,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: buildAuthLinearGradient(),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: AppColor.whiteColor,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الأتفاقية',
                            style: Styles.bold19
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "عزيزي المستخدم،",
                            style: Styles.regular16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "باستخدامك لتطبيق \"أسمعك\" فإنك توافق على التالي:",
                            style: Styles.regular16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            " ١- تنحن ملتزمون بحماية بياناتك، ولن نشاركها مع أي طرف آخر.",
                            style: Styles.regular16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            " ٢- لا يُسمح باستخدام التطبيق لأي أغراض غير قانونية.",
                            style: Styles.regular16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            " ٣- يُمنع انتهاك حقوق الملكية الفكرية لأي طرف ثالث.",
                            style: Styles.regular16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SvgPicture.asset(AssetsData.purpleWorm),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
