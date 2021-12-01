import 'package:awesome_app/photos/data/data_sources/photos_remote_data_source.dart';
import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  PhotosRepositoryImpl(PhotosRemoteDataSource dataSource,
      InternetConnectionChecker connectionAvailability)
      : _dataSource = dataSource,
        _connectionAvailability = connectionAvailability;

  final PhotosRemoteDataSource _dataSource;
  final InternetConnectionChecker _connectionAvailability;

  @override
  Future<Either<Failure, List<Photo>>> fetchPhotos(int page) async {
    if (!(await _connectionAvailability.hasConnection)) {
      return const Left(NoInternetFailure());
    }

    try {
      final result = await _dataSource.fetchPhotos(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    }
  }
}
