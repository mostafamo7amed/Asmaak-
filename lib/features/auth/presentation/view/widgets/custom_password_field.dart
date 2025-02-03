import 'package:flutter/material.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    required this.onSaved,
    required this.validator,
    this.hintText,
    this.showValidation = false,
  });
  final bool showValidation;
  final ValueChanged<String?> onSaved;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscure = true;
  bool _hasMinLength = false;
  bool _hasUpperCase = false;
  bool _hasSpecialChar = false;
  TextEditingController passwordController = TextEditingController();

  void _validatePassword(String password) {
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: passwordController,
          validator: widget.validator,
          obscureText: isObscure,
          onChanged: (value) {
            _validatePassword(value);
          },
          onSaved: (value) {
            widget.onSaved(value!);
            setState(() {});
          },
          hintText: widget.hintText ?? '**************',
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            icon: Icon(!isObscure
                ? Icons.visibility_off
                : Icons.remove_red_eye_outlined),
            color: AppColor.lightGrayColor.withValues(alpha: .6),
            onPressed: () {
              isObscure = !isObscure;
              setState(() {});
            },
          ),
        ),
        if (widget.showValidation)
          Column(
            children: [
              if (passwordController.text.isNotEmpty) SizedBox(height: 12),
              if (passwordController.text.isNotEmpty)
                buildValidationIndicator("حد أدنى 8 حروف", _hasMinLength),
              if (passwordController.text.isNotEmpty)
                buildValidationIndicator("1 حرف كبير", _hasUpperCase),
              if (passwordController.text.isNotEmpty)
                buildValidationIndicator(
                    "رمز * واحد خاص على الأقل", _hasSpecialChar),
            ],
          ),
      ],
    );
  }

  Widget buildValidationIndicator(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
          size: 13,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
              color: isValid ? Colors.green : Colors.red, fontSize: 11),
        ),
      ],
    );
  }
}
