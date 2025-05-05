import 'package:flutter/material.dart';
import 'package:team_task/feature/splash/presentation/view/splash_view.dart';

/// ***********  ✨ Windsurf Command ⭐  ************
Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
/*******  f493da44-e855-4b10-a415-1d8edc8b32a0  *******/  