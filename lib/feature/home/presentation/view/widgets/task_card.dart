import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title, subtitle, time, status;
  final Color statusColor;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(status, style: TextStyle(color: statusColor)),
        leading: const Icon(Icons.access_time, color: Colors.grey),
      ),
    );
  }
}
