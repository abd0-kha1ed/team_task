import 'package:flutter/material.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  final Function(bool?)? onChanged;

  const TaskCard({super.key, this.onChanged, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.subtitle),
        leading: Row(
          children: [
            const Icon(Icons.check_circle),
            Checkbox(value: task.isChecked, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
