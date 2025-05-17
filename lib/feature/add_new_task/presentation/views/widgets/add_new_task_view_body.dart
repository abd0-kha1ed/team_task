import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/add_new_task_entity.dart';
import 'package:team_task/feature/add_new_task/presentation/manger/cubit/add_new_task_cubit.dart';
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
  String? _title, _description;
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
            CustomInput(
              onsaved: (value) {
                _title = value;
              },

              label: 'Title',
              controller: _titleController,
            ),
            const SizedBox(height: 12),

            CustomInput(
              onsaved: (value) {
                _description = value;
              },
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

                  context.read<AddNewTaskCubit>().addNewTask(
                    AddNewTaskEntity(
                      title: _title!,
                      description: _description!,
                      dueData:
                          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                    ),
                  );
                  _titleController.clear();
                  _descriptionController.clear();
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
