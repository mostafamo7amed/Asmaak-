import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

Future<dynamic> addNotificationDialog(BuildContext context) {
  TextEditingController messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return Dialog(
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اضافة تنبيه جديد',
                        style:
                            Styles.bold16.copyWith(color: AppColor.primaryColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'الاشعار',
                        style: Styles.regular13
                            .copyWith(color: AppColor.lightGrayColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextFormField(
                        controller: messageController,
                        hintText: 'هل أنت جاهز لتعلم إشارة جديدة اليوم؟ 🌟',
                        maxLines: 4,
                        keyboardType: TextInputType.text,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'الرجاء ادخال الاشعار';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              height: 40,
                              text: 'اضافة',
                              color: AppColor.greenColor,
                              textColor: AppColor.whiteColor,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AdminCubit.get(context).addNotification(
                                    message: messageController.text,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomButton(
                              height: 40,
                              text: 'إلغاء',
                              color: AppColor.lightGrayColor,
                              textColor: AppColor.whiteColor,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
