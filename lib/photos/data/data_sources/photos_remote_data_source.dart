import 'package:awesome_app/photos/data/models/photo_model.dart';

abstract class PhotosRemoteDataSource {
  Future<List<PhotoModel>> fetchPhotos(int page);
}