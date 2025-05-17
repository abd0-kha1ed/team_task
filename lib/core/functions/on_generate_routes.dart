import 'package:flutter/material.dart';
import 'package:team_task/feature/add_new_task/presentation/views/add_new_task_view.dart';
import 'package:team_task/feature/auth/presentation/view/login_view.dart';
import 'package:team_task/feature/auth/presentation/view/register_view.dart';
import 'package:team_task/feature/home/presentation/view/home_view.dart';

import 'package:team_task/feature/splash/presentation/view/splash_view.dart';

/// ***********  ✨ Windsurf Command ⭐  ************
Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case AddNewTaskView.routeName:
      return MaterialPageRoute(builder: (context) => const AddNewTaskView());
    default:
      return MaterialPageRoute(
        builder:
            (context) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
      );
  }
}
/*******  f493da44-e855-4b10-a415-1d8edc8b32a0  *******/  