
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_styles.dart';

class CustomChooseWidget extends StatelessWidget {
  const CustomChooseWidget({
    super.key,
    required this.title,
    required this.color, this.onPressed,
  });
  final String title;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: Styles.bold16,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
