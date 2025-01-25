
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    required this.onSaved,
    required this.validator,
    this.hintText,
  });
  final ValueChanged<String?> onSaved;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      obscureText: isObscure,
      onSaved: (value) {
        widget.onSaved(value!);
        setState(() {});
      },
      hintText: widget.hintText?? '**************',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: Icon(
            !isObscure ? Icons.visibility_off : Icons.remove_red_eye_outlined),
        color: AppColor.lightGrayColor.withValues(alpha: .6),
        onPressed: () {
          isObscure = !isObscure;
          setState(() {});
        },
      ),
    );
  }
}