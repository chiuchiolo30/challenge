
import 'package:challenge/core/error/exceptions.dart';
import 'package:challenge/core/error/failures.dart';
import 'package:challenge/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:challenge/features/posts/domain/entities/comment.dart';
import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:challenge/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final remotePosts = await remoteDataSource.getPosts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getCommentsForPost(int postId) async {
    try {
      final remoteComments = await remoteDataSource.getCommentsForPost(postId);
      return Right(remoteComments);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}