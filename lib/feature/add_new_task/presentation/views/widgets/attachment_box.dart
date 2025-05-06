import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';

class AttachmentBox extends StatelessWidget {
  const AttachmentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [6, 4],
      color: AppColors.textSecondary,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      child: SizedBox(
        height: 100,
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              size: 40,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
