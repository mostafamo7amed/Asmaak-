import 'package:flutter/material.dart';
import '../app_manager/app_colors.dart';
import '../app_manager/app_styles.dart';
import 'custom_button_for_dialog.dart';

Future customAlertDialog({
  context,
  message,
  onConfirm,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColor.opacityColor, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:Icon(
                      Icons.delete,
                      color: AppColor.pinkColor,
                      size: 30,),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Styles.regular16.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  height: .5,
                  color: AppColor.lightGrayColor,
                  // indent: 10,
                  // endIndent: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextButtonForDialog(
                      mainTitle: 'تاكيد',
                      textColor: AppColor.whiteColor,
                      onTaped: onConfirm,
                      buttonBackgroundColor: AppColor.pinkColor,
                    ),
                    CustomTextButtonForDialog(
                      mainTitle: 'إلغاء',
                      textColor: AppColor.whiteColor,
                      onTaped: () {
                        Navigator.pop(context);
                      },
                      buttonBackgroundColor: AppColor.lightGrayColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        );
      },
    );
