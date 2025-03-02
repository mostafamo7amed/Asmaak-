import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/view_user_details_view.dart';
import 'package:asmaak/features/auth/domain/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class ManageUsersView extends StatefulWidget {
  const ManageUsersView({super.key});

  @override
  State<ManageUsersView> createState() => _ManageUsersViewState();
}

class _ManageUsersViewState extends State<ManageUsersView> {
  @override
  void initState() {
    AdminCubit.get(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var users = AdminCubit.get(context).allUsers;
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
            child: state is GetUsersLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : users.isEmpty
                    ? Center(
                        child: Text('لا يوجد مستخدمين'),
                      )
                    : ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ViewUserDetailsView.routeName,
                                  arguments: users[index]);
                            },
                            child: AdminUserItem(
                              user: users[index],
                            ),
                          );
                        },
                      ),
          ),
        );
      },
    );
  }
}

class AdminUserItem extends StatelessWidget {
  const AdminUserItem({
    super.key,
    required this.user,
  });
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            colorFilter: ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            user.name ?? '',
            style: Styles.bold16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          user.level ?? '',
          style: Styles.semiBold13.copyWith(color: AppColor.lightGrayColor),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_vert_outlined,
          color: AppColor.lightGrayColor,
        )
      ]),
    );
  }
}
