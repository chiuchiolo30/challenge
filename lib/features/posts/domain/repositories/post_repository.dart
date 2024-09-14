import 'package:challenge/core/error/failures.dart';
import 'package:challenge/features/posts/domain/entities/comment.dart';
import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, List<Comment>>> getCommentsForPost(int postId);
}