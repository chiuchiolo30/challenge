import 'package:bloc_test/bloc_test.dart';
import 'package:challenge/core/error/failures.dart';
import 'package:challenge/features/posts/domain/entities/comment.dart';
import 'package:challenge/features/posts/domain/usecases/get_comments_for_post.dart';
import 'package:challenge/features/posts/presentation/bloc/comments/comment_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'comment_bloc_test.mocks.dart';


@GenerateMocks([GetCommentsForPost])
void main() {
  late CommentBloc commentBloc;
  late MockGetCommentsForPost mockGetCommentsForPost;

  setUp(() {
    mockGetCommentsForPost = MockGetCommentsForPost();
    commentBloc = CommentBloc(getCommentsForPost: mockGetCommentsForPost);
  });

  test('initial state should be CommentEmpty', () {
    expect(commentBloc.state, equals(CommentEmpty()));
  });

  blocTest<CommentBloc, CommentState>(
    'emits [CommentLoading, CommentLoaded] when GetCommentsForPostEvent is added and data is fetched successfully',
    build: () {
      when(mockGetCommentsForPost(any))
          .thenAnswer((_) async => const Right([Comment(id: 1, body: 'Test Comment', postId: 1, email: 'xxx@example.com', name: 'Test User')]));
      return commentBloc;
    },
    act: (bloc) => bloc.add(const GetCommentsForPostEvent(postId: 1)),
    expect: () => [
      CommentLoading(),
      const CommentLoaded(comments: [Comment(id: 1, body: 'Test Comment', postId: 1, email: 'xxx@example.com', name: 'Test User')]),
    ],
  );

  blocTest<CommentBloc, CommentState>(
    'emits [CommentLoading, CommentError] when GetCommentsForPostEvent is added and fetching data fails',
    build: () {
      when(mockGetCommentsForPost(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      return commentBloc;
    },
    act: (bloc) => bloc.add(const GetCommentsForPostEvent(postId: 1)),
    expect: () => [
      CommentLoading(),
      const CommentError(message: serverFailureMessage),
    ],
  );
}