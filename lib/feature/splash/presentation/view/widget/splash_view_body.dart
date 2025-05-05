import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/assets.dart';
import 'package:team_task/feature/auth/presentation/view/login_view.dart';
import 'package:team_task/feature/splash/presentation/view/widget/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesSplashLogo),
        SlidingText(slidingAnimation: slidingAnimation),
        const SizedBox(height: 16),
        const CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        ),
      ],
    );
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 12),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
