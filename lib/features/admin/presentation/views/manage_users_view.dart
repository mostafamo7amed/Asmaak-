import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/view_user_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ManageUsersView extends StatelessWidget {
  const ManageUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAdminAppBar(
        context,
        title: 'المستخدمين',
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ViewUserDetailsView.routeName);

              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                ),
                child: Row(children: [
                  CircleAvatar(
                    radius: 25,
                    child: SvgPicture.asset(
                      AssetsData.profile,
                      height: 25,
                      width: 25,
                      fit: BoxFit.scaleDown,
                      colorFilter:
                          ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'هيفاء تركي',
                      style: Styles.bold16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'مستوي متوسط',
                    style:
                        Styles.semiBold13.copyWith(color: AppColor.lightGrayColor),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.more_vert_outlined,
                    color: AppColor.lightGrayColor,
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
