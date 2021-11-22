import 'package:awesome_app/photos/domain/entities/photo.dart';

abstract class PhotosRepository {
  Future<List<Photo>> fetchPhotos(int page);
}
