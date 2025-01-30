import 'package:asmaak/features/home/presentation/views/notification_view.dart';
import 'package:asmaak/features/home/presentation/views/privacy_view.dart';
import 'package:asmaak/features/home/presentation/views/user_home_root.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/forget_password.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/home/presentation/views/lessons_grid_view.dart';
import '../../features/home/presentation/views/quiz_view.dart';
import '../../features/home/presentation/views/widgets/edit_profile_view.dart';
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
    case LessonsGridView.routeName:
      return MaterialPageRoute(builder: (_) => const LessonsGridView());
    case PrivacyView.routeName:
      return MaterialPageRoute(builder: (_) => const PrivacyView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const EditProfileView());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationView());
    case QuizView.routeName:
      return MaterialPageRoute(builder: (_) => const QuizView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}