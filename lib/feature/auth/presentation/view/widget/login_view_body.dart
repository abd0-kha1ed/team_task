import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/auth/presentation/view/register_view.dart';
import 'package:team_task/feature/auth/presentation/view/widget/custom_text_field.dart';
import 'package:team_task/feature/auth/presentation/view/widget/validation_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
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
              'Welcome',
              style: AppTextStyles.semiBold48.copyWith(
                color: AppColors.primary,
              ),
            ),
            Text('Back!', style: AppTextStyles.semiBold48),
            const SizedBox(height: 12),
            Text(
              'Sign in to your account to access your saved progress and get real-time update on your all tasks.',
              style: AppTextStyles.regular10.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 20),
            ValidationWidget(
              text: 'Remember Me',
              isChecked: false,
              onChanged: (value) {
                // Handle remember me checkbox change
              },
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: 'Login',
              onPressed: () {},
              color: AppColors.secondary,
              textColor: Colors.black,
              borderRadius: 60,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: AppTextStyles.regular12,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterView.routeName);
                  },
                  child: Text(
                    'Sign Up',
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
