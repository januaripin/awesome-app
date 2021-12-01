import 'package:awesome_app/photos/data/data_sources/photos_remote_data_source.dart';
import 'package:awesome_app/photos/data/models/photo_model.dart';
import 'package:awesome_app/photos/data/repositories/photos_repository_impl.dart';
import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'photos_repository_impl_test.mocks.dart';

@GenerateMocks([PhotosRemoteDataSource, InternetConnectionChecker])
void main() {
  late MockPhotosRemoteDataSource mockDataSource;
  late MockInternetConnectionChecker mockInternet;
  late PhotosRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockPhotosRemoteDataSource();
    mockInternet = MockInternetConnectionChecker();
    repository = PhotosRepositoryImpl(mockDataSource, mockInternet);
  });

  void runTestOnline(Function body, {bool isOnline = false}) {
    group('device is ${isOnline ? 'online' : 'offline'}, ', () {
      setUp(() {
        when(mockInternet.hasConnection).thenAnswer((_) async => isOnline);
      });

      body();
    });
  }

  runTestOnline(() {
    test('should success when fetching photos', () async {
      // arrange
      when(mockDataSource.fetchPhotos(any))
          .thenAnswer((_) async => <PhotoModel>[]);

      // act
      final result = await repository.fetchPhotos(1);

      // assert
      verify(mockDataSource.fetchPhotos(any));
      expect(result, isA<Right<Failure, List<Photo>>>());
    });
  }, isOnline: true);

  runTestOnline(() {
    test('should return ServerFailure when fetching photos', () async {
      // arrange
      when(mockDataSource.fetchPhotos(any)).thenAnswer(
        (_) async => throw ServerException(
          code: 400,
          message: 'Something went wrong',
        ),
      );

      // act
      final result = await repository.fetchPhotos(1);

      // assert
      verify(mockDataSource.fetchPhotos(any));
      expect(result, isA<Left<Failure, List<Photo>>>());
      expect(result, Left(ServerFailure(code: 400, message: 'Something went wrong')));
    });
  }, isOnline: true);

  runTestOnline(() {
    test(
        'should return NoInternetFailure when fetching photos without internet connection',
        () async {
      // arrange
      when(mockDataSource.fetchPhotos(any))
          .thenAnswer((_) async => <PhotoModel>[]);

      // act
      final result = await repository.fetchPhotos(1);

      // assert
      verifyNever(mockDataSource.fetchPhotos(any));
      expect(result, Left(NoInternetFailure()));
    });
  }, isOnline: false);
}
