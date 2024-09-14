import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;
  final bool isLiked;

  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.isLiked = false,
  });

  @override
  List<Object> get props => [id, userId, title, body, isLiked];
}