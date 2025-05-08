import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_task/core/functions/on_generate_routes.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/feature/splash/presentation/view/splash_view.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  setupServiceLocator(sharedPreferences);
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
