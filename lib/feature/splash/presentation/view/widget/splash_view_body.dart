import 'package:flutter/material.dart';
import 'package:team_task/core/utils/assets.dart';
import 'package:team_task/core/utils/text_styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesSplashLogo),
        Text('Task Management', style: AppTextStyles.bold24),
      ],
    );
  }
}
