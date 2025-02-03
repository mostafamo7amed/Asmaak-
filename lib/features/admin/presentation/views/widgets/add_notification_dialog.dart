import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

Future<dynamic> addNotificationDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اضافة تنبيه جديد',
                style: Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'الاشعار',
                style:
                Styles.regular13.copyWith(color: AppColor.lightGrayColor),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                hintText:  'هل أنت جاهز لتعلم إشارة جديدة اليوم؟ 🌟',
                maxLines: 4,
                keyboardType: TextInputType.text,
                onSaved: (value) {},
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
                      onPressed: () {},
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
      );
    },
  );
}