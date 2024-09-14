import 'package:challenge/features/posts/domain/entities/comment.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      color: Colors.white,
      child: ListTile(
        title: Text(
          comment.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.body,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const Divider(color: Colors.grey, indent: 0, endIndent: 1),
            Text(
              comment.email,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
