import 'package:asmaak/features/admin/presentation/views/widgets/add_notification_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/helper_functions/get_random_color.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';

class ManageNotificationView extends StatelessWidget {
  const ManageNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: buildAuthLinearGradient(),
        ),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                      'هل أنت جاهز لتعلم إشارة جديدة اليوم؟ 🌟',
                      style: Styles.semiBold13,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      customAlertDialog(
                        context: context,
                        message: 'هل تريد حذف هذا التنبية؟',
                        onConfirm: () {
                          //Navigator.pop(context);
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.redColor)),
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
        ),
      ),
    );
  }
}
