import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title, subtitle, time, status;
  final Color statusColor;
  final bool isChecked;
   final Function(bool?)? onChanged;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor, required this.isChecked, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(status, style: TextStyle(color: statusColor)),
        leading: Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
