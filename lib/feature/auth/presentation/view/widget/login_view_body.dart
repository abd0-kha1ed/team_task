import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/register_view.dart';

import 'package:team_task/feature/auth/presentation/view/widget/custom_text_field.dart';
import 'package:team_task/feature/auth/presentation/view/widget/validation_widget.dart';
import 'package:team_task/feature/home/presentation/view/home_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool obscurePassword = true;
  String? email;
  String? password;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is LoginSuccess) {
              // Navigate to the next screen or show success message
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeView.routeName, // Replace with your home route name
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formkey,
              autovalidateMode: autovalidateMode,
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
                    onChanged: (value) {
                      email = value;
                    },
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
                  CustomTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: obscurePassword,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
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
                  state is LoginLoading
                      ? Center(child: const CircularProgressIndicator())
                      : CustomButton(
                        text: 'Login',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              autovalidateMode = AutovalidateMode.disabled;
                              context.read<LoginCubit>().login(
                                email: email!,
                                password: password!,
                              );
                            });
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
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
            );
          },
        ),
      ),
    );
  }
}
