
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key, required this.number, required this.isSelected, required this.isCorrect, required this.isWrong,
  });
  final String number;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Column(
        children: [
          Visibility(
            visible: isSelected,
            replacement: SizedBox(height: 20,),
            child: SvgPicture.asset(AssetsData.warm,
              width: 30,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isCorrect ? AppColor.greenColor : isWrong ? AppColor.redColor : AppColor.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? AppColor.blackColor : AppColor.grayColor),
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  number.toString(),
                  style: Styles.bold16.copyWith(color: isSelected ? AppColor.blackColor :  isCorrect|| isWrong?AppColor.blackColor:AppColor.grayColor ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
