
import 'package:bloc/bloc.dart';
import 'package:challenge/core/error/failures.dart';
import 'package:challenge/features/posts/domain/entities/comment.dart';
import 'package:challenge/features/posts/domain/usecases/get_comments_for_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentsForPost getCommentsForPost;

  CommentBloc({required this.getCommentsForPost}) : super(CommentEmpty()) {
    on<GetCommentsForPostEvent>((event, emit) async {
      emit(CommentLoading());
      final Either<Failure, List<Comment>> failureOrComments =
          await getCommentsForPost(Params(postId: event.postId));
      emit(failureOrComments.fold(
        (failure) => CommentError(message: _mapFailureToMessage(failure)),
        (comments) => CommentLoaded(comments: comments),
      ));
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