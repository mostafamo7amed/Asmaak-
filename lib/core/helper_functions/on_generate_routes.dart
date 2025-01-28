import 'package:asmaak/features/home/presentation/views/user_home_root.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/forget_password.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_1_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_2_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoarding1View.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoarding1View());
    case OnBoarding2View.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoarding2View());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case ForgetPassword.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPassword());
    case UserHomeRoot.routeName:
      return MaterialPageRoute(builder: (_) => const UserHomeRoot());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}