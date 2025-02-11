import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class MyPointsView extends StatelessWidget {
  const MyPointsView({super.key});
  static const String routeName = 'myPointsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: 'نقاطي',
          showProgress: false,
          showProfile: false,
          showBack: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      width: 50,
                      AssetsData.lez,
                      ),
                    Text('مستوي متوسط', style: Styles.bold23.copyWith(color: AppColor.purpleColor),),
                    SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'نقاطي',
                      style:
                          Styles.bold16.copyWith(color: AppColor.primaryColor),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '10',
                    style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    AssetsData.coins,
                    fit: BoxFit.cover,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5',
                    style: Styles.bold19.copyWith(color: AppColor.primaryColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    AssetsData.diamond,
                    fit: BoxFit.cover,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'تقدمي',
                      style:
                          Styles.bold16.copyWith(color: AppColor.primaryColor),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      '50',
                      style:
                          Styles.bold19.copyWith(color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: LinearProgressBar(
                        maxSteps: 90,
                        progressType: LinearProgressBar
                            .progressTypeLinear, // Use Linear progress
                        currentStep: 50,
                        progressColor: AppColor.orangeTextColor,
                        backgroundColor: AppColor.checkBoxColor,
                        minHeight: 30,
                        borderRadius: BorderRadius.circular(10), //  NEW
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '90',
                      style:
                          Styles.bold19.copyWith(color: AppColor.primaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColor.pinkColor,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'النتائج السابقة',
                style: Styles.bold19.copyWith(color: AppColor.pinkColor),
              ),
              SizedBox(
                height: 10,
              ),
              LastResultWidget(
                message: 'ممتاز',
                result: '٤',
              ),
              LastResultWidget(
                message: 'جيد جدا',
                result: '٣',
              ),
              LastResultWidget(
                message: 'جيد',
                result: '٢',
              ),
              LastResultWidget(
                message: 'ضعيف',
                result: '١',
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SvgPicture.asset(
                      AssetsData.spider,
                      width: 130,
                    ),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LastResultWidget extends StatelessWidget {
  const LastResultWidget({
    super.key,
    required this.message,
    required this.result,
  });
  final String message;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.yellowTextColor.withValues(alpha: .4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: AppColor.purpleColor,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            message,
            style: Styles.bold16.copyWith(color: AppColor.purpleColor),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '$result/٤',
            style: Styles.bold16.copyWith(color: AppColor.purpleColor),
          ),
        ],
      ),
    );
  }
}
