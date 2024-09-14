
import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:challenge/features/posts/presentation/bloc/comments/comment_bloc.dart';
import 'package:challenge/features/posts/presentation/bloc/posts/post_bloc.dart';
import 'package:challenge/features/posts/presentation/widgets/comment_item.dart';
import 'package:challenge/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<CommentBloc>(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Comments for post ${post.id}'),
          actions: [
            _LikeButton(postId: post.id, isLiked: post.isLiked),
          ],
        ),
        body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentEmpty) {
              BlocProvider.of<CommentBloc>(context)
                  .add(GetCommentsForPostEvent(postId: post.id));
            } else if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentLoaded) {
              return state.comments.isEmpty
                  ? const Center(child: Text('No comments found'))
                  : ListView.builder(
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        return CommentItem(comment: state.comments[index]);
                      },
                    );
            } else if (state is CommentError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  final int postId;
  final bool isLiked;

  const _LikeButton({required this.postId, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        bool liked = isLiked;
        if (state is PostLoaded) {
          final updatedPost = state.posts.firstWhere((p) => p.id == postId);
          liked = updatedPost.isLiked;
        }
        return IconButton(
          color: liked ? Colors.red : Colors.grey,
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            BlocProvider.of<PostBloc>(context)
                .add(ToggleLikeEvent(postId: postId));
          },
        );
      },
    );
  }
}
