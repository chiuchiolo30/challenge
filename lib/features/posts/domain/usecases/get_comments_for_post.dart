import 'package:challenge/core/error/failures.dart';
import 'package:challenge/core/usecases/usecase.dart';
import 'package:challenge/features/posts/domain/entities/comment.dart';
import 'package:challenge/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommentsForPost implements UseCase<List<Comment>, Params> {
  final PostRepository repository;

  GetCommentsForPost(this.repository);

  @override
  Future<Either<Failure, List<Comment>>> call(Params params) async {
    return await repository.getCommentsForPost(params.postId);
  }
}

class Params {
  final int postId;

  Params({required this.postId});
}
