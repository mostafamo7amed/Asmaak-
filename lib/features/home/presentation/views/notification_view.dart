import 'package:asmaak/core/helper_functions/get_random_color.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper_functions/auth_linear_gradient.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static const routeName = 'notificationView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text(
                'مرحبًا! هل أنت جاهز لتعلم إشارة جديدة اليوم؟ 🌟',
                style: Styles.semiBold13,
              ),
            );
          },
        ),
      ),
    );
  }
}
