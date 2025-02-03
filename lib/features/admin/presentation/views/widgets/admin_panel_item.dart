import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class AdminPanelItem extends StatelessWidget {
  const AdminPanelItem({
    super.key, required this.title, required this.icon, this.onTap,
  });
  final String title;
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 25,
                width: 25,
                colorFilter: ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
              ),
              SizedBox(width: 10,),
              Text(title,style: Styles.bold19.copyWith(color: AppColor.primaryColor),),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}