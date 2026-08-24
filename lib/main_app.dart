import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doctors Appointments',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
