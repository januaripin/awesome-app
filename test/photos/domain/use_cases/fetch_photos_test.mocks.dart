// Mocks generated by Mockito 5.0.16 from annotations
// in awesome_app/test/photos/domain/use_cases/fetch_photos_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:awesome_app/photos/domain/entities/photo.dart' as _i4;
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [PhotosRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhotosRepository extends _i1.Mock implements _i2.PhotosRepository {
  MockPhotosRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Photo>> fetchPhotos(int? page) =>
      (super.noSuchMethod(Invocation.method(#fetchPhotos, [page]),
              returnValue: Future<List<_i4.Photo>>.value(<_i4.Photo>[]))
          as _i3.Future<List<_i4.Photo>>);
  @override
  String toString() => super.toString();
}
