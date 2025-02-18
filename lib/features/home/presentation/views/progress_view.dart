import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/features/home/presentation/views/quiz_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(context, title: 'الاختبارات',),
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
            fit: StackFit.expand,
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
                right: MediaQuery.of(context).size.width * .18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .33,
                  child: SvgPicture.asset(
                    AssetsData.dotLine,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .08,
                left: MediaQuery.of(context).size.width * .1,
                child: FlowerWidget(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .01,
                right: MediaQuery.of(context).size.width * .41,
                child: SvgPicture.asset(AssetsData.flower7),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .02,
                right: MediaQuery.of(context).size.width * .1,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .32,
                right: MediaQuery.of(context).size.width * .42,
                child: SvgPicture.asset(AssetsData.flower5),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .32,
                right: MediaQuery.of(context).size.width * .35,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .29,
                right: MediaQuery.of(context).size.width * .43,
                child: SvgPicture.asset(AssetsData.flower4),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .22,
                right: MediaQuery.of(context).size.width * .53,
                child: SvgPicture.asset(AssetsData.flower7),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .05,
                right: MediaQuery.of(context).size.width * .01,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .09,
                right: MediaQuery.of(context).size.width * .3,
                child: SvgPicture.asset(AssetsData.flower6),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .15,
                right: MediaQuery.of(context).size.width * .1,
                child: FlowerWidget(),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * .4,
                  left: 0,
                  child: SvgPicture.asset(AssetsData.greenBack)),
              Positioned(
                top: MediaQuery.of(context).size.height * .33,
                right: MediaQuery.of(context).size.width * .07,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.wightLine1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .33,
                right: MediaQuery.of(context).size.width * .1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.yellowLine1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .55,
                right: MediaQuery.of(context).size.width * .09,
                bottom: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.wightLine2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .55,
                right: MediaQuery.of(context).size.width * .09,
                bottom: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: SvgPicture.asset(
                    AssetsData.yellowLine2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .01,
                right: MediaQuery.of(context).size.width * .4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .2,
                  child: SvgPicture.asset(AssetsData.warm),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .18,
                right: MediaQuery.of(context).size.width * .35,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .15,
                  child: SvgPicture.asset(AssetsData.fly),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .29,
                right: MediaQuery.of(context).size.width * .18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .2,
                  child: SvgPicture.asset(AssetsData.snail),
                ),
              ),
              Positioned(
                top:  MediaQuery.of(context).size.height * .31,
                left: 0,
                right: MediaQuery.of(context).size.width * .1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .08,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(AssetsData.yellowBack),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .02,
                        left: 0,
                        right: MediaQuery.of(context).size.width * .06,
                        child: Text(
                          'مستوى متوسط',
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
                top: MediaQuery.of(context).size.height * .49,
                right: MediaQuery.of(context).size.width * .3,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .24,
                  child: SvgPicture.asset(AssetsData.spider),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .02,
                right: MediaQuery.of(context).size.width * .1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .15,
                  child: SvgPicture.asset(AssetsData.lez),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * .05,
                bottom: MediaQuery.of(context).size.height * .1,
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
      width: MediaQuery.of(context).size.width * .17,
      height: MediaQuery.of(context).size.height * .1,
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
