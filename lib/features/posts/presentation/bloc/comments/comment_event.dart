
part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class GetCommentsForPostEvent extends CommentEvent {
  final int postId;

  const GetCommentsForPostEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}