

import 'package:challenge/core/error/exceptions.dart';
import 'package:dio/dio.dart';

import '../models/comment_model.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
  Future<List<CommentModel>> getCommentsForPost(int postId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CommentModel>> getCommentsForPost(int postId) async {
    final response = await client.get('https://jsonplaceholder.typicode.com/comments', queryParameters: {'postId': postId});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    } else {
      throw ServerException();
    }
  }
}