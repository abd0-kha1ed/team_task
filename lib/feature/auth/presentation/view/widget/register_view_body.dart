import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/widget/custom_text_field.dart';
import 'package:team_task/feature/auth/presentation/view/widget/password_conditions_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool isobscurePassword = true;
  bool isobscureConfirmPassword = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool has8Characters(String text) => text.length >= 8;
  bool hasNumber(String text) => RegExp(r'[0-9]').hasMatch(text);
  bool hasUpperAndLower(String text) =>
      RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(text);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),

        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
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
                'Create an account to access your saved progress and get real-time update on all your tasks.',
                style: AppTextStyles.regular10.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),

              // Name Field
              CustomTextField(
                onChanged: (value) => name = value,
                hintText: 'Name',
                controller: nameController,
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

              // Email Field
              CustomTextField(
                onChanged: (value) => email = value,
                hintText: 'E-Mail',
                controller: emailController,
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

              // Password Field
              CustomTextField(
                onChanged: (value) => password = value,
                hintText: 'Password',
                controller: passwordController,
                obscureText: isobscurePassword,
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: Icon(
                    isobscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isobscurePassword = !isobscurePassword;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (!has8Characters(value)) {
                    return 'Password must be at least 8 characters';
                  }
                  if (!hasNumber(value)) {
                    return 'Password must contain at least 1 number';
                  }
                  if (!hasUpperAndLower(value)) {
                    return 'Password must contain both upper and lower case letters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password Field
              CustomTextField(
                onChanged: (value) => confirmPassword = value,
                hintText: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: isobscureConfirmPassword,
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: Icon(
                    isobscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isobscureConfirmPassword = !isobscureConfirmPassword;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              PasswordConditions(
                text: 'At least 8 characters',
                isValid: has8Characters(passwordController.text),
              ),
              const SizedBox(height: 4),

              PasswordConditions(
                text: 'At least 1 number',
                isValid: hasNumber(passwordController.text),
              ),
              const SizedBox(height: 4),

              PasswordConditions(
                text: 'Both upper and lower case letters',
                isValid: hasUpperAndLower(passwordController.text),
              ),
              const SizedBox(height: 48),

              // Terms and Conditions
              
              const SizedBox(height: 16),

              // Submit Button
              CustomButton(
                text: 'Sign In',
                color: AppColors.secondary,
                borderRadius: 60,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      autovalidateMode = AutovalidateMode.disabled;
                      // Call your registration function here
                      context.read<RegisterCubit>().register(
                        name: name!,
                        email: email!,
                        password: password!,
                      );
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
                    });
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // Navigation to login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: AppTextStyles.regular12,
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
      ),
    );
  }
}
