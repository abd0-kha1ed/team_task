import 'package:flutter/material.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(
          task: task,
          onChanged: (value) {
            // Handle checkbox state change
            // You can use a callback or a state management solution to update the task's state
          },
        );
      },
    );
  }
}
