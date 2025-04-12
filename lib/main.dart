import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:asmaak/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:asmaak/features/on_boarding/presentation/views/on_boarding_1_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/services/app_references.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/dependency_injection.dart';
import 'core/services/git_it_services.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppReference.init();
  setupGitIt();
  Bloc.observer = CustomBlocObserver();
  runApp(const Asmaak());
  DependencyInjection.init();
}

class Asmaak extends StatelessWidget {
  const Asmaak({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => AdminCubit()),
        BlocProvider(create: (context) => UserCubit(),)
      ],
      child: GetMaterialApp(
        locale: Locale('ar', 'SA'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'أَسْمَعُك',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backgroundColor,
          fontFamily: 'Cairo',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: OnBoarding1View.routeName,
      ),
    );
  }
}
