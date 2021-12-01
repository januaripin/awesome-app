import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart';
import 'package:awesome_app/photos/domain/use_cases/fetch_photos.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_photos_test.mocks.dart';

@GenerateMocks([PhotosRepository])
void main() {
  late MockPhotosRepository mockRepository;
  late FetchPhotos useCase;

  setUp(() {
    mockRepository = MockPhotosRepository();
    useCase = FetchPhotos(mockRepository);
  });

  test('should success when fetching photos', () async {
    // arrange
    when(mockRepository.fetchPhotos(any))
        .thenAnswer((_) async => Right(<Photo>[]));

    // act
    final result = await useCase.call(1);

    // assert
    expect(result, isA<Right<Failure, List<Photo>>>());
    verify(mockRepository.fetchPhotos(any));
  });

  test('should failure when fetching photos', () async {
    // arrange
    when(mockRepository.fetchPhotos(any))
        .thenAnswer((_) async => Left(NoInternetFailure()));

    // act
    final result = await useCase.call(1);

    // assert
    verify(mockRepository.fetchPhotos(any));
    expect(result, isA<Left<Failure, List<Photo>>>());
  });
}
