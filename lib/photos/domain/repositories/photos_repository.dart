import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class PhotosRepository {
  Future<Either<Failure,List<Photo>>> fetchPhotos(int page);
}
