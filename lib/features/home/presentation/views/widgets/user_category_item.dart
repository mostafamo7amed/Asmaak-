import 'package:asmaak/features/admin/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper_functions/get_random_color.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class UserCategoryItem extends StatelessWidget {
  const UserCategoryItem({
    super.key,
    required this.index,
    required this.category,
  });
  final int index;
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index < colors.length ? colors[index] : getRandomColor(),
      ),
      child: Row(
        children: [
          SizedBox(
              width: 120, height: 100, child: SvgPicture.asset(category.image)),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.whiteColor)),
                child: Icon(
                  Icons.play_arrow,
                  color: AppColor.whiteColor,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '0',
                      style: Styles.bold16.copyWith(color: AppColor.whiteColor),
                    ),
                    TextSpan(
                      text: '/',
                      style: Styles.bold16.copyWith(color: AppColor.whiteColor),
                    ),
                    TextSpan(
                      text: '10',
                      style: Styles.bold16.copyWith(color: AppColor.whiteColor),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                category.name,
                style: Styles.bold19.copyWith(color: AppColor.whiteColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
