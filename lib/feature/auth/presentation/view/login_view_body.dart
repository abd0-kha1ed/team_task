import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Welcome',
            style: AppTextStyles.semiBold48.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
