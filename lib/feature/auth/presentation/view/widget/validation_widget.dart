import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/utils/text_styles.dart';

class ValidationWidget extends StatelessWidget {
  const ValidationWidget({
    super.key,
    required this.isChecked,
    this.onChanged,
    required this.text,
  });
  final void Function(bool?)? onChanged;
  final bool isChecked;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          focusNode: FocusNode(skipTraversal: true),
          value: isChecked,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(child: Text(text, style: AppTextStyles.regular12)),
      ],
    );
  }
}
