import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

Future customBasicsDialog({
  context,
  message,
  image,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColor.primaryColor)
                        ),
                        child: Icon(Icons.close,color: AppColor.primaryColor,),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  image,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Styles.bold19,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  text: 'تعلمت',
                  textColor: AppColor.whiteColor,
                  onPressed:onConfirm,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
