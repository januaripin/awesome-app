import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class FetchPhotos extends UseCase<List<Photo>, int> {
  FetchPhotos(PhotosRepository repository) : _repository = repository;

  final PhotosRepository _repository;

  @override
  Future<Either<Failure, List<Photo>>> call(int params) async {
    return await _repository.fetchPhotos(params);
  }
}
