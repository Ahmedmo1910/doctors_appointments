import 'package:flutter/material.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //? This arguments to be passed in any screen like this (arguments: arguments as class name)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}
