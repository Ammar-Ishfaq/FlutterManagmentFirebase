import 'package:ohaino/repository/comment/comment_repository.dart';
import 'package:ohaino/viewmodel/comment/bloc/comment_bloc.dart';
import 'package:ohaino/repository/post/post_repository.dart';
import 'package:ohaino/repository/todo/todo_repository.dart';
import 'package:ohaino/repository/user/user_repository.dart';
import 'package:ohaino/viewmodel/post/bloc/post_bloc.dart';
import 'package:ohaino/viewmodel/todo/bloc/todo_bloc.dart';
import 'package:ohaino/viewmodel/user/bloc/user_bloc.dart';
import 'package:ohaino/data/api/comment/comment_api.dart';
import 'package:ohaino/common/network/dio_client.dart';
import 'package:ohaino/data/api/post/post_api.dart';
import 'package:ohaino/data/api/todo/todo_api.dart';
import 'package:ohaino/data/api/user/user_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  // User api
  getIt.registerLazySingleton<UserApi>(
      () => UserApi(dioClient: getIt<DioClient>()));

  // _Todo api
  getIt.registerLazySingleton<ToDoApi>(
      () => ToDoApi(dioClient: getIt<DioClient>()));

  // Post api
  getIt.registerLazySingleton<PostApi>(
      () => PostApi(dioClient: getIt<DioClient>()));

  // Comment api
  getIt.registerLazySingleton<CommentApi>(
      () => CommentApi(dioClient: getIt<DioClient>()));

  // User repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(userApi: getIt<UserApi>()),
  );

// _Todo repository
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepository(todoApi: getIt<ToDoApi>()),
  );

  // Post repository
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepository(postApi: getIt<PostApi>()),
  );
  // Comment repository
  getIt.registerLazySingleton<CommentRepository>(
    () => CommentRepository(commentApi: getIt<CommentApi>()),
  );

  //User Bloc
  getIt
      .registerFactory(() => UserBloc(userRepository: getIt<UserRepository>()));

  //_Todo Bloc
  getIt
      .registerFactory(() => TodoBloc(todoRepository: getIt<TodoRepository>()));

  //Post Bloc
  getIt
      .registerFactory(() => PostBloc(postRepository: getIt<PostRepository>()));

  //Comment Bloc
  getIt.registerFactory(
      () => CommentBloc(commentRepository: getIt<CommentRepository>()));
}
