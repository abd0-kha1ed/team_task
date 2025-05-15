import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';

class PasswordConditions extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordConditions({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color:
                isValid ? Colors.green : AppColors.textSecondary.withAlpha(100),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.regular12.copyWith(
            color: isValid ? Colors.green : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
