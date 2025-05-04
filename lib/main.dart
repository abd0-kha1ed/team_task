import 'package:flutter/material.dart';
import 'package:team_task/core/helper_functions/on_generate_routes.dart';

void main() {
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
const TaskyApp({ super.key });
@override
Widget build(BuildContext context) {
return MaterialApp(
  onGenerateRoute: onGenerateRoutes,
);
}
}