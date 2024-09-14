import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:challenge/features/posts/presentation/bloc/posts/post_bloc.dart';
import 'package:challenge/features/posts/presentation/pages/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(post.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            subtitle: Text(post.body, style: const TextStyle(fontSize: 12)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(post: post),
                ),
              );
            },
          ),
          const Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
              indent: 16,
              endIndent: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              icon: Icon(
                post.isLiked ? Icons.favorite : Icons.favorite_border,
                color: post.isLiked ? Colors.red : Colors.grey,
                size: 18,
              ),
              label: const Text(
                'Me gusta',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                BlocProvider.of<PostBloc>(context)
                    .add(ToggleLikeEvent(postId: post.id));
              },
            ),
          ),
        ],
      ),
    );
  }
}
