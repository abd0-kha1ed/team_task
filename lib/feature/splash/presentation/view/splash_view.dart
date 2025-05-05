import 'package:flutter/material.dart';
import 'package:team_task/feature/splash/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/splashView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffDFF2EB), body: SplashViewBody());
  }
}
