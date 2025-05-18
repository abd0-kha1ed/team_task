import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';
import 'package:team_task/core/functions/custom_bloc_observer.dart';
import 'package:team_task/core/functions/on_generate_routes.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/feature/home/data/repo/task_repo_impl.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:team_task/feature/splash/presentation/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await CacheHelper.init();
  setupServiceLocator(sharedPreferences);
  Bloc.observer = CustomBlocObserver();

  getIt.registerLazySingleton<TaskCubit>(() => TaskCubit(taskRepo: getIt<TaskRepoImpl>()));
final token = CacheHelper.getData(key: ApiKey.token);
log('📌 Current Token: $token');

  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>.value(
      value: getIt<TaskCubit>(), 
      child: MaterialApp(
        onGenerateRoute: onGenerateRoutes,
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
