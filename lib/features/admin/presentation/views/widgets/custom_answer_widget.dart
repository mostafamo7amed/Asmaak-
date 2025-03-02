
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class CustomAnswerWidget extends StatelessWidget {
  const CustomAnswerWidget({
    super.key,
    required this.q1GroupValue,
    required this.value,
    required this.onChanged,
    required this.hintText,
    required this.onSaved, this.controller,
  });

  final int q1GroupValue;
  final int value;
  final ValueChanged<int> onChanged;
  final String hintText;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: AppColor.primaryColor,
          value: value,
          groupValue: q1GroupValue,
          onChanged: (value) => onChanged(value!),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: controller,
            noBorder: true,
            hintText: hintText,
            onSaved: onSaved,
            validator: (value) {
              if (value!.isEmpty) {
                return 'الرجاء ادخال الجواب';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
