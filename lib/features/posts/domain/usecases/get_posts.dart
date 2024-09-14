import 'package:challenge/core/error/failures.dart';
import 'package:challenge/core/usecases/usecase.dart';
import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:challenge/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPosts implements UseCase<List<Post>, NoParams> {
  final PostRepository repository;

  GetPosts(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}