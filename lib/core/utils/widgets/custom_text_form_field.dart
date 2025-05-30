import 'package:flutter/material.dart';

import '../app_manager/app_colors.dart';
import '../app_manager/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, this.suffixIcon,this.prefixIcon, this.hintText, this.validator, this.keyboardType, this.onSaved,  this.obscureText = false, this.noBorder= false, this.onTap, this.controller, this.maxLines=1, this.onChanged, this.readOnly = false});
  final Widget? suffixIcon,prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool noBorder;
  final int maxLines;
  final TextEditingController? controller;
  final bool readOnly;


  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType,
        style: Styles.regular16,
        maxLines: maxLines,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Styles.regular16.copyWith(color: AppColor.lightGrayColor),
          fillColor:noBorder?AppColor.backgroundColor: Colors.transparent,
          filled: true,
          border: noBorder? buildOutlineInputBorderCustom(): buildOutlineInputBorder(),
          enabledBorder:noBorder? buildOutlineInputBorderCustom(): buildOutlineInputBorder(),
          focusedBorder:noBorder? buildOutlineInputBorderCustom(): buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: .5,
        color: AppColor.lightGrayColor,
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorderCustom() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColor.backgroundColor,
        width: 1,
      )
  );
}
