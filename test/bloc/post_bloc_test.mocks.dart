// Mocks generated by Mockito 5.4.4 from annotations
// in challenge/test/bloc/post_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:challenge/core/error/failures.dart' as _i6;
import 'package:challenge/core/usecases/usecase.dart' as _i8;
import 'package:challenge/features/posts/domain/entities/post.dart' as _i7;
import 'package:challenge/features/posts/domain/repositories/post_repository.dart'
    as _i2;
import 'package:challenge/features/posts/domain/usecases/get_posts.dart' as _i4;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePostRepository_0 extends _i1.SmartFake
    implements _i2.PostRepository {
  _FakePostRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetPosts].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPosts extends _i1.Mock implements _i4.GetPosts {
  MockGetPosts() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PostRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakePostRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.PostRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Post>>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.Post>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.Post>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Post>>>);
}
