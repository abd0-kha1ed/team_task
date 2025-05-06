import 'package:flutter/material.dart';
import 'package:team_task/core/utils/app_colors.dart';
import 'package:team_task/core/widget/custom_button.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/attachment_box.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/custom_drop_down.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/custom_input.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/data_picker.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/time_picker_filed.dart';

class AddNewTaskViewBody extends StatefulWidget {
  const AddNewTaskViewBody({super.key});

  @override
  State<AddNewTaskViewBody> createState() => _AddNewTaskViewBodyState();
}

class _AddNewTaskViewBodyState extends State<AddNewTaskViewBody> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  String? _selectedCategory;
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          CustomInput(label: 'Title', controller: _titleController),
          const SizedBox(height: 12),
          CustomDropdown(
            label: 'Type',
            value: _selectedType,
            items: ['Individual', 'Team'],
            onChanged: (String? value) => setState(() => _selectedType = value),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DatePickerField(
                  label: 'Start Date',
                  selectedDate: _startDate,
                  onDateSelected: (date) => setState(() => _startDate = date),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DatePickerField(
                  label: 'End Date',
                  selectedDate: _endDate,
                  onDateSelected: (date) => setState(() => _endDate = date),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomDropdown(
            label: 'Category',
            value: _selectedCategory,
            items: ['Important', 'Medium', 'Low'],
            onChanged:
                (String? value) => setState(() => _selectedCategory = value),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TimePickerField(
                  label: 'Start Time',
                  selectedTime: _startTime,
                  onTimeSelected: (time) => setState(() => _startTime = time),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TimePickerField(
                  label: 'End Time',
                  selectedTime: _endTime,
                  onTimeSelected: (time) => setState(() => _endTime = time),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomInput(
            label: 'Description',
            controller: _descriptionController,
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          AttachmentBox(),
          const SizedBox(height: 20),
          CustomButton(
            text: 'create',
            color: AppColors.secondary,
            textColor: Colors.black,
            borderRadius: 22,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Reusable Dropdown Widget
