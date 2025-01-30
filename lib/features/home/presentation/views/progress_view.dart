import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/features/home/presentation/views/quiz_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الاختبارات', showProgress: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        color: AppColor.lightPinkColor,
        height: 40,
        width: MediaQuery.of(context).size.width * .53,
        onPressed: () {
          Navigator.pushNamed(context, QuizView.routeName);
      },
        text: 'أبداء الاختبار',
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: buildAuthLinearGradient(),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -10,
                left: 0,
                right: 0,
                top: 0,
                child: SvgPicture.asset(AssetsData.backgroundProgress,
                    fit: BoxFit.cover),
              ),
              Positioned(
                top: 0,
                right: 60,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: SvgPicture.asset(
                    AssetsData.dotLine,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 30,
                child: FlowerWidget(),
              ),
              Positioned(
                top: 15,
                right: 150,
                child: SvgPicture.asset(AssetsData.flower7),
              ),
              Positioned(
                top: 40,
                right: 30,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                bottom: 250,
                right: 150,
                child: SvgPicture.asset(AssetsData.flower5),
              ),
              Positioned(
                bottom: 250,
                right: 135,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                bottom: 230,
                right: 150,
                child: SvgPicture.asset(AssetsData.flower4),
              ),
              Positioned(
                bottom: 180,
                right: 190,
                child: SvgPicture.asset(AssetsData.flower7),
              ),
              Positioned(
                bottom: 40,
                right: 10,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                bottom: 10,
                right: 120,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                top: 90,
                right: 30,
                child: FlowerWidget(),
              ),
              Positioned(
                  top: 270,
                  left: -20,
                  child: SvgPicture.asset(AssetsData.greenBack)),
              Positioned(
                top: 250,
                right: 25,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.wightLine1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                right: 30,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.yellowLine1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 430,
                right: 35,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.wightLine2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 430,
                right: 35,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.yellowLine2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 135,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: SvgPicture.asset(AssetsData.warm),
                ),
              ),
              Positioned(
                top: 120,
                right: 120,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(AssetsData.fly),
                ),
              ),
              Positioned(
                top: 240,
                right: 65,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: SvgPicture.asset(AssetsData.snail),
                ),
              ),
              Positioned(
                top: 245,
                left: 0,
                right: 20,
                child: SizedBox(
                  width: 10,
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(AssetsData.yellowBack),
                      Positioned(
                        top: 13,
                        left: 0,
                        right: 20,
                        child: Text(
                          'مستوي متوسط',
                          textAlign: TextAlign.center,
                          style: Styles.bold16
                              .copyWith(color: AppColor.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 390,
                right: 120,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: SvgPicture.asset(AssetsData.spider),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 30,
                child: SizedBox(
                  height: 60,
                  width: 50,
                  child: SvgPicture.asset(AssetsData.lez),
                ),
              ),
              Positioned(
                left: 15,
                bottom: 50,
                child: SizedBox(
                  width: 20,
                  height: MediaQuery.of(context).size.height * .5,
                  child: FAProgressBar(
                    currentValue: 60,
                    maxValue: 100,
                    verticalDirection: VerticalDirection.up,
                    direction: Axis.vertical,
                    progressColor: AppColor.primaryColor,
                    backgroundColor: AppColor.opacityColor,
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

class FlowerWidget extends StatelessWidget {
  const FlowerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            right: 10,
            child: SvgPicture.asset(
              AssetsData.flower1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 0,
              right: 10,
              bottom: 0,
              child: SvgPicture.asset(AssetsData.flower2)),
          Positioned(
              top: 5,
              left: 0,
              bottom: 0,
              child: SvgPicture.asset(AssetsData.flower3)),
          Positioned(
              bottom: -4,
              right: -5,
              child: SvgPicture.asset(AssetsData.flower4)),
        ],
      ),
    );
  }
}
