import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/custom_input.dart';

class AddNewTaskViewBody extends StatefulWidget {
  const AddNewTaskViewBody({super.key});

  @override
  State<AddNewTaskViewBody> createState() => _AddNewTaskViewBodyState();
}

class _AddNewTaskViewBodyState extends State<AddNewTaskViewBody> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      autovalidateMode: _autovalidateMode,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomInput(label: 'Title', controller: _titleController),
            const SizedBox(height: 12),

            CustomInput(
              label: 'Description',
              controller: _descriptionController,
              maxLines: 4,
            ),
            const SizedBox(height: 28),
            CustomButton(
              text: 'create',
              color: AppColors.secondary,
              textColor: Colors.black,
              borderRadius: 22,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Dropdown Widget
