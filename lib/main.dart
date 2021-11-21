import 'package:awesome_app/photos/data/data_sources/photos_remote_data_source.dart';
import 'package:awesome_app/photos/data/repositories/photos_repository_impl.dart';
import 'package:awesome_app/photos/domain/repositories/photos_repository.dart';
import 'package:awesome_app/photos/domain/use_cases/fetch_photos.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'photos/presentation/pages/photos_page.dart';

void main() async {
  await di();
  runApp(const AwesomeApp());
}

Future<void> di() async {
  Get.create<InternetConnectionChecker>(() => InternetConnectionChecker());
  Get.lazyPut<http.Client>(() => http.Client());
  Get.lazyPut<PhotosRemoteDataSource>(
    () => PhotosRemoteDataSourceImpl(Get.find()),
  );
  Get.lazyPut<PhotosRepository>(
    () => PhotosRepositoryImpl(Get.find(), Get.find()),
  );
  Get.lazyPut<FetchPhotos>(() => FetchPhotos(Get.find()));
}

class AwesomeApp extends StatelessWidget {
  const AwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App',
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
      home: PhotosPage(),
    );
  }
}
