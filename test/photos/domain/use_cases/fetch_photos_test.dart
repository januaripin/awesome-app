import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart';
import 'package:awesome_app/photos/domain/use_cases/fetch_photos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_photos_test.mocks.dart';

@GenerateMocks([PhotosRepository])
void main() {
  final mockRepository = MockPhotosRepository();

  test('fetch photos use case', () async {
    final useCase = FetchPhotos(mockRepository);
    final photos = <Photo>[];

    for (var i = 1; i <= 15; i++) {
      photos.add(
        Photo(
          id: i,
          width: 720,
          height: 600,
          photographerId: i,
          photographer: 'Photographer $i',
          src: const PhotoSrc(),
        ),
      );
    }

    when(mockRepository.fetchPhotos(1)).thenAnswer((_) async => photos);

    final result = await useCase.call(1);

    expect(result.first.id, photos.first.id);
    expect(result.last.id, photos.last.id);
  });
}
