import 'package:flutter/material.dart';

import '../utils/app_manager/app_colors.dart';

LinearGradient buildAuthLinearGradient() {
  return LinearGradient(
    stops:
    [0.5, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColor.backgroundColor,
      AppColor.opacityColor,
    ],
  );
}