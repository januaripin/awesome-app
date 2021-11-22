import 'dart:convert';

import 'package:awesome_app/photos/data/models/photo_model.dart';
import 'package:http/http.dart' as http;

abstract class PhotosRemoteDataSource {
  Future<List<PhotoModel>> fetchPhotos(int page);
}

class PhotosRemoteDataSourceImpl extends PhotosRemoteDataSource {
  PhotosRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<List<PhotoModel>> fetchPhotos(int page) async {
    final response = await client.get(
        Uri.parse('https://api.pexels.com/v1/curated?page=$page'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001d2da54bce6e340e7bea126e210105083'
        });

    if (response.statusCode == 200) {
      return PhotoModel.jsonToList(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch photos');
    }
  }
}
