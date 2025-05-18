import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/widget/modal_progress_widget.dart';
import 'package:team_task/feature/add_new_task/presentation/manger/cubit/add_new_task_cubit.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/add_new_task_view_body.dart';

class AddNewTaskViewBodyBlocConsumer extends StatelessWidget {
  const AddNewTaskViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewTaskCubit, AddNewTaskState>(
      listener: (context, state) {
        if (state is AddNewTaskError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        } else if (state is AddNewTaskSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task added successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context, true); // ✅ المفتاح هنا
        }
      },
      builder: (context, state) {
        return ModalProgressWidget(
          isLoading: state is AddNewTaskLoading ? true : false,
          child: AddNewTaskViewBody(),
        );
      },
    );
  }
}
