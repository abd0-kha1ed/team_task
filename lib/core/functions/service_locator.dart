import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/feature/add_new_task/data/data_source/add_new_task_remote_data_source.dart';
import 'package:team_task/feature/add_new_task/data/repo/add_new_task_repo_impl.dart';
import 'package:team_task/feature/auth/data/data_source/remote_data_source.dart';
import 'package:team_task/feature/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator(SharedPreferences sharedPreferences) async {
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerSingleton<DioConsumer>(DioConsumer(Dio()));

  getIt.registerSingleton<RemoteDataSource>(
    RemoteDataSource(api: getIt.get<DioConsumer>()),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(remoteDataSource: getIt.get<RemoteDataSource>()),
  );

  getIt.registerSingleton<AddNewTaskRemoteDataSource>(
    AddNewTaskRemoteDataSource(dio: getIt.get<DioConsumer>()),
  );
  getIt.registerSingleton<AddNewTaskRepoImpl>(
    AddNewTaskRepoImpl(
      addNewTaskRemoteDataSource: getIt.get<AddNewTaskRemoteDataSource>(),
    ),
  );
}
