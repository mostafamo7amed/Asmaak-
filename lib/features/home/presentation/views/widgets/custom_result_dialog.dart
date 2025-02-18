import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/features/home/presentation/views/user_home_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

Future customResultDialog({context, message,score}) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .21,
                    left: MediaQuery.of(context).size.width * .07,
                    right: MediaQuery.of(context).size.width * .07,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primaryColor.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text('٤/$score',style: Styles.bold23.copyWith(color: AppColor.primaryColor),),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset(
                        AssetsData.snail,
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              color: AppColor.lightGrayColor
                                  .withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColor.grayColor.withValues(alpha: 0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '2',
                                    style: Styles.bold16,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Image.asset(AssetsData.diamond),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '5',
                                    style: Styles.bold16,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Image.asset(AssetsData.coins),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        height: 40,
                        text: 'حسناً',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, UserHomeRoot.routeName);
                      },),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .23,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SvgPicture.asset(
                            width: MediaQuery.of(context).size.width * .8,
                            AssetsData.result,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.scaleDown,
                          ),
                          Positioned(
                              bottom: 0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .8,
                                height: MediaQuery.of(context).size.height * .1,
                                child: Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: Styles.bold19
                                      .copyWith(color: AppColor.whiteColor),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
