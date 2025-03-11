import 'package:asmaak/core/helper_functions/get_random_color.dart';
import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  static const routeName = 'notificationView';

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    UserCubit.get(context).getUserNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return CustomProgressHud(
          isLoading: state is GetUserNotificationLoadingState,
          child: Scaffold(
            appBar: customAppBar(
              context,
              title: 'الاشعارات',
              showProfile: false,
              showProgress: false,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: buildAuthLinearGradient(),
              ),
              child: cubit.notificationList.isEmpty
                  ? const Center(child: Text('لا يوجد اشعارات'))
                  : ListView.builder(
                      itemCount: cubit.notificationList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: getRandomColor()),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            cubit.notificationList[index].message.toString(),
                            style: Styles.semiBold13,
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
