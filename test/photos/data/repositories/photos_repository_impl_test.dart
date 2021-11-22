import 'package:awesome_app/photos/data/data_sources/photos_remote_data_source.dart';
import 'package:awesome_app/photos/data/models/photo_model.dart';
import 'package:awesome_app/photos/data/models/photo_src_model.dart';
import 'package:awesome_app/photos/data/repositories/photos_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'photos_repository_impl_test.mocks.dart';

@GenerateMocks([PhotosRemoteDataSource, InternetConnectionChecker])
void main() {
  final mockDataSource = MockPhotosRemoteDataSource();
  final mockInternet = MockInternetConnectionChecker();

  void runTestOnline(Function body, {bool isOnline = false}) {
    group('device is ${isOnline ? 'online' : 'offline'}', () {
      setUp(() {
        when(mockInternet.hasConnection).thenAnswer((_) async => isOnline);
      });

      body();
    });
  }

  runTestOnline(() {
    test('fetch photos when online', () async {
      final photos = <PhotoModel>[];
      for (var i = 1; i <= 15; i++) {
        photos.add(PhotoModel(
          id: i,
          width: 720,
          height: 600,
          photographerId: i,
          photographer: 'Photographer $i',
          src: const PhotoSrcModel(),
        ));
      }

      when(mockDataSource.fetchPhotos(1)).thenAnswer(
        (_) async => photos,
      );

      final repository = PhotosRepositoryImpl(mockDataSource, mockInternet);

      final result = await repository.fetchPhotos(1);

      expect(result.first.id, equals(photos.first.id));
      expect(result.last.id, equals(photos.last.id));
    });
  }, isOnline: true);
}
