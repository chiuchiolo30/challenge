import 'package:challenge/features/posts/presentation/bloc/comments/comment_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/posts/data/datasources/post_remote_data_source.dart';
import 'features/posts/data/repositories/post_repository_impl.dart';
import 'features/posts/domain/repositories/post_repository.dart';
import 'features/posts/domain/usecases/get_comments_for_post.dart';
import 'features/posts/domain/usecases/get_posts.dart';
import 'features/posts/presentation/bloc/posts/post_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => PostBloc(
      getPosts: sl()
    ),
  );

  sl.registerFactory(
    () => CommentBloc(
      getCommentsForPost: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetPosts(sl()));
  sl.registerLazySingleton(() => GetCommentsForPost(sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => Dio());

  // Bloc Providers Initialization
  blocProviders = [
    BlocProvider<PostBloc>(create: (_) => sl<PostBloc>()),
    // BlocProvider<CommentBloc>(create: (_) => sl<CommentBloc>()),
  ];
}

List<BlocProvider> blocProviders = [];