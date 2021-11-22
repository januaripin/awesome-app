// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:awesome_app/photos/data/data_sources/photos_remote_data_source.dart';
import 'package:awesome_app/photos/data/models/photo_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'photos_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([],
    customMocks: [MockSpec<http.Client>(returnNullOnMissingStub: true)])
void main() {
  MockClient mockClient;
  PhotosRemoteDataSourceImpl remoteDataSource;
  setUp(() {
    mockClient = MockClient();
    remoteDataSource = PhotosRemoteDataSourceImpl(mockClient);
  });

  test('fetch photos from remote data source', () async {
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(
        fixture('curated.json'),
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      ),
    );

    final result = await remoteDataSource.fetchPhotos(1);

    expect(result, PhotoModel.jsonToList(jsonDecode(fixture('curated.json'))));
  });
}
