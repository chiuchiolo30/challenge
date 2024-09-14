import 'package:bloc_test/bloc_test.dart';
import 'package:challenge/core/error/failures.dart';
import 'package:challenge/core/usecases/usecase.dart';
import 'package:challenge/features/posts/domain/entities/post.dart';
import 'package:challenge/features/posts/domain/usecases/get_posts.dart';
import 'package:challenge/features/posts/presentation/bloc/posts/post_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_bloc_test.mocks.dart';


@GenerateMocks([GetPosts])
void main() {
  late PostBloc postBloc;
  late MockGetPosts mockGetPosts;

  setUp(() {
    mockGetPosts = MockGetPosts();
    postBloc = PostBloc(getPosts: mockGetPosts);
  });

  test('initial state should be PostEmpty', () {
    expect(postBloc.state, equals(PostEmpty()));
  });

  group('GetPostsEvent', () {
    final tPosts = [
      const Post(id: 1, userId: 1, title: 'Test Post 1', body: 'Test Body 1', isLiked: false),
      const Post(id: 2, userId: 2, title: 'Test Post 2', body: 'Test Body 2', isLiked: false),
    ];

    blocTest<PostBloc, PostState>(
      'should emit [PostLoading, PostLoaded] when data is gotten successfully',
      build: () {
        when(mockGetPosts(any)).thenAnswer((_) async => Right(tPosts));
        return postBloc;
      },
      act: (bloc) => bloc.add(GetPostsEvent()),
      expect: () => [PostLoading(), PostLoaded(posts: tPosts)],
      verify: (_) {
        verify(mockGetPosts(NoParams()));
      },
    );

    blocTest<PostBloc, PostState>(
      'should emit [PostLoading, PostError] when getting data fails',
      build: () {
        when(mockGetPosts(any)).thenAnswer((_) async => Left(ServerFailure()));
        return postBloc;
      },
      act: (bloc) => bloc.add(GetPostsEvent()),
      expect: () => [PostLoading(), const PostError(message: serverFailureMessage)],
      verify: (_) {
        verify(mockGetPosts(NoParams()));
      },
    );
  });

  group('ToggleLikeEvent', () {
    final tPosts = [
      const Post(id: 1, userId: 1, title: 'Test Post 1', body: 'Test Body 1', isLiked: false),
      const Post(id: 2, userId: 2, title: 'Test Post 2', body: 'Test Body 2', isLiked: false),
    ];

    blocTest<PostBloc, PostState>(
      'should toggle the like status of the post',
      build: () {
        return postBloc;
      },
      seed: () => PostLoaded(posts: tPosts),
      act: (bloc) => bloc.add(const ToggleLikeEvent(postId: 1)),
      expect: () => [
        const PostLoaded(posts: [
          Post(id: 1, userId: 1, title: 'Test Post 1', body: 'Test Body 1', isLiked: true),
          Post(id: 2, userId: 2, title: 'Test Post 2', body: 'Test Body 2', isLiked: false),
        ]),
      ],
    );
  });
}