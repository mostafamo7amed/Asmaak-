import 'package:asmaak/core/utils/widgets/custom_progress_hud.dart';
import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_notification_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/helper_functions/get_random_color.dart';
import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';

class ManageNotificationView extends StatefulWidget {
  const ManageNotificationView({super.key});

  @override
  State<ManageNotificationView> createState() => _ManageNotificationViewState();
}

class _ManageNotificationViewState extends State<ManageNotificationView> {
  @override
  void initState() {
    AdminCubit.get(context).getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AddNotificationSuccessState) {
          getSnackBar('تم الاضافة بنجاح');
          AdminCubit.get(context).getNotifications();
        }
        if (state is DeleteNotificationSuccessState) {
          getSnackBar('تم الحذف بنجاح');
          AdminCubit.get(context).getNotifications();
        }
      },
      builder: (context, state) {
        var notifications = AdminCubit.get(context).allNotifications;
        return Scaffold(
          appBar: buildAdminAppBar(context, title: "الاشعارات"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addNotificationDialog(context);
            },
            backgroundColor: AppColor.greenColor,
            child: Text(
              'اضافة',
              style: Styles.bold16.copyWith(color: AppColor.whiteColor),
            ),
          ),
          body: CustomProgressHud(
            isLoading: state is GetNotificationsLoadingState ||
                state is AddNotificationLoadingState ||
                state is DeleteNotificationLoadingState,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: buildAuthLinearGradient(),
              ),
              child: notifications.isNotEmpty
                  ? ListView.builder(
                      itemCount: notifications.length,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  notifications[index].message ?? '',
                                  style: Styles.semiBold13,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  customAlertDialog(
                                    context: context,
                                    message: 'هل تريد حذف هذا التنبية؟',
                                    onConfirm: () {
                                      AdminCubit.get(context)
                                          .deleteNotification(
                                              id: notifications[index].id!);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppColor.redColor)),
                                  child: Icon(
                                    Icons.delete,
                                    color: AppColor.redColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('لا يوجد اشعارات'),
                    ),
            ),
          ),
        );
      },
    );
  }
}
