import 'package:flutter/material.dart';
import 'package:team_task/feature/home/presentation/view/widgets/highlight_card.dart';

class TaskHighlightCard extends StatelessWidget {
  const TaskHighlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        children: [
          HighlightCard(
            label: 'Front end for mobile app',
            status: 'Important',
            progress: 0.7,
            date: 'April 20, 2025',
            time: '09:00 pm',
            statusColor: Colors.red,
          ),
          const SizedBox(width: 12),
          HighlightCard(
            label: 'Back end API',
            status: 'Medium',
            progress: 0.3,
            date: 'May 20, 2025',
            time: '11:00 am',
            statusColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
