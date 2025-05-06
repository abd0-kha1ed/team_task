import 'package:flutter/material.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(
          title: task['title'],
          subtitle: task['subtitle'],
          time: task['time'],
          status: task['status'],
          statusColor: task['statusColor'],
        );
      },
    );
  }
}
