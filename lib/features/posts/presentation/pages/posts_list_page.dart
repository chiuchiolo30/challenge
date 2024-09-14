import 'package:challenge/features/posts/presentation/bloc/posts/post_bloc.dart';
import 'package:challenge/features/posts/presentation/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostEmpty) {
            BlocProvider.of<PostBloc>(context).add(GetPostsEvent());
          } else if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostItem(post: state.posts[index]);
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}


