import 'package:asmaak/features/admin/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper_functions/get_random_color.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/widgets/custom_alert_dialog.dart';
import 'edit_category_dialog.dart';

class AdminCategoryItem extends StatelessWidget {
  const AdminCategoryItem({
    super.key,
    required this.index,
    required this.categoryEntity,
  });
  final int index;
  final CategoryEntity categoryEntity;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 90,
              height: 100,
              child: SvgPicture.asset(categoryEntity.image)),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              categoryEntity.name,
              style: Styles.bold19.copyWith(color: AppColor.whiteColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              customAlertDialog(
                context: context,
                message: 'هل تريد حذف هذا المحتوى؟',
                onConfirm: () {
                  //Navigator.pop(context);
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.whiteColor)),
              child: Icon(
                Icons.delete,
                color: AppColor.whiteColor,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => editCategoryDialog(context),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.whiteColor)),
              child: Icon(
                Icons.edit,
                color: AppColor.whiteColor,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
