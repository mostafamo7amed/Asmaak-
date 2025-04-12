import 'package:asmaak/core/services/app_references.dart';
import 'package:asmaak/core/utils/extensions.dart';
import 'package:asmaak/features/admin/domain/entity/category_entity.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper_functions/get_random_color.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class UserCategoryItem extends StatefulWidget {
  const UserCategoryItem({
    super.key,
    required this.index,
    required this.category,
  });
  final int index;
  final CategoryEntity category;

  @override
  State<UserCategoryItem> createState() => _UserCategoryItemState();
}

class _UserCategoryItemState extends State<UserCategoryItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.index < colors.length
                ? colors[widget.index]
                : getRandomColor(),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          text: AppReference.getData(key: widget.category.id)??'0',
                          style: Styles.bold16
                              .copyWith(color: AppColor.whiteColor),
                        ),
                        TextSpan(
                          text: '/',
                          style: Styles.bold16
                              .copyWith(color: AppColor.whiteColor),
                        ),
                        TextSpan(
                          text: cubit.categoriesLength.isNotEmpty
                              ? cubit.categoriesLength[widget.category.id]
                                  .toString()
                              : '0',
                          style: Styles.bold16
                              .copyWith(color: AppColor.whiteColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.category.name,
                    style: Styles.bold19.copyWith(color: AppColor.whiteColor),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                      widget.category.image,
                      fit: BoxFit.contain)
                      .cornerRadiusWithClipRRect(14)),
            ],
          ),
        );
      },
    );
  }
}
