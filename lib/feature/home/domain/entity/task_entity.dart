class TaskEntity {
  final int id;
  final String title;
  final String subtitle;
  final String time;
  final String status;

  final bool isChecked;

  TaskEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.isChecked,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'time': time,
      'status': status,
      'isChecked': isChecked,
    };
  }
}
