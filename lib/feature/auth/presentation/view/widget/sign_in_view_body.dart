import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/auth/presentation/view/widget/custom_text_field.dart';
import 'package:team_task/feature/auth/presentation/view/widget/password_conditions_widget.dart';
import 'package:team_task/feature/auth/presentation/view/widget/validation_widget.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Text(
              'Hello',
              style: AppTextStyles.semiBold48.copyWith(
                color: AppColors.primary,
              ),
            ),
            Text('There!', style: AppTextStyles.semiBold48),
            const SizedBox(height: 12),
            Text(
              'Create an account to access your saved progress and get real-time update on your all tasks. ',
              style: AppTextStyles.regular10.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              hintText: 'Name',
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              prefixIcon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'E-Mail',
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              controller: TextEditingController(),
              obscureText: true,
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {},
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Confirm Password',
              controller: TextEditingController(),
              obscureText: true,
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {},
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            PasswordConditions(text: 'At least 8 characters'),
            const SizedBox(height: 4),
            PasswordConditions(text: 'At least 1 number'),
            const SizedBox(height: 4),
            PasswordConditions(text: 'Both upper and lower case letters'),
            const SizedBox(height: 4),
            PasswordConditions(text: 'At least 8 characters'),
            const SizedBox(height: 48),
            ValidationWidget(
              text:
                  'By agreeing to the terms and conditions, you are entering into a legally binding contract with the service provider.',
              isChecked: false,
              onChanged: (value) {
                // Handle terms and conditions checkbox change
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Sign In',
              color: AppColors.secondary,
              borderRadius: 60,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: AppTextStyles.regular12,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: AppTextStyles.semiBold12.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
