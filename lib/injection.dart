import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_app/core/network/networking_info.dart';
import 'package:task_app/features/task_app/data/datasources/local/task_local_datasource.dart';
import 'package:task_app/features/task_app/data/datasources/local/user_local_datasource.dart';
import 'package:task_app/features/task_app/data/datasources/remote/task_remote_datasource.dart';
import 'package:task_app/features/task_app/data/datasources/remote/user_remote_datasource.dart';
import 'package:task_app/features/task_app/data/repositories/task_repository_imp.dart';
import 'package:task_app/features/task_app/data/repositories/user_repository_imp.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';
import 'package:task_app/features/task_app/domain/repositories/user_repository.dart';
import 'package:task_app/features/task_app/domain/usecases/add_task/add_task.dart';
import 'package:task_app/features/task_app/domain/usecases/delete_task/delete_task.dart';
import 'package:task_app/features/task_app/domain/usecases/get_all_tasks/get_all_tasks.dart';
import 'package:task_app/features/task_app/domain/usecases/login/login.dart';
import 'package:task_app/features/task_app/domain/usecases/logout/logout.dart';
import 'package:task_app/features/task_app/domain/usecases/register_user/register_user.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => UserBloc(
      loginImp: sl(),
      logoutImp: sl(),
      registerUserImp: sl(),
    ),
  );

  sl.registerFactory(
    () => TaskBloc(
      getAllTasks: sl(),
      addTask: sl(),
      deleteTask: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginImp(userRepository: sl()));
  sl.registerLazySingleton(() => LogoutImp(userRepository: sl()));
  sl.registerLazySingleton(() => RegisterUserImp(userRepository: sl()));
  sl.registerLazySingleton(() => GetAllTasks(taskRepository: sl()));
  sl.registerLazySingleton(() => AddTask(taskRepository: sl()));
  sl.registerLazySingleton(() => DeleteTask(taskRepository: sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImp(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImp(
      client: sl(),
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImp(
      client: sl(),
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
