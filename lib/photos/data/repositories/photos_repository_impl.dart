import 'package:awesome_app/photos/data/data_sources/photos_remote_data_source.dart';
import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  PhotosRepositoryImpl(PhotosRemoteDataSource dataSource,
      InternetConnectionChecker connectionAvailability)
      : _dataSource = dataSource,
        _connectionAvailability = connectionAvailability;

  final PhotosRemoteDataSource _dataSource;
  final InternetConnectionChecker _connectionAvailability;

  @override
  Future<List<Photo>> fetchPhotos(int page) async {
    if (!(await _connectionAvailability.hasConnection)) {
      return Future.error('No internet connection. Please check your connection internet!');
    }

    return await _dataSource.fetchPhotos(page);
  }
}