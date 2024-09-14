part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends PostEvent {}

class ToggleLikeEvent extends PostEvent {
  final int postId;

  const ToggleLikeEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}
