import 'package:asmaak/features/admin/presentation/views/manage_category_view.dart';
import 'package:asmaak/features/admin/presentation/views/manage_lesson_view.dart';
import 'package:asmaak/features/admin/presentation/views/manage_quiz_view.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_quiz_view.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/view_user_details_view.dart';
import 'package:asmaak/features/home/presentation/views/my_points_view.dart';
import 'package:asmaak/features/home/presentation/views/my_profile_view.dart';
import 'package:asmaak/features/home/presentation/views/notification_view.dart';
import 'package:asmaak/features/home/presentation/views/privacy_view.dart';
import 'package:asmaak/features/home/presentation/views/user_home_root.dart';
import 'package:flutter/material.dart';

import '../../features/admin/presentation/views/admin_home_view.dart';
import '../../features/auth/domain/entity/user_entity.dart';
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
      return MaterialPageRoute(builder: (_) => LessonsGridView(
        categoryId: settings.arguments as String,
      ));
    case PrivacyView.routeName:
      return MaterialPageRoute(builder: (_) => const PrivacyView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const EditProfileView());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationView());
    case QuizView.routeName:
      return MaterialPageRoute(builder: (_) => QuizView(categoryId: settings.arguments as String,));
    case MyPointsView.routeName:
      return MaterialPageRoute(builder: (_) => const MyPointsView());
    case MyProfileView.routeName:
      return MaterialPageRoute(builder: (_) => MyProfileView(
        showBack: settings.arguments as bool,
      ));
    // Admin Routes
    case AdminHomeView.routeName:
      return MaterialPageRoute(builder: (_) => const AdminHomeView());
    case ManageCategoryView.routeName:
      return MaterialPageRoute(builder: (_) => ManageCategoryView());
    case ManageLessonView.routeName:
      return MaterialPageRoute(builder: (_) => const ManageLessonView());
    case ManageQuizView.routeName:
      return MaterialPageRoute(builder: (_) => const ManageQuizView());
    case AddQuizView.routeName:
      return MaterialPageRoute(builder: (_) =>  AddQuizView(selectedCategory: settings.arguments as String,));
    case ViewUserDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => ViewUserDetailsView( user:  settings.arguments as UserEntity,));
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
