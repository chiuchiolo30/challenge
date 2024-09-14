import 'package:bloc/bloc.dart';
import 'package:challenge/core/error/failures.dart';
import 'package:challenge/core/usecases/usecase.dart';
import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:challenge/features/posts/domain/usecases/get_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc({
    required this.getPosts,
  }) : super(PostEmpty()) {
    on<GetPostsEvent>((event, emit) async {
      emit(PostLoading());
      final Either<Failure, List<Post>> failureOrPosts =
          await getPosts(NoParams());
      emit(failureOrPosts.fold(
        (failure) => PostError(message: _mapFailureToMessage(failure)),
        (posts) => PostLoaded(posts: posts),
      ));
    });

    on<ToggleLikeEvent>((event, emit) async {
      final currentState = state;
      if (currentState is PostLoaded) {
        final updatedPosts = currentState.posts.map((post) {
          if (post.id == event.postId) {
            return Post(
              id: post.id,
              userId: post.userId,
              title: post.title,
              body: post.body,
              isLiked: !post.isLiked,
            );
          }
          return post;
        }).toList();

        emit(PostLoaded(posts: updatedPosts));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return serverFailureMessage;
      case const (CacheFailure):
        return cacheFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
