import 'package:flutter/material.dart';

class TaskTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const TaskTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['All Tasks', 'On Going', 'Completed'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabs.length,
          (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Text(
              tabs[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
